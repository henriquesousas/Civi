// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_list_state.dart';

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
    TResult Function(_ListProductStateEmpty value)? empty,
    TResult Function(_ListProductStateDelete value)? delete,
    TResult Function(_ListProductStateDeleteLoading value)? deleteLoading,
    TResult Function(_ListProductStateDeleteSuccess value)? deleteSuccess,
    TResult Function(_ListProductStateDeleteError value)? deleteError,
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
      case _ListProductStateEmpty() when empty != null:
        return empty(_that);
      case _ListProductStateDelete() when delete != null:
        return delete(_that);
      case _ListProductStateDeleteLoading() when deleteLoading != null:
        return deleteLoading(_that);
      case _ListProductStateDeleteSuccess() when deleteSuccess != null:
        return deleteSuccess(_that);
      case _ListProductStateDeleteError() when deleteError != null:
        return deleteError(_that);
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
    required TResult Function(_ListProductStateEmpty value) empty,
    required TResult Function(_ListProductStateDelete value) delete,
    required TResult Function(_ListProductStateDeleteLoading value)
        deleteLoading,
    required TResult Function(_ListProductStateDeleteSuccess value)
        deleteSuccess,
    required TResult Function(_ListProductStateDeleteError value) deleteError,
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
      case _ListProductStateEmpty():
        return empty(_that);
      case _ListProductStateDelete():
        return delete(_that);
      case _ListProductStateDeleteLoading():
        return deleteLoading(_that);
      case _ListProductStateDeleteSuccess():
        return deleteSuccess(_that);
      case _ListProductStateDeleteError():
        return deleteError(_that);
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
    TResult? Function(_ListProductStateEmpty value)? empty,
    TResult? Function(_ListProductStateDelete value)? delete,
    TResult? Function(_ListProductStateDeleteLoading value)? deleteLoading,
    TResult? Function(_ListProductStateDeleteSuccess value)? deleteSuccess,
    TResult? Function(_ListProductStateDeleteError value)? deleteError,
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
      case _ListProductStateEmpty() when empty != null:
        return empty(_that);
      case _ListProductStateDelete() when delete != null:
        return delete(_that);
      case _ListProductStateDeleteLoading() when deleteLoading != null:
        return deleteLoading(_that);
      case _ListProductStateDeleteSuccess() when deleteSuccess != null:
        return deleteSuccess(_that);
      case _ListProductStateDeleteError() when deleteError != null:
        return deleteError(_that);
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
    TResult Function(List<Product> items, String selectedFilter)? success,
    TResult Function(String message)? error,
    TResult Function()? empty,
    TResult Function()? delete,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function()? deleteError,
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
      case _ListProductStateEmpty() when empty != null:
        return empty();
      case _ListProductStateDelete() when delete != null:
        return delete();
      case _ListProductStateDeleteLoading() when deleteLoading != null:
        return deleteLoading();
      case _ListProductStateDeleteSuccess() when deleteSuccess != null:
        return deleteSuccess();
      case _ListProductStateDeleteError() when deleteError != null:
        return deleteError();
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
    required TResult Function(List<Product> items, String selectedFilter)
        success,
    required TResult Function(String message) error,
    required TResult Function() empty,
    required TResult Function() delete,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function() deleteError,
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
      case _ListProductStateEmpty():
        return empty();
      case _ListProductStateDelete():
        return delete();
      case _ListProductStateDeleteLoading():
        return deleteLoading();
      case _ListProductStateDeleteSuccess():
        return deleteSuccess();
      case _ListProductStateDeleteError():
        return deleteError();
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
    TResult? Function(List<Product> items, String selectedFilter)? success,
    TResult? Function(String message)? error,
    TResult? Function()? empty,
    TResult? Function()? delete,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function()? deleteError,
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
      case _ListProductStateEmpty() when empty != null:
        return empty();
      case _ListProductStateDelete() when delete != null:
        return delete();
      case _ListProductStateDeleteLoading() when deleteLoading != null:
        return deleteLoading();
      case _ListProductStateDeleteSuccess() when deleteSuccess != null:
        return deleteSuccess();
      case _ListProductStateDeleteError() when deleteError != null:
        return deleteError();
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
  const _ListProductStateSuccess(final List<Product> items, this.selectedFilter)
      : _items = items;

  final List<Product> _items;
  List<Product> get items {
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
  $Res call({List<Product> items, String selectedFilter});
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
              as List<Product>,
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

class _ListProductStateEmpty implements ListProductState {
  const _ListProductStateEmpty();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ListProductStateEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListProductState.empty()';
  }
}

/// @nodoc

class _ListProductStateDelete implements ListProductState {
  const _ListProductStateDelete();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ListProductStateDelete);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListProductState.delete()';
  }
}

/// @nodoc

class _ListProductStateDeleteLoading implements ListProductState {
  const _ListProductStateDeleteLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListProductStateDeleteLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListProductState.deleteLoading()';
  }
}

/// @nodoc

class _ListProductStateDeleteSuccess implements ListProductState {
  const _ListProductStateDeleteSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListProductStateDeleteSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListProductState.deleteSuccess()';
  }
}

/// @nodoc

class _ListProductStateDeleteError implements ListProductState {
  const _ListProductStateDeleteError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListProductStateDeleteError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListProductState.deleteError()';
  }
}

// dart format on
