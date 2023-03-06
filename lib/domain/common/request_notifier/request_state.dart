import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_state.freezed.dart';

@freezed
abstract class RequestState<Value> with _$RequestState<Value> {
  const factory RequestState.initial() = RequestStateInitial<Value>;

  const factory RequestState.loading({Value? resultMaybe}) = RequestStateLoading<Value>;

  const factory RequestState.success(Value result) = RequestStateSuccess<Value>;

  const factory RequestState.failure(Object error) = RequestStateFailure<Value>;
}

extension RequestStateExtension<Value> on RequestState<Value> {
  bool get isInitial => maybeMap(orElse: () => false, initial: (_) => true);
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
  bool get isError => maybeMap(orElse: () => false, failure: (_) => true);
  bool get isSuccess => maybeMap(orElse: () => false, success: (_) => true);

  Value? get value => maybeWhen(orElse: () => null, success: (result) => result);
  Object? get error => maybeWhen(orElse: () => null, failure: (error) => error);
}
