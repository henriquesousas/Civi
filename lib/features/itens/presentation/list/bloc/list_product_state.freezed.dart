// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListProductState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ListProductState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListProductState()';
  }
}

/// @nodoc
class $ListProductStateCopyWith<$Res> {
  $ListProductStateCopyWith(
      ListProductState _, $Res Function(ListProductState) __);
}

/// Adds pattern-matching-related methods to [ListProductState].
extension ListProductStatePatterns on ListProductState {
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
    TResult Function(_ListProductStateInitial value)? initial,
    TResult Function(_ListProductStateLoading value)? loading,
    TResult Function(_ListProductStateSuccess value)? success,
    TResult Function(_ListProductStateError value)? error,
    TResult Function(_UserStateEmpty value)? empty,
    TResult Function(_UserStateFilterEmpty value)? filterEmpty,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListProductStateInitial() when initial != null:
        return initial(_that);
      case _ListProductStateLoading() when loading != null:
        return loading(_that);
      case _ListProductStateSuccess() when success != null:
        return success(_that);
      case _ListProductStateError() when error != null:
        return error(_that);
      case _UserStateEmpty() when empty != null:
        return empty(_that);
      case _UserStateFilterEmpty() when filterEmpty != null:
        return filterEmpty(_that);
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
    required TResult Function(_ListProductStateInitial value) initial,
    required TResult Function(_ListProductStateLoading value) loading,
    required TResult Function(_ListProductStateSuccess value) success,
    required TResult Function(_ListProductStateError value) error,
    required TResult Function(_UserStateEmpty value) empty,
    required TResult Function(_UserStateFilterEmpty value) filterEmpty,
  }) {
    final _that = this;
    switch (_that) {
      case _ListProductStateInitial():
        return initial(_that);
      case _ListProductStateLoading():
        return loading(_that);
      case _ListProductStateSuccess():
        return success(_that);
      case _ListProductStateError():
        return error(_that);
      case _UserStateEmpty():
        return empty(_that);
      case _UserStateFilterEmpty():
        return filterEmpty(_that);
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
    TResult? Function(_ListProductStateInitial value)? initial,
    TResult? Function(_ListProductStateLoading value)? loading,
    TResult? Function(_ListProductStateSuccess value)? success,
    TResult? Function(_ListProductStateError value)? error,
    TResult? Function(_UserStateEmpty value)? empty,
    TResult? Function(_UserStateFilterEmpty value)? filterEmpty,
  }) {
    final _that = this;
    switch (_that) {
      case _ListProductStateInitial() when initial != null:
        return initial(_that);
      case _ListProductStateLoading() when loading != null:
        return loading(_that);
      case _ListProductStateSuccess() when success != null:
        return success(_that);
      case _ListProductStateError() when error != null:
        return error(_that);
      case _UserStateEmpty() when empty != null:
        return empty(_that);
      case _UserStateFilterEmpty() when filterEmpty != null:
        return filterEmpty(_that);
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
    TResult Function(List<Item> items, String selectedFilter)? success,
    TResult Function(String message)? error,
    TResult Function()? empty,
    TResult Function(String filterType)? filterEmpty,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListProductStateInitial() when initial != null:
        return initial();
      case _ListProductStateLoading() when loading != null:
        return loading();
      case _ListProductStateSuccess() when success != null:
        return success(_that.items, _that.selectedFilter);
      case _ListProductStateError() when error != null:
        return error(_that.message);
      case _UserStateEmpty() when empty != null:
        return empty();
      case _UserStateFilterEmpty() when filterEmpty != null:
        return filterEmpty(_that.filterType);
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
    required TResult Function(List<Item> items, String selectedFilter) success,
    required TResult Function(String message) error,
    required TResult Function() empty,
    required TResult Function(String filterType) filterEmpty,
  }) {
    final _that = this;
    switch (_that) {
      case _ListProductStateInitial():
        return initial();
      case _ListProductStateLoading():
        return loading();
      case _ListProductStateSuccess():
        return success(_that.items, _that.selectedFilter);
      case _ListProductStateError():
        return error(_that.message);
      case _UserStateEmpty():
        return empty();
      case _UserStateFilterEmpty():
        return filterEmpty(_that.filterType);
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
    TResult? Function(List<Item> items, String selectedFilter)? success,
    TResult? Function(String message)? error,
    TResult? Function()? empty,
    TResult? Function(String filterType)? filterEmpty,
  }) {
    final _that = this;
    switch (_that) {
      case _ListProductStateInitial() when initial != null:
        return initial();
      case _ListProductStateLoading() when loading != null:
        return loading();
      case _ListProductStateSuccess() when success != null:
        return success(_that.items, _that.selectedFilter);
      case _ListProductStateError() when error != null:
        return error(_that.message);
      case _UserStateEmpty() when empty != null:
        return empty();
      case _UserStateFilterEmpty() when filterEmpty != null:
        return filterEmpty(_that.filterType);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ListProductStateInitial implements ListProductState {
  const _ListProductStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ListProductStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListProductState.initial()';
  }
}

/// @nodoc

class _ListProductStateLoading implements ListProductState {
  const _ListProductStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ListProductStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListProductState.loading()';
  }
}

