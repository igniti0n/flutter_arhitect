import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_arhitect/domain/common/request_notifier/request_state.dart';
import 'package:flutter_arhitect/domain/global_info_provider.dart';
import 'package:flutter_arhitect/domain/global_loading_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

abstract class RequestNotifier<Value>
    extends StateNotifier<RequestState<Value>> {
  final Ref ref;

  RequestNotifier(
    this.ref, {
    RequestState<Value> initial = const RequestState.initial(),
  }) : super(initial);

  Future<void> executeRequest({
    required ValueGetter<Future<Value>> requestBuilder,
    void Function(Value data)? dataHandler,
    Object Function(Object)? errorHandler,
    bool globalLoading = true,
    bool globalFailure = true,
  }) async {
    try {
      if (globalLoading) {
        showGlobalLoading();
      } else {
        state = state.maybeMap(
          success: (result) => RequestState.loading(resultMaybe: result.value),
          orElse: () => RequestState<Value>.loading(),
        );
      }
      final value = await requestBuilder();
      state = RequestState.success(value);
      dataHandler?.call(value);
    } catch (error, st) {
      log('Request Error', error: error, stackTrace: st);
      final stateError = errorHandler != null ? errorHandler(error) : error;
      if (!globalFailure) {
        state = RequestState.failure(stateError);
      } else if (!globalLoading || globalFailure) {
        if (globalFailure) {
          setGlobalInfo(
            GlobalInfo(message: stateError.toString(), isError: true),
          );
        }
        state = const RequestState.initial();
      }
    } finally {
      clearGlobalLoading();
    }
  }

  void showGlobalLoading() =>
      ref.read(globalLoadingProvider.notifier).update((state) => true);

  void clearGlobalLoading() =>
      ref.read(globalLoadingProvider.notifier).update((state) => false);

  void setGlobalInfo(GlobalInfo? globalInfo) {
    clearGlobalLoading();
    ref
        .read(globalInfoProvider.notifier)
        .update((state) => globalInfo?.copyWith(id: const Uuid().v4()));
  }

  void reset() => state = const RequestState.initial();
}
