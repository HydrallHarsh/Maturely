// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deposit_chain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DepositChain _$DepositChainFromJson(Map<String, dynamic> json) {
  return _DepositChain.fromJson(json);
}

/// @nodoc
mixin _$DepositChain {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String> get depositIds => throw _privateConstructorUsedError;
  int get totalDeposits => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  double get currentValue => throw _privateConstructorUsedError;
  ChainStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DepositChainCopyWith<DepositChain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepositChainCopyWith<$Res> {
  factory $DepositChainCopyWith(
          DepositChain value, $Res Function(DepositChain) then) =
      _$DepositChainCopyWithImpl<$Res, DepositChain>;
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime createdAt,
      DateTime updatedAt,
      String? description,
      List<String> depositIds,
      int totalDeposits,
      double totalAmount,
      double currentValue,
      ChainStatus status});
}

/// @nodoc
class _$DepositChainCopyWithImpl<$Res, $Val extends DepositChain>
    implements $DepositChainCopyWith<$Res> {
  _$DepositChainCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? description = freezed,
    Object? depositIds = null,
    Object? totalDeposits = null,
    Object? totalAmount = null,
    Object? currentValue = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      depositIds: null == depositIds
          ? _value.depositIds
          : depositIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalDeposits: null == totalDeposits
          ? _value.totalDeposits
          : totalDeposits // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChainStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DepositChainImplCopyWith<$Res>
    implements $DepositChainCopyWith<$Res> {
  factory _$$DepositChainImplCopyWith(
          _$DepositChainImpl value, $Res Function(_$DepositChainImpl) then) =
      __$$DepositChainImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime createdAt,
      DateTime updatedAt,
      String? description,
      List<String> depositIds,
      int totalDeposits,
      double totalAmount,
      double currentValue,
      ChainStatus status});
}

/// @nodoc
class __$$DepositChainImplCopyWithImpl<$Res>
    extends _$DepositChainCopyWithImpl<$Res, _$DepositChainImpl>
    implements _$$DepositChainImplCopyWith<$Res> {
  __$$DepositChainImplCopyWithImpl(
      _$DepositChainImpl _value, $Res Function(_$DepositChainImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? description = freezed,
    Object? depositIds = null,
    Object? totalDeposits = null,
    Object? totalAmount = null,
    Object? currentValue = null,
    Object? status = null,
  }) {
    return _then(_$DepositChainImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      depositIds: null == depositIds
          ? _value._depositIds
          : depositIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalDeposits: null == totalDeposits
          ? _value.totalDeposits
          : totalDeposits // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChainStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DepositChainImpl extends _DepositChain {
  const _$DepositChainImpl(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt,
      this.description,
      final List<String> depositIds = const [],
      this.totalDeposits = 0,
      this.totalAmount = 0.0,
      this.currentValue = 0.0,
      this.status = ChainStatus.active})
      : _depositIds = depositIds,
        super._();

  factory _$DepositChainImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepositChainImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? description;
  final List<String> _depositIds;
  @override
  @JsonKey()
  List<String> get depositIds {
    if (_depositIds is EqualUnmodifiableListView) return _depositIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_depositIds);
  }

  @override
  @JsonKey()
  final int totalDeposits;
  @override
  @JsonKey()
  final double totalAmount;
  @override
  @JsonKey()
  final double currentValue;
  @override
  @JsonKey()
  final ChainStatus status;

  @override
  String toString() {
    return 'DepositChain(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, description: $description, depositIds: $depositIds, totalDeposits: $totalDeposits, totalAmount: $totalAmount, currentValue: $currentValue, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepositChainImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._depositIds, _depositIds) &&
            (identical(other.totalDeposits, totalDeposits) ||
                other.totalDeposits == totalDeposits) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      createdAt,
      updatedAt,
      description,
      const DeepCollectionEquality().hash(_depositIds),
      totalDeposits,
      totalAmount,
      currentValue,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DepositChainImplCopyWith<_$DepositChainImpl> get copyWith =>
      __$$DepositChainImplCopyWithImpl<_$DepositChainImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DepositChainImplToJson(
      this,
    );
  }
}

abstract class _DepositChain extends DepositChain {
  const factory _DepositChain(
      {required final String id,
      required final String name,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final String? description,
      final List<String> depositIds,
      final int totalDeposits,
      final double totalAmount,
      final double currentValue,
      final ChainStatus status}) = _$DepositChainImpl;
  const _DepositChain._() : super._();

