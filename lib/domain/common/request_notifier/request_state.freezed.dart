// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestState<Value> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Value? resultMaybe) loading,
    required TResult Function(Value result) success,
    required TResult Function(Object error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Value? resultMaybe)? loading,
    TResult Function(Value result)? success,
    TResult Function(Object error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Value? resultMaybe)? loading,
    TResult Function(Value result)? success,
    TResult Function(Object error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestStateInitial<Value> value) initial,
    required TResult Function(RequestStateLoading<Value> value) loading,
    required TResult Function(RequestStateSuccess<Value> value) success,
    required TResult Function(RequestStateFailure<Value> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RequestStateInitial<Value> value)? initial,
    TResult Function(RequestStateLoading<Value> value)? loading,
    TResult Function(RequestStateSuccess<Value> value)? success,
    TResult Function(RequestStateFailure<Value> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestStateInitial<Value> value)? initial,
    TResult Function(RequestStateLoading<Value> value)? loading,
    TResult Function(RequestStateSuccess<Value> value)? success,
    TResult Function(RequestStateFailure<Value> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestStateCopyWith<Value, $Res> {
  factory $RequestStateCopyWith(
      RequestState<Value> value, $Res Function(RequestState<Value>) then) =
  _$RequestStateCopyWithImpl<Value, $Res>;
}

/// @nodoc
class _$RequestStateCopyWithImpl<Value, $Res>
    implements $RequestStateCopyWith<Value, $Res> {
  _$RequestStateCopyWithImpl(this._value, this._then);

  final RequestState<Value> _value;
  // ignore: unused_field
  final $Res Function(RequestState<Value>) _then;
}

/// @nodoc
abstract class _$$RequestStateInitialCopyWith<Value, $Res> {
  factory _$$RequestStateInitialCopyWith(_$RequestStateInitial<Value> value,
      $Res Function(_$RequestStateInitial<Value>) then) =
  __$$RequestStateInitialCopyWithImpl<Value, $Res>;
}

/// @nodoc
class __$$RequestStateInitialCopyWithImpl<Value, $Res>
    extends _$RequestStateCopyWithImpl<Value, $Res>
    implements _$$RequestStateInitialCopyWith<Value, $Res> {
  __$$RequestStateInitialCopyWithImpl(_$RequestStateInitial<Value> _value,
      $Res Function(_$RequestStateInitial<Value>) _then)
      : super(_value, (v) => _then(v as _$RequestStateInitial<Value>));

  @override
  _$RequestStateInitial<Value> get _value =>
      super._value as _$RequestStateInitial<Value>;
}

/// @nodoc

class _$RequestStateInitial<Value> implements RequestStateInitial<Value> {
  const _$RequestStateInitial();

  @override
  String toString() {
    return 'RequestState<$Value>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestStateInitial<Value>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Value? resultMaybe) loading,
    required TResult Function(Value result) success,
    required TResult Function(Object error) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Value? resultMaybe)? loading,
    TResult Function(Value result)? success,
    TResult Function(Object error)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Value? resultMaybe)? loading,
    TResult Function(Value result)? success,
    TResult Function(Object error)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestStateInitial<Value> value) initial,
    required TResult Function(RequestStateLoading<Value> value) loading,
    required TResult Function(RequestStateSuccess<Value> value) success,
    required TResult Function(RequestStateFailure<Value> value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RequestStateInitial<Value> value)? initial,
    TResult Function(RequestStateLoading<Value> value)? loading,
    TResult Function(RequestStateSuccess<Value> value)? success,
    TResult Function(RequestStateFailure<Value> value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestStateInitial<Value> value)? initial,
    TResult Function(RequestStateLoading<Value> value)? loading,
    TResult Function(RequestStateSuccess<Value> value)? success,
    TResult Function(RequestStateFailure<Value> value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RequestStateInitial<Value> implements RequestState<Value> {
  const factory RequestStateInitial() = _$RequestStateInitial<Value>;
}

/// @nodoc
abstract class _$$RequestStateLoadingCopyWith<Value, $Res> {
  factory _$$RequestStateLoadingCopyWith(_$RequestStateLoading<Value> value,
      $Res Function(_$RequestStateLoading<Value>) then) =
  __$$RequestStateLoadingCopyWithImpl<Value, $Res>;
  $Res call({Value? resultMaybe});
}

/// @nodoc
class __$$RequestStateLoadingCopyWithImpl<Value, $Res>
    extends _$RequestStateCopyWithImpl<Value, $Res>
    implements _$$RequestStateLoadingCopyWith<Value, $Res> {
  __$$RequestStateLoadingCopyWithImpl(_$RequestStateLoading<Value> _value,
      $Res Function(_$RequestStateLoading<Value>) _then)
      : super(_value, (v) => _then(v as _$RequestStateLoading<Value>));

  @override
  _$RequestStateLoading<Value> get _value =>
      super._value as _$RequestStateLoading<Value>;

  @override
  $Res call({
    Object? resultMaybe = freezed,
  }) {
    return _then(_$RequestStateLoading<Value>(
      resultMaybe: resultMaybe == freezed
          ? _value.resultMaybe
          : resultMaybe // ignore: cast_nullable_to_non_nullable
      as Value?,
    ));
  }
}

/// @nodoc

class _$RequestStateLoading<Value> implements RequestStateLoading<Value> {
  const _$RequestStateLoading({this.resultMaybe});

  @override
  final Value? resultMaybe;

  @override
  String toString() {
    return 'RequestState<$Value>.loading(resultMaybe: $resultMaybe)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestStateLoading<Value> &&
            const DeepCollectionEquality()
                .equals(other.resultMaybe, resultMaybe));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(resultMaybe));

  @JsonKey(ignore: true)
  @override
  _$$RequestStateLoadingCopyWith<Value, _$RequestStateLoading<Value>>
  get copyWith => __$$RequestStateLoadingCopyWithImpl<Value,
      _$RequestStateLoading<Value>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Value? resultMaybe) loading,
    required TResult Function(Value result) success,
    required TResult Function(Object error) failure,
  }) {
    return loading(resultMaybe);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Value? resultMaybe)? loading,
    TResult Function(Value result)? success,
    TResult Function(Object error)? failure,
  }) {
    return loading?.call(resultMaybe);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Value? resultMaybe)? loading,
    TResult Function(Value result)? success,
    TResult Function(Object error)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(resultMaybe);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestStateInitial<Value> value) initial,
    required TResult Function(RequestStateLoading<Value> value) loading,
    required TResult Function(RequestStateSuccess<Value> value) success,
    required TResult Function(RequestStateFailure<Value> value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RequestStateInitial<Value> value)? initial,
    TResult Function(RequestStateLoading<Value> value)? loading,
    TResult Function(RequestStateSuccess<Value> value)? success,
    TResult Function(RequestStateFailure<Value> value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestStateInitial<Value> value)? initial,
    TResult Function(RequestStateLoading<Value> value)? loading,
    TResult Function(RequestStateSuccess<Value> value)? success,
    TResult Function(RequestStateFailure<Value> value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RequestStateLoading<Value> implements RequestState<Value> {
  const factory RequestStateLoading({final Value? resultMaybe}) =
  _$RequestStateLoading<Value>;

  Value? get resultMaybe;
  @JsonKey(ignore: true)
  _$$RequestStateLoadingCopyWith<Value, _$RequestStateLoading<Value>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestStateSuccessCopyWith<Value, $Res> {
  factory _$$RequestStateSuccessCopyWith(_$RequestStateSuccess<Value> value,
      $Res Function(_$RequestStateSuccess<Value>) then) =
  __$$RequestStateSuccessCopyWithImpl<Value, $Res>;
  $Res call({Value result});
}

/// @nodoc
class __$$RequestStateSuccessCopyWithImpl<Value, $Res>
    extends _$RequestStateCopyWithImpl<Value, $Res>
    implements _$$RequestStateSuccessCopyWith<Value, $Res> {
  __$$RequestStateSuccessCopyWithImpl(_$RequestStateSuccess<Value> _value,
      $Res Function(_$RequestStateSuccess<Value>) _then)
      : super(_value, (v) => _then(v as _$RequestStateSuccess<Value>));

  @override
  _$RequestStateSuccess<Value> get _value =>
      super._value as _$RequestStateSuccess<Value>;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_$RequestStateSuccess<Value>(
      result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
      as Value,
    ));
  }
}

