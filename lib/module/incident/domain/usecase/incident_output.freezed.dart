// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncidentOutput {
  String get id;
  String get userId;
  String get alertId;
  TypeAlert get type;
  IncidentProductOutput get product;
  ItemStatus get status;
  DateTime get createdAt;
  DateTime get occurredAt;
  TimeOfDay get occurredAtTime;
  IncidentLocal? get local;
  String? get howTo;
  bool get visibilty;

  /// Create a copy of IncidentOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IncidentOutputCopyWith<IncidentOutput> get copyWith =>
      _$IncidentOutputCopyWithImpl<IncidentOutput>(
          this as IncidentOutput, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IncidentOutput &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.alertId, alertId) || other.alertId == alertId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.occurredAt, occurredAt) ||
                other.occurredAt == occurredAt) &&
            (identical(other.occurredAtTime, occurredAtTime) ||
                other.occurredAtTime == occurredAtTime) &&
            (identical(other.local, local) || other.local == local) &&
            (identical(other.howTo, howTo) || other.howTo == howTo) &&
            (identical(other.visibilty, visibilty) ||
                other.visibilty == visibilty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      alertId,
      type,
      product,
      status,
      createdAt,
      occurredAt,
      occurredAtTime,
      local,
      howTo,
      visibilty);

  @override
  String toString() {
    return 'IncidentOutput(id: $id, userId: $userId, alertId: $alertId, type: $type, product: $product, status: $status, createdAt: $createdAt, occurredAt: $occurredAt, occurredAtTime: $occurredAtTime, local: $local, howTo: $howTo, visibilty: $visibilty)';
  }
}

/// @nodoc
abstract mixin class $IncidentOutputCopyWith<$Res> {
  factory $IncidentOutputCopyWith(
          IncidentOutput value, $Res Function(IncidentOutput) _then) =
      _$IncidentOutputCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      String alertId,
      TypeAlert type,
      IncidentProductOutput product,
      ItemStatus status,
      DateTime createdAt,
      DateTime occurredAt,
      TimeOfDay occurredAtTime,
      IncidentLocal? local,
      String? howTo,
      bool visibilty});
}