  factory _DepositChain.fromJson(Map<String, dynamic> json) =
      _$DepositChainImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String? get description;
  @override
  List<String> get depositIds;
  @override
  int get totalDeposits;
  @override
  double get totalAmount;
  @override
  double get currentValue;
  @override
  ChainStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$DepositChainImplCopyWith<_$DepositChainImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChainLink _$ChainLinkFromJson(Map<String, dynamic> json) {
  return _ChainLink.fromJson(json);
}

/// @nodoc
mixin _$ChainLink {
  String get parentDepositId => throw _privateConstructorUsedError;
  String get childDepositId => throw _privateConstructorUsedError;
  DateTime get linkedAt => throw _privateConstructorUsedError;
  double get reinvestedAmount => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChainLinkCopyWith<ChainLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChainLinkCopyWith<$Res> {
  factory $ChainLinkCopyWith(ChainLink value, $Res Function(ChainLink) then) =
      _$ChainLinkCopyWithImpl<$Res, ChainLink>;
  @useResult
  $Res call(
      {String parentDepositId,
      String childDepositId,
      DateTime linkedAt,
      double reinvestedAmount,
      String? notes});
}

/// @nodoc
class _$ChainLinkCopyWithImpl<$Res, $Val extends ChainLink>
    implements $ChainLinkCopyWith<$Res> {
  _$ChainLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parentDepositId = null,
    Object? childDepositId = null,
    Object? linkedAt = null,
    Object? reinvestedAmount = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      parentDepositId: null == parentDepositId
          ? _value.parentDepositId
          : parentDepositId // ignore: cast_nullable_to_non_nullable
              as String,
      childDepositId: null == childDepositId
          ? _value.childDepositId
          : childDepositId // ignore: cast_nullable_to_non_nullable
              as String,
      linkedAt: null == linkedAt
          ? _value.linkedAt
          : linkedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reinvestedAmount: null == reinvestedAmount
          ? _value.reinvestedAmount
          : reinvestedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChainLinkImplCopyWith<$Res>
    implements $ChainLinkCopyWith<$Res> {
  factory _$$ChainLinkImplCopyWith(
          _$ChainLinkImpl value, $Res Function(_$ChainLinkImpl) then) =
      __$$ChainLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String parentDepositId,
      String childDepositId,
      DateTime linkedAt,
      double reinvestedAmount,
      String? notes});
}

/// @nodoc
class __$$ChainLinkImplCopyWithImpl<$Res>
    extends _$ChainLinkCopyWithImpl<$Res, _$ChainLinkImpl>
    implements _$$ChainLinkImplCopyWith<$Res> {
  __$$ChainLinkImplCopyWithImpl(
      _$ChainLinkImpl _value, $Res Function(_$ChainLinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parentDepositId = null,
    Object? childDepositId = null,
    Object? linkedAt = null,
    Object? reinvestedAmount = null,
    Object? notes = freezed,
  }) {
    return _then(_$ChainLinkImpl(
      parentDepositId: null == parentDepositId
          ? _value.parentDepositId
          : parentDepositId // ignore: cast_nullable_to_non_nullable
              as String,
      childDepositId: null == childDepositId
          ? _value.childDepositId
          : childDepositId // ignore: cast_nullable_to_non_nullable
              as String,
      linkedAt: null == linkedAt
          ? _value.linkedAt
          : linkedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reinvestedAmount: null == reinvestedAmount
          ? _value.reinvestedAmount
          : reinvestedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChainLinkImpl extends _ChainLink {
  const _$ChainLinkImpl(
      {required this.parentDepositId,
      required this.childDepositId,
      required this.linkedAt,
      required this.reinvestedAmount,
      this.notes})
      : super._();

  factory _$ChainLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChainLinkImplFromJson(json);

  @override
  final String parentDepositId;
  @override
  final String childDepositId;
  @override
  final DateTime linkedAt;
  @override
  final double reinvestedAmount;
  @override
  final String? notes;

  @override
  String toString() {
    return 'ChainLink(parentDepositId: $parentDepositId, childDepositId: $childDepositId, linkedAt: $linkedAt, reinvestedAmount: $reinvestedAmount, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChainLinkImpl &&
            (identical(other.parentDepositId, parentDepositId) ||
                other.parentDepositId == parentDepositId) &&
            (identical(other.childDepositId, childDepositId) ||
                other.childDepositId == childDepositId) &&
            (identical(other.linkedAt, linkedAt) ||
                other.linkedAt == linkedAt) &&
            (identical(other.reinvestedAmount, reinvestedAmount) ||
                other.reinvestedAmount == reinvestedAmount) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, parentDepositId, childDepositId,
      linkedAt, reinvestedAmount, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChainLinkImplCopyWith<_$ChainLinkImpl> get copyWith =>
      __$$ChainLinkImplCopyWithImpl<_$ChainLinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChainLinkImplToJson(
      this,
    );
  }
}

abstract class _ChainLink extends ChainLink {
  const factory _ChainLink(
      {required final String parentDepositId,
      required final String childDepositId,
      required final DateTime linkedAt,
      required final double reinvestedAmount,
      final String? notes}) = _$ChainLinkImpl;
  const _ChainLink._() : super._();

  factory _ChainLink.fromJson(Map<String, dynamic> json) =
      _$ChainLinkImpl.fromJson;

  @override
  String get parentDepositId;
  @override
  String get childDepositId;
  @override
  DateTime get linkedAt;
  @override
  double get reinvestedAmount;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$ChainLinkImplCopyWith<_$ChainLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
