// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'projects_data_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProjectsDataEvent {
  ProjectsModel? get proojectsModel => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProjectsModel? proojectsModel) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProjectsModel? proojectsModel)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProjectsModel? proojectsModel)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectsDataEventCopyWith<ProjectsDataEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsDataEventCopyWith<$Res> {
  factory $ProjectsDataEventCopyWith(
          ProjectsDataEvent value, $Res Function(ProjectsDataEvent) then) =
      _$ProjectsDataEventCopyWithImpl<$Res, ProjectsDataEvent>;
  @useResult
  $Res call({ProjectsModel? proojectsModel});
}

/// @nodoc
class _$ProjectsDataEventCopyWithImpl<$Res, $Val extends ProjectsDataEvent>
    implements $ProjectsDataEventCopyWith<$Res> {
  _$ProjectsDataEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? proojectsModel = freezed,
  }) {
    return _then(_value.copyWith(
      proojectsModel: freezed == proojectsModel
          ? _value.proojectsModel
          : proojectsModel // ignore: cast_nullable_to_non_nullable
              as ProjectsModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res>
    implements $ProjectsDataEventCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProjectsModel? proojectsModel});
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$ProjectsDataEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? proojectsModel = freezed,
  }) {
    return _then(_$_Started(
      proojectsModel: freezed == proojectsModel
          ? _value.proojectsModel
          : proojectsModel // ignore: cast_nullable_to_non_nullable
              as ProjectsModel?,
    ));
  }
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started({this.proojectsModel});

  @override
  final ProjectsModel? proojectsModel;

  @override
  String toString() {
    return 'ProjectsDataEvent.started(proojectsModel: $proojectsModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Started &&
            (identical(other.proojectsModel, proojectsModel) ||
                other.proojectsModel == proojectsModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, proojectsModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      __$$_StartedCopyWithImpl<_$_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProjectsModel? proojectsModel) started,
  }) {
    return started(proojectsModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProjectsModel? proojectsModel)? started,
  }) {
    return started?.call(proojectsModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProjectsModel? proojectsModel)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(proojectsModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ProjectsDataEvent {
  const factory _Started({final ProjectsModel? proojectsModel}) = _$_Started;

  @override
  ProjectsModel? get proojectsModel;
  @override
  @JsonKey(ignore: true)
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProjectsDataState {
  ProjectsModel? get proojectsModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectsDataStateCopyWith<ProjectsDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsDataStateCopyWith<$Res> {
  factory $ProjectsDataStateCopyWith(
          ProjectsDataState value, $Res Function(ProjectsDataState) then) =
      _$ProjectsDataStateCopyWithImpl<$Res, ProjectsDataState>;
  @useResult
  $Res call({ProjectsModel? proojectsModel});
}

/// @nodoc
class _$ProjectsDataStateCopyWithImpl<$Res, $Val extends ProjectsDataState>
    implements $ProjectsDataStateCopyWith<$Res> {
  _$ProjectsDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? proojectsModel = freezed,
  }) {
    return _then(_value.copyWith(
      proojectsModel: freezed == proojectsModel
          ? _value.proojectsModel
          : proojectsModel // ignore: cast_nullable_to_non_nullable
              as ProjectsModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectsDataStateCopyWith<$Res>
    implements $ProjectsDataStateCopyWith<$Res> {
  factory _$$_ProjectsDataStateCopyWith(_$_ProjectsDataState value,
          $Res Function(_$_ProjectsDataState) then) =
      __$$_ProjectsDataStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProjectsModel? proojectsModel});
}

/// @nodoc
class __$$_ProjectsDataStateCopyWithImpl<$Res>
    extends _$ProjectsDataStateCopyWithImpl<$Res, _$_ProjectsDataState>
    implements _$$_ProjectsDataStateCopyWith<$Res> {
  __$$_ProjectsDataStateCopyWithImpl(
      _$_ProjectsDataState _value, $Res Function(_$_ProjectsDataState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? proojectsModel = freezed,
  }) {
    return _then(_$_ProjectsDataState(
      proojectsModel: freezed == proojectsModel
          ? _value.proojectsModel
          : proojectsModel // ignore: cast_nullable_to_non_nullable
              as ProjectsModel?,
    ));
  }
}

/// @nodoc

class _$_ProjectsDataState implements _ProjectsDataState {
  const _$_ProjectsDataState({this.proojectsModel});

  @override
  final ProjectsModel? proojectsModel;

  @override
  String toString() {
    return 'ProjectsDataState(proojectsModel: $proojectsModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectsDataState &&
            (identical(other.proojectsModel, proojectsModel) ||
                other.proojectsModel == proojectsModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, proojectsModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectsDataStateCopyWith<_$_ProjectsDataState> get copyWith =>
      __$$_ProjectsDataStateCopyWithImpl<_$_ProjectsDataState>(
          this, _$identity);
}

abstract class _ProjectsDataState implements ProjectsDataState {
  const factory _ProjectsDataState({final ProjectsModel? proojectsModel}) =
      _$_ProjectsDataState;

  @override
  ProjectsModel? get proojectsModel;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectsDataStateCopyWith<_$_ProjectsDataState> get copyWith =>
      throw _privateConstructorUsedError;
}
