// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing_incident_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListingIncidentState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ListingIncidentState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListingIncidentState()';
  }
}

/// @nodoc
class $ListingIncidentStateCopyWith<$Res> {
  $ListingIncidentStateCopyWith(
      ListingIncidentState _, $Res Function(ListingIncidentState) __);
}

/// Adds pattern-matching-related methods to [ListingIncidentState].
extension ListingIncidentStatePatterns on ListingIncidentState {
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
    TResult Function(_ListIncidentStateInitial value)? initial,
    TResult Function(_ListIncidentStateLoading value)? loading,
    TResult Function(_ListIncidentStateSuccess value)? success,
    TResult Function(_ListIncidentStateGuard value)? guard,
    TResult Function(_ListIncidentStateError value)? error,
    TResult Function(_ListIncidentStateEmpty value)? empty,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListIncidentStateInitial() when initial != null:
        return initial(_that);
      case _ListIncidentStateLoading() when loading != null:
        return loading(_that);
      case _ListIncidentStateSuccess() when success != null:
        return success(_that);
      case _ListIncidentStateGuard() when guard != null:
        return guard(_that);
      case _ListIncidentStateError() when error != null:
        return error(_that);
      case _ListIncidentStateEmpty() when empty != null:
        return empty(_that);
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
    required TResult Function(_ListIncidentStateInitial value) initial,
    required TResult Function(_ListIncidentStateLoading value) loading,
    required TResult Function(_ListIncidentStateSuccess value) success,
    required TResult Function(_ListIncidentStateGuard value) guard,
    required TResult Function(_ListIncidentStateError value) error,
    required TResult Function(_ListIncidentStateEmpty value) empty,
  }) {
    final _that = this;
    switch (_that) {
      case _ListIncidentStateInitial():
        return initial(_that);
      case _ListIncidentStateLoading():
        return loading(_that);
      case _ListIncidentStateSuccess():
        return success(_that);
      case _ListIncidentStateGuard():
        return guard(_that);
      case _ListIncidentStateError():
        return error(_that);
      case _ListIncidentStateEmpty():
        return empty(_that);
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
    TResult? Function(_ListIncidentStateInitial value)? initial,
    TResult? Function(_ListIncidentStateLoading value)? loading,
    TResult? Function(_ListIncidentStateSuccess value)? success,
    TResult? Function(_ListIncidentStateGuard value)? guard,
    TResult? Function(_ListIncidentStateError value)? error,
    TResult? Function(_ListIncidentStateEmpty value)? empty,
  }) {
    final _that = this;
    switch (_that) {
      case _ListIncidentStateInitial() when initial != null:
        return initial(_that);
      case _ListIncidentStateLoading() when loading != null:
        return loading(_that);
      case _ListIncidentStateSuccess() when success != null:
        return success(_that);
      case _ListIncidentStateGuard() when guard != null:
        return guard(_that);
      case _ListIncidentStateError() when error != null:
        return error(_that);
      case _ListIncidentStateEmpty() when empty != null:
        return empty(_that);
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
    TResult Function(List<IncidentOutput> items, String selectedFilter)?
        success,
    TResult Function(IncidentOutput incident, List<IncidentOutput> items)?
        guard,
    TResult Function(String message)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListIncidentStateInitial() when initial != null:
        return initial();
      case _ListIncidentStateLoading() when loading != null:
        return loading();
      case _ListIncidentStateSuccess() when success != null:
        return success(_that.items, _that.selectedFilter);
      case _ListIncidentStateGuard() when guard != null:
        return guard(_that.incident, _that.items);
      case _ListIncidentStateError() when error != null:
        return error(_that.message);
      case _ListIncidentStateEmpty() when empty != null:
        return empty();
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
    required TResult Function(List<IncidentOutput> items, String selectedFilter)
        success,
    required TResult Function(
            IncidentOutput incident, List<IncidentOutput> items)
        guard,
    required TResult Function(String message) error,
    required TResult Function() empty,
  }) {
    final _that = this;
    switch (_that) {
      case _ListIncidentStateInitial():
        return initial();
      case _ListIncidentStateLoading():
        return loading();
      case _ListIncidentStateSuccess():
        return success(_that.items, _that.selectedFilter);
      case _ListIncidentStateGuard():
        return guard(_that.incident, _that.items);
      case _ListIncidentStateError():
        return error(_that.message);
      case _ListIncidentStateEmpty():
        return empty();
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
    TResult? Function(List<IncidentOutput> items, String selectedFilter)?
        success,
    TResult? Function(IncidentOutput incident, List<IncidentOutput> items)?
        guard,
    TResult? Function(String message)? error,
    TResult? Function()? empty,
  }) {
    final _that = this;
    switch (_that) {
      case _ListIncidentStateInitial() when initial != null:
        return initial();
      case _ListIncidentStateLoading() when loading != null:
        return loading();
      case _ListIncidentStateSuccess() when success != null:
        return success(_that.items, _that.selectedFilter);
      case _ListIncidentStateGuard() when guard != null:
        return guard(_that.incident, _that.items);
      case _ListIncidentStateError() when error != null:
        return error(_that.message);
      case _ListIncidentStateEmpty() when empty != null:
        return empty();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ListIncidentStateInitial implements ListingIncidentState {
  const _ListIncidentStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListIncidentStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListingIncidentState.initial()';
  }
}

/// @nodoc

class _ListIncidentStateLoading implements ListingIncidentState {
  const _ListIncidentStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListIncidentStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListingIncidentState.loading()';
  }
}

