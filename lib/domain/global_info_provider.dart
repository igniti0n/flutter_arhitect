import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final globalInfoProvider = StateProvider<GlobalInfo?>((_) => null);

class GlobalInfo extends Equatable {
  final String message;
  final bool isError;
  final String? id;

  const GlobalInfo({required this.message, this.isError = false, this.id});

  GlobalInfo copyWith({String? message, bool? isError, String? id}) =>
      GlobalInfo(
        message: message ?? this.message,
        isError: isError ?? this.isError,
        id: id ?? this.id,
      );

  @override
  List<Object?> get props => [message, isError, id];
}