/// @nodoc

class _$RequestStateSuccess<Value> implements RequestStateSuccess<Value> {
  const _$RequestStateSuccess(this.result);

  @override
  final Value result;

  @override
  String toString() {
    return 'RequestState<$Value>.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestStateSuccess<Value> &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  _$$RequestStateSuccessCopyWith<Value, _$RequestStateSuccess<Value>>
  get copyWith => __$$RequestStateSuccessCopyWithImpl<Value,
      _$RequestStateSuccess<Value>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Value? resultMaybe) loading,
    required TResult Function(Value result) success,
    required TResult Function(Object error) failure,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Value? resultMaybe)? loading,
    TResult Function(Value result)? success,
    TResult Function(Object error)? failure,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Value? resultMaybe)? loading,
    TResult Function(Value result)? success,
    TResult Function(Object error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestStateInitial<Value> value) initial,
    required TResult Function(RequestStateLoading<Value> value) loading,
    required TResult Function(RequestStateSuccess<Value> value) success,
    required TResult Function(RequestStateFailure<Value> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RequestStateInitial<Value> value)? initial,
    TResult Function(RequestStateLoading<Value> value)? loading,
    TResult Function(RequestStateSuccess<Value> value)? success,
    TResult Function(RequestStateFailure<Value> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestStateInitial<Value> value)? initial,
    TResult Function(RequestStateLoading<Value> value)? loading,
    TResult Function(RequestStateSuccess<Value> value)? success,
    TResult Function(RequestStateFailure<Value> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class RequestStateSuccess<Value> implements RequestState<Value> {
  const factory RequestStateSuccess(final Value result) =
  _$RequestStateSuccess<Value>;

  Value get result;
  @JsonKey(ignore: true)
  _$$RequestStateSuccessCopyWith<Value, _$RequestStateSuccess<Value>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestStateFailureCopyWith<Value, $Res> {
  factory _$$RequestStateFailureCopyWith(_$RequestStateFailure<Value> value,
      $Res Function(_$RequestStateFailure<Value>) then) =
  __$$RequestStateFailureCopyWithImpl<Value, $Res>;
  $Res call({Object error});
}

/// @nodoc
class __$$RequestStateFailureCopyWithImpl<Value, $Res>
    extends _$RequestStateCopyWithImpl<Value, $Res>
    implements _$$RequestStateFailureCopyWith<Value, $Res> {
  __$$RequestStateFailureCopyWithImpl(_$RequestStateFailure<Value> _value,
      $Res Function(_$RequestStateFailure<Value>) _then)
      : super(_value, (v) => _then(v as _$RequestStateFailure<Value>));

  @override
  _$RequestStateFailure<Value> get _value =>
      super._value as _$RequestStateFailure<Value>;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$RequestStateFailure<Value>(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
      as Object,
    ));
  }
}

