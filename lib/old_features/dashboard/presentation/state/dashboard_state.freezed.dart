// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DashboardState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DashboardState()';
  }
}

/// @nodoc
class $DashboardStateCopyWith<$Res> {
  $DashboardStateCopyWith(DashboardState _, $Res Function(DashboardState) __);
}

/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DashboardStateInitial value)? initial,
    TResult Function(_DashboardStateLoading value)? loading,
    TResult Function(_DashboardStateSuccess value)? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardStateInitial() when initial != null:
        return initial(_that);
      case _DashboardStateLoading() when loading != null:
        return loading(_that);
      case _DashboardStateSuccess() when success != null:
        return success(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DashboardStateInitial value) initial,
    required TResult Function(_DashboardStateLoading value) loading,
    required TResult Function(_DashboardStateSuccess value) success,
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardStateInitial():
        return initial(_that);
      case _DashboardStateLoading():
        return loading(_that);
      case _DashboardStateSuccess():
        return success(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DashboardStateInitial value)? initial,
    TResult? Function(_DashboardStateLoading value)? loading,
    TResult? Function(_DashboardStateSuccess value)? success,
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardStateInitial() when initial != null:
        return initial(_that);
      case _DashboardStateLoading() when loading != null:
        return loading(_that);
      case _DashboardStateSuccess() when success != null:
        return success(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<IncidentOutput> items)? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardStateInitial() when initial != null:
        return initial();
      case _DashboardStateLoading() when loading != null:
        return loading();
      case _DashboardStateSuccess() when success != null:
        return success(_that.items);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<IncidentOutput> items) success,
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardStateInitial():
        return initial();
      case _DashboardStateLoading():
        return loading();
      case _DashboardStateSuccess():
        return success(_that.items);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<IncidentOutput> items)? success,
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardStateInitial() when initial != null:
        return initial();
      case _DashboardStateLoading() when loading != null:
        return loading();
      case _DashboardStateSuccess() when success != null:
        return success(_that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DashboardStateInitial implements DashboardState {
  const _DashboardStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DashboardStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DashboardState.initial()';
  }
}

/// @nodoc

class _DashboardStateLoading implements DashboardState {
  const _DashboardStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DashboardStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DashboardState.loading()';
  }
}

/// @nodoc

class _DashboardStateSuccess implements DashboardState {
  const _DashboardStateSuccess(final List<IncidentOutput> items)
      : _items = items;

  final List<IncidentOutput> _items;
  List<IncidentOutput> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardStateSuccessCopyWith<_DashboardStateSuccess> get copyWith =>
      __$DashboardStateSuccessCopyWithImpl<_DashboardStateSuccess>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardStateSuccess &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'DashboardState.success(items: $items)';
  }
}

/// @nodoc
abstract mixin class _$DashboardStateSuccessCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardStateSuccessCopyWith(_DashboardStateSuccess value,
          $Res Function(_DashboardStateSuccess) _then) =
      __$DashboardStateSuccessCopyWithImpl;
  @useResult
  $Res call({List<IncidentOutput> items});
}

/// @nodoc
class __$DashboardStateSuccessCopyWithImpl<$Res>
    implements _$DashboardStateSuccessCopyWith<$Res> {
  __$DashboardStateSuccessCopyWithImpl(this._self, this._then);

  final _DashboardStateSuccess _self;
  final $Res Function(_DashboardStateSuccess) _then;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
  }) {
    return _then(_DashboardStateSuccess(
      null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<IncidentOutput>,
    ));
  }
}

// dart format on