/// @nodoc
class _$IncidentOutputCopyWithImpl<$Res>
    implements $IncidentOutputCopyWith<$Res> {
  _$IncidentOutputCopyWithImpl(this._self, this._then);

  final IncidentOutput _self;
  final $Res Function(IncidentOutput) _then;

  /// Create a copy of IncidentOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? alertId = null,
    Object? type = null,
    Object? product = null,
    Object? status = null,
    Object? createdAt = null,
    Object? occurredAt = null,
    Object? occurredAtTime = null,
    Object? local = freezed,
    Object? howTo = freezed,
    Object? visibilty = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      alertId: null == alertId
          ? _self.alertId
          : alertId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeAlert,
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as IncidentProductOutput,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ItemStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      occurredAt: null == occurredAt
          ? _self.occurredAt
          : occurredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      occurredAtTime: null == occurredAtTime
          ? _self.occurredAtTime
          : occurredAtTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      local: freezed == local
          ? _self.local
          : local // ignore: cast_nullable_to_non_nullable
              as IncidentLocal?,
      howTo: freezed == howTo
          ? _self.howTo
          : howTo // ignore: cast_nullable_to_non_nullable
              as String?,
      visibilty: null == visibilty
          ? _self.visibilty
          : visibilty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [IncidentOutput].
extension IncidentOutputPatterns on IncidentOutput {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_IncidentOutput value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IncidentOutput() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_IncidentOutput value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncidentOutput():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_IncidentOutput value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncidentOutput() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String userId,
            String alertId,
            TypeAlert type,
            IncidentProductOutput product,
            ItemStatus status,
            DateTime createdAt,
            DateTime occurredAt,
            TimeOfDay occurredAtTime,
            IncidentLocal? local,
            String? howTo,
            bool visibilty)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IncidentOutput() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.alertId,
            _that.type,
            _that.product,
            _that.status,
            _that.createdAt,
            _that.occurredAt,
            _that.occurredAtTime,
            _that.local,
            _that.howTo,
            _that.visibilty);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String userId,
            String alertId,
            TypeAlert type,
            IncidentProductOutput product,
            ItemStatus status,
            DateTime createdAt,
            DateTime occurredAt,
            TimeOfDay occurredAtTime,
            IncidentLocal? local,
            String? howTo,
            bool visibilty)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncidentOutput():
        return $default(
            _that.id,
            _that.userId,
            _that.alertId,
            _that.type,
            _that.product,
            _that.status,
            _that.createdAt,
            _that.occurredAt,
            _that.occurredAtTime,
            _that.local,
            _that.howTo,
            _that.visibilty);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String userId,
            String alertId,
            TypeAlert type,
            IncidentProductOutput product,
            ItemStatus status,
            DateTime createdAt,
            DateTime occurredAt,
            TimeOfDay occurredAtTime,
            IncidentLocal? local,
            String? howTo,
            bool visibilty)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncidentOutput() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.alertId,
            _that.type,
            _that.product,
            _that.status,
            _that.createdAt,
            _that.occurredAt,
            _that.occurredAtTime,
            _that.local,
            _that.howTo,
            _that.visibilty);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _IncidentOutput implements IncidentOutput {
  const _IncidentOutput(
      {required this.id,
      required this.userId,
      required this.alertId,
      required this.type,
      required this.product,
      required this.status,
      required this.createdAt,
      required this.occurredAt,
      required this.occurredAtTime,
      this.local,
      this.howTo,
      this.visibilty = true});

  @override
  final String id;
  @override
  final String userId;
  @override
  final String alertId;
  @override
  final TypeAlert type;
  @override
  final IncidentProductOutput product;
  @override
  final ItemStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime occurredAt;
  @override
  final TimeOfDay occurredAtTime;
  @override
  final IncidentLocal? local;
  @override
  final String? howTo;
  @override
  @JsonKey()
  final bool visibilty;

  /// Create a copy of IncidentOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IncidentOutputCopyWith<_IncidentOutput> get copyWith =>
      __$IncidentOutputCopyWithImpl<_IncidentOutput>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IncidentOutput &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.alertId, alertId) || other.alertId == alertId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.occurredAt, occurredAt) ||
                other.occurredAt == occurredAt) &&
            (identical(other.occurredAtTime, occurredAtTime) ||
                other.occurredAtTime == occurredAtTime) &&
            (identical(other.local, local) || other.local == local) &&
            (identical(other.howTo, howTo) || other.howTo == howTo) &&
            (identical(other.visibilty, visibilty) ||
                other.visibilty == visibilty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      alertId,
      type,
      product,
      status,
      createdAt,
      occurredAt,
      occurredAtTime,
      local,
      howTo,
      visibilty);

  @override
  String toString() {
    return 'IncidentOutput(id: $id, userId: $userId, alertId: $alertId, type: $type, product: $product, status: $status, createdAt: $createdAt, occurredAt: $occurredAt, occurredAtTime: $occurredAtTime, local: $local, howTo: $howTo, visibilty: $visibilty)';
  }
}

/// @nodoc
abstract mixin class _$IncidentOutputCopyWith<$Res>
    implements $IncidentOutputCopyWith<$Res> {
  factory _$IncidentOutputCopyWith(
          _IncidentOutput value, $Res Function(_IncidentOutput) _then) =
      __$IncidentOutputCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String alertId,
      TypeAlert type,
      IncidentProductOutput product,
      ItemStatus status,
      DateTime createdAt,
      DateTime occurredAt,
      TimeOfDay occurredAtTime,
      IncidentLocal? local,
      String? howTo,
      bool visibilty});
}

/// @nodoc
class __$IncidentOutputCopyWithImpl<$Res>
    implements _$IncidentOutputCopyWith<$Res> {
  __$IncidentOutputCopyWithImpl(this._self, this._then);

  final _IncidentOutput _self;
  final $Res Function(_IncidentOutput) _then;

  /// Create a copy of IncidentOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? alertId = null,
    Object? type = null,
    Object? product = null,
    Object? status = null,
    Object? createdAt = null,
    Object? occurredAt = null,
    Object? occurredAtTime = null,
    Object? local = freezed,
    Object? howTo = freezed,
    Object? visibilty = null,
  }) {
    return _then(_IncidentOutput(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      alertId: null == alertId
          ? _self.alertId
          : alertId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeAlert,
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as IncidentProductOutput,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ItemStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      occurredAt: null == occurredAt
          ? _self.occurredAt
          : occurredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      occurredAtTime: null == occurredAtTime
          ? _self.occurredAtTime
          : occurredAtTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      local: freezed == local
          ? _self.local
          : local // ignore: cast_nullable_to_non_nullable
              as IncidentLocal?,
      howTo: freezed == howTo
          ? _self.howTo
          : howTo // ignore: cast_nullable_to_non_nullable
              as String?,
      visibilty: null == visibilty
          ? _self.visibilty
          : visibilty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