/// @nodoc

class _ListIncidentStateSuccess implements ListingIncidentState {
  const _ListIncidentStateSuccess(
      final List<IncidentOutput> items, this.selectedFilter)
      : _items = items;

  final List<IncidentOutput> _items;
  List<IncidentOutput> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final String selectedFilter;

  /// Create a copy of ListingIncidentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListIncidentStateSuccessCopyWith<_ListIncidentStateSuccess> get copyWith =>
      __$ListIncidentStateSuccessCopyWithImpl<_ListIncidentStateSuccess>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListIncidentStateSuccess &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.selectedFilter, selectedFilter) ||
                other.selectedFilter == selectedFilter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), selectedFilter);

  @override
  String toString() {
    return 'ListingIncidentState.success(items: $items, selectedFilter: $selectedFilter)';
  }
}

/// @nodoc
abstract mixin class _$ListIncidentStateSuccessCopyWith<$Res>
    implements $ListingIncidentStateCopyWith<$Res> {
  factory _$ListIncidentStateSuccessCopyWith(_ListIncidentStateSuccess value,
          $Res Function(_ListIncidentStateSuccess) _then) =
      __$ListIncidentStateSuccessCopyWithImpl;
  @useResult
  $Res call({List<IncidentOutput> items, String selectedFilter});
}

/// @nodoc
class __$ListIncidentStateSuccessCopyWithImpl<$Res>
    implements _$ListIncidentStateSuccessCopyWith<$Res> {
  __$ListIncidentStateSuccessCopyWithImpl(this._self, this._then);

  final _ListIncidentStateSuccess _self;
  final $Res Function(_ListIncidentStateSuccess) _then;

  /// Create a copy of ListingIncidentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? selectedFilter = null,
  }) {
    return _then(_ListIncidentStateSuccess(
      null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<IncidentOutput>,
      null == selectedFilter
          ? _self.selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _ListIncidentStateGuard implements ListingIncidentState {
  const _ListIncidentStateGuard(this.incident, final List<IncidentOutput> items)
      : _items = items;

  final IncidentOutput incident;
  final List<IncidentOutput> _items;
  List<IncidentOutput> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of ListingIncidentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListIncidentStateGuardCopyWith<_ListIncidentStateGuard> get copyWith =>
      __$ListIncidentStateGuardCopyWithImpl<_ListIncidentStateGuard>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListIncidentStateGuard &&
            (identical(other.incident, incident) ||
                other.incident == incident) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, incident, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'ListingIncidentState.guard(incident: $incident, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$ListIncidentStateGuardCopyWith<$Res>
    implements $ListingIncidentStateCopyWith<$Res> {
  factory _$ListIncidentStateGuardCopyWith(_ListIncidentStateGuard value,
          $Res Function(_ListIncidentStateGuard) _then) =
      __$ListIncidentStateGuardCopyWithImpl;
  @useResult
  $Res call({IncidentOutput incident, List<IncidentOutput> items});

  $IncidentOutputCopyWith<$Res> get incident;
}

/// @nodoc
class __$ListIncidentStateGuardCopyWithImpl<$Res>
    implements _$ListIncidentStateGuardCopyWith<$Res> {
  __$ListIncidentStateGuardCopyWithImpl(this._self, this._then);

  final _ListIncidentStateGuard _self;
  final $Res Function(_ListIncidentStateGuard) _then;

  /// Create a copy of ListingIncidentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? incident = null,
    Object? items = null,
  }) {
    return _then(_ListIncidentStateGuard(
      null == incident
          ? _self.incident
          : incident // ignore: cast_nullable_to_non_nullable
              as IncidentOutput,
      null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<IncidentOutput>,
    ));
  }

  /// Create a copy of ListingIncidentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IncidentOutputCopyWith<$Res> get incident {
    return $IncidentOutputCopyWith<$Res>(_self.incident, (value) {
      return _then(_self.copyWith(incident: value));
    });
  }
}

/// @nodoc

class _ListIncidentStateError implements ListingIncidentState {
  const _ListIncidentStateError(this.message);

  final String message;

  /// Create a copy of ListingIncidentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListIncidentStateErrorCopyWith<_ListIncidentStateError> get copyWith =>
      __$ListIncidentStateErrorCopyWithImpl<_ListIncidentStateError>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListIncidentStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ListingIncidentState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ListIncidentStateErrorCopyWith<$Res>
    implements $ListingIncidentStateCopyWith<$Res> {
  factory _$ListIncidentStateErrorCopyWith(_ListIncidentStateError value,
          $Res Function(_ListIncidentStateError) _then) =
      __$ListIncidentStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ListIncidentStateErrorCopyWithImpl<$Res>
    implements _$ListIncidentStateErrorCopyWith<$Res> {
  __$ListIncidentStateErrorCopyWithImpl(this._self, this._then);

  final _ListIncidentStateError _self;
  final $Res Function(_ListIncidentStateError) _then;

  /// Create a copy of ListingIncidentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_ListIncidentStateError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _ListIncidentStateEmpty implements ListingIncidentState {
  const _ListIncidentStateEmpty();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ListIncidentStateEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListingIncidentState.empty()';
  }
}

// dart format on
