// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'scrolling_value_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScrollingValueState {
  double? get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScrollingValueStateCopyWith<ScrollingValueState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScrollingValueStateCopyWith<$Res> {
  factory $ScrollingValueStateCopyWith(
          ScrollingValueState value, $Res Function(ScrollingValueState) then) =
      _$ScrollingValueStateCopyWithImpl<$Res, ScrollingValueState>;
  @useResult
  $Res call({double? value});
}

/// @nodoc
class _$ScrollingValueStateCopyWithImpl<$Res, $Val extends ScrollingValueState>
    implements $ScrollingValueStateCopyWith<$Res> {
  _$ScrollingValueStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScrollingValueStateCopyWith<$Res>
    implements $ScrollingValueStateCopyWith<$Res> {
  factory _$$_ScrollingValueStateCopyWith(_$_ScrollingValueState value,
          $Res Function(_$_ScrollingValueState) then) =
      __$$_ScrollingValueStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? value});
}

/// @nodoc
class __$$_ScrollingValueStateCopyWithImpl<$Res>
    extends _$ScrollingValueStateCopyWithImpl<$Res, _$_ScrollingValueState>
    implements _$$_ScrollingValueStateCopyWith<$Res> {
  __$$_ScrollingValueStateCopyWithImpl(_$_ScrollingValueState _value,
      $Res Function(_$_ScrollingValueState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_ScrollingValueState(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_ScrollingValueState implements _ScrollingValueState {
  const _$_ScrollingValueState({this.value});

  @override
  final double? value;

  @override
  String toString() {
    return 'ScrollingValueState(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScrollingValueState &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScrollingValueStateCopyWith<_$_ScrollingValueState> get copyWith =>
      __$$_ScrollingValueStateCopyWithImpl<_$_ScrollingValueState>(
          this, _$identity);
}

abstract class _ScrollingValueState implements ScrollingValueState {
  const factory _ScrollingValueState({final double? value}) =
      _$_ScrollingValueState;

  @override
  double? get value;
  @override
  @JsonKey(ignore: true)
  _$$_ScrollingValueStateCopyWith<_$_ScrollingValueState> get copyWith =>
      throw _privateConstructorUsedError;
}