/// @nodoc

class _$RequestStateFailure<Value> implements RequestStateFailure<Value> {
  const _$RequestStateFailure(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'RequestState<$Value>.failure(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestStateFailure<Value> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$RequestStateFailureCopyWith<Value, _$RequestStateFailure<Value>>
  get copyWith => __$$RequestStateFailureCopyWithImpl<Value,
      _$RequestStateFailure<Value>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Value? resultMaybe) loading,
    required TResult Function(Value result) success,
    required TResult Function(Object error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Value? resultMaybe)? loading,
    TResult Function(Value result)? success,
    TResult Function(Object error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Value? resultMaybe)? loading,
    TResult Function(Value result)? success,
    TResult Function(Object error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestStateInitial<Value> value) initial,
    required TResult Function(RequestStateLoading<Value> value) loading,
    required TResult Function(RequestStateSuccess<Value> value) success,
    required TResult Function(RequestStateFailure<Value> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RequestStateInitial<Value> value)? initial,
    TResult Function(RequestStateLoading<Value> value)? loading,
    TResult Function(RequestStateSuccess<Value> value)? success,
    TResult Function(RequestStateFailure<Value> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestStateInitial<Value> value)? initial,
    TResult Function(RequestStateLoading<Value> value)? loading,
    TResult Function(RequestStateSuccess<Value> value)? success,
    TResult Function(RequestStateFailure<Value> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class RequestStateFailure<Value> implements RequestState<Value> {
  const factory RequestStateFailure(final Object error) =
  _$RequestStateFailure<Value>;

  Object get error;
  @JsonKey(ignore: true)
  _$$RequestStateFailureCopyWith<Value, _$RequestStateFailure<Value>>
  get copyWith => throw _privateConstructorUsedError;
}