/// @nodoc

class _ListProductStateSuccess implements ListProductState {
  const _ListProductStateSuccess(final List<Item> items, this.selectedFilter)
      : _items = items;

  final List<Item> _items;
  List<Item> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final String selectedFilter;

  /// Create a copy of ListProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListProductStateSuccessCopyWith<_ListProductStateSuccess> get copyWith =>
      __$ListProductStateSuccessCopyWithImpl<_ListProductStateSuccess>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListProductStateSuccess &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.selectedFilter, selectedFilter) ||
                other.selectedFilter == selectedFilter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), selectedFilter);

  @override
  String toString() {
    return 'ListProductState.success(items: $items, selectedFilter: $selectedFilter)';
  }
}

/// @nodoc
abstract mixin class _$ListProductStateSuccessCopyWith<$Res>
    implements $ListProductStateCopyWith<$Res> {
  factory _$ListProductStateSuccessCopyWith(_ListProductStateSuccess value,
          $Res Function(_ListProductStateSuccess) _then) =
      __$ListProductStateSuccessCopyWithImpl;
  @useResult
  $Res call({List<Item> items, String selectedFilter});
}

/// @nodoc
class __$ListProductStateSuccessCopyWithImpl<$Res>
    implements _$ListProductStateSuccessCopyWith<$Res> {
  __$ListProductStateSuccessCopyWithImpl(this._self, this._then);

  final _ListProductStateSuccess _self;
  final $Res Function(_ListProductStateSuccess) _then;

  /// Create a copy of ListProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? selectedFilter = null,
  }) {
    return _then(_ListProductStateSuccess(
      null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      null == selectedFilter
          ? _self.selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _ListProductStateError implements ListProductState {
  const _ListProductStateError(this.message);

  final String message;

  /// Create a copy of ListProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListProductStateErrorCopyWith<_ListProductStateError> get copyWith =>
      __$ListProductStateErrorCopyWithImpl<_ListProductStateError>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListProductStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ListProductState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ListProductStateErrorCopyWith<$Res>
    implements $ListProductStateCopyWith<$Res> {
  factory _$ListProductStateErrorCopyWith(_ListProductStateError value,
          $Res Function(_ListProductStateError) _then) =
      __$ListProductStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ListProductStateErrorCopyWithImpl<$Res>
    implements _$ListProductStateErrorCopyWith<$Res> {
  __$ListProductStateErrorCopyWithImpl(this._self, this._then);

  final _ListProductStateError _self;
  final $Res Function(_ListProductStateError) _then;

  /// Create a copy of ListProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_ListProductStateError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _UserStateEmpty implements ListProductState {
  const _UserStateEmpty();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _UserStateEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListProductState.empty()';
  }
}

/// @nodoc

class _UserStateFilterEmpty implements ListProductState {
  const _UserStateFilterEmpty(this.filterType);

  final String filterType;

  /// Create a copy of ListProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserStateFilterEmptyCopyWith<_UserStateFilterEmpty> get copyWith =>
      __$UserStateFilterEmptyCopyWithImpl<_UserStateFilterEmpty>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserStateFilterEmpty &&
            (identical(other.filterType, filterType) ||
                other.filterType == filterType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filterType);

  @override
  String toString() {
    return 'ListProductState.filterEmpty(filterType: $filterType)';
  }
}

/// @nodoc
abstract mixin class _$UserStateFilterEmptyCopyWith<$Res>
    implements $ListProductStateCopyWith<$Res> {
  factory _$UserStateFilterEmptyCopyWith(_UserStateFilterEmpty value,
          $Res Function(_UserStateFilterEmpty) _then) =
      __$UserStateFilterEmptyCopyWithImpl;
  @useResult
  $Res call({String filterType});
}

/// @nodoc
class __$UserStateFilterEmptyCopyWithImpl<$Res>
    implements _$UserStateFilterEmptyCopyWith<$Res> {
  __$UserStateFilterEmptyCopyWithImpl(this._self, this._then);

  final _UserStateFilterEmpty _self;
  final $Res Function(_UserStateFilterEmpty) _then;

  /// Create a copy of ListProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? filterType = null,
  }) {
    return _then(_UserStateFilterEmpty(
      null == filterType
          ? _self.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
