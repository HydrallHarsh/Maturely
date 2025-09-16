// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deposit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return _Attachment.fromJson(json);
}

/// @nodoc
mixin _$Attachment {
  String get id => throw _privateConstructorUsedError;
  String get storagePath => throw _privateConstructorUsedError;
  AttachmentKind get kind => throw _privateConstructorUsedError;
  String? get ocrVersion => throw _privateConstructorUsedError;
  Map<String, dynamic>? get fieldsExtracted =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttachmentCopyWith<Attachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttachmentCopyWith<$Res> {
  factory $AttachmentCopyWith(
          Attachment value, $Res Function(Attachment) then) =
      _$AttachmentCopyWithImpl<$Res, Attachment>;
  @useResult
  $Res call(
      {String id,
      String storagePath,
      AttachmentKind kind,
      String? ocrVersion,
      Map<String, dynamic>? fieldsExtracted});
}

/// @nodoc
class _$AttachmentCopyWithImpl<$Res, $Val extends Attachment>
    implements $AttachmentCopyWith<$Res> {
  _$AttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? storagePath = null,
    Object? kind = null,
    Object? ocrVersion = freezed,
    Object? fieldsExtracted = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      storagePath: null == storagePath
          ? _value.storagePath
          : storagePath // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as AttachmentKind,
      ocrVersion: freezed == ocrVersion
          ? _value.ocrVersion
          : ocrVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldsExtracted: freezed == fieldsExtracted
          ? _value.fieldsExtracted
          : fieldsExtracted // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttachmentImplCopyWith<$Res>
    implements $AttachmentCopyWith<$Res> {
  factory _$$AttachmentImplCopyWith(
          _$AttachmentImpl value, $Res Function(_$AttachmentImpl) then) =
      __$$AttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String storagePath,
      AttachmentKind kind,
      String? ocrVersion,
      Map<String, dynamic>? fieldsExtracted});
}

/// @nodoc
class __$$AttachmentImplCopyWithImpl<$Res>
    extends _$AttachmentCopyWithImpl<$Res, _$AttachmentImpl>
    implements _$$AttachmentImplCopyWith<$Res> {
  __$$AttachmentImplCopyWithImpl(
      _$AttachmentImpl _value, $Res Function(_$AttachmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? storagePath = null,
    Object? kind = null,
    Object? ocrVersion = freezed,
    Object? fieldsExtracted = freezed,
  }) {
    return _then(_$AttachmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      storagePath: null == storagePath
          ? _value.storagePath
          : storagePath // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as AttachmentKind,
      ocrVersion: freezed == ocrVersion
          ? _value.ocrVersion
          : ocrVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldsExtracted: freezed == fieldsExtracted
          ? _value._fieldsExtracted
          : fieldsExtracted // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttachmentImpl implements _Attachment {
  const _$AttachmentImpl(
      {required this.id,
      required this.storagePath,
      required this.kind,
      this.ocrVersion,
      final Map<String, dynamic>? fieldsExtracted})
      : _fieldsExtracted = fieldsExtracted;

  factory _$AttachmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttachmentImplFromJson(json);

  @override
  final String id;
  @override
  final String storagePath;
  @override
  final AttachmentKind kind;
  @override
  final String? ocrVersion;
  final Map<String, dynamic>? _fieldsExtracted;
  @override
  Map<String, dynamic>? get fieldsExtracted {
    final value = _fieldsExtracted;
    if (value == null) return null;
    if (_fieldsExtracted is EqualUnmodifiableMapView) return _fieldsExtracted;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Attachment(id: $id, storagePath: $storagePath, kind: $kind, ocrVersion: $ocrVersion, fieldsExtracted: $fieldsExtracted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttachmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.storagePath, storagePath) ||
                other.storagePath == storagePath) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.ocrVersion, ocrVersion) ||
                other.ocrVersion == ocrVersion) &&
            const DeepCollectionEquality()
                .equals(other._fieldsExtracted, _fieldsExtracted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, storagePath, kind,
      ocrVersion, const DeepCollectionEquality().hash(_fieldsExtracted));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttachmentImplCopyWith<_$AttachmentImpl> get copyWith =>
      __$$AttachmentImplCopyWithImpl<_$AttachmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttachmentImplToJson(
      this,
    );
  }
}

abstract class _Attachment implements Attachment {
  const factory _Attachment(
      {required final String id,
      required final String storagePath,
      required final AttachmentKind kind,
      final String? ocrVersion,
      final Map<String, dynamic>? fieldsExtracted}) = _$AttachmentImpl;

  factory _Attachment.fromJson(Map<String, dynamic> json) =
      _$AttachmentImpl.fromJson;

  @override
  String get id;
  @override
  String get storagePath;
  @override
  AttachmentKind get kind;
  @override
  String? get ocrVersion;
  @override
  Map<String, dynamic>? get fieldsExtracted;
  @override
  @JsonKey(ignore: true)
  _$$AttachmentImplCopyWith<_$AttachmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Deposit _$DepositFromJson(Map<String, dynamic> json) {
  return _Deposit.fromJson(json);
}

/// @nodoc
mixin _$Deposit {
  String get id => throw _privateConstructorUsedError;
  String get srNo => throw _privateConstructorUsedError;
  List<String> get holders => throw _privateConstructorUsedError;
  String get bankName => throw _privateConstructorUsedError;
  String get accountNumber => throw _privateConstructorUsedError;
  String get fdrNo => throw _privateConstructorUsedError;
  double get amountDeposited => throw _privateConstructorUsedError;
  double get dueAmount => throw _privateConstructorUsedError;
  DateTime get dateDeposited => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  DepositStatus get status => throw _privateConstructorUsedError;
  ClosureType? get closureType => throw _privateConstructorUsedError;
  String? get previousDepositId => throw _privateConstructorUsedError;
  String? get nextDepositId => throw _privateConstructorUsedError;
  String? get chainId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<Attachment> get attachments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DepositCopyWith<Deposit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepositCopyWith<$Res> {
  factory $DepositCopyWith(Deposit value, $Res Function(Deposit) then) =
      _$DepositCopyWithImpl<$Res, Deposit>;
  @useResult
  $Res call(
      {String id,
      String srNo,
      List<String> holders,
      String bankName,
      String accountNumber,
      String fdrNo,
      double amountDeposited,
      double dueAmount,
      DateTime dateDeposited,
      DateTime dueDate,
      DepositStatus status,
      ClosureType? closureType,
      String? previousDepositId,
      String? nextDepositId,
      String? chainId,
      DateTime createdAt,
      DateTime updatedAt,
      String? notes,
      List<Attachment> attachments});
}

/// @nodoc
class _$DepositCopyWithImpl<$Res, $Val extends Deposit>
    implements $DepositCopyWith<$Res> {
  _$DepositCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? srNo = null,
    Object? holders = null,
    Object? bankName = null,
    Object? accountNumber = null,
    Object? fdrNo = null,
    Object? amountDeposited = null,
    Object? dueAmount = null,
    Object? dateDeposited = null,
    Object? dueDate = null,
    Object? status = null,
    Object? closureType = freezed,
    Object? previousDepositId = freezed,
    Object? nextDepositId = freezed,
    Object? chainId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? notes = freezed,
    Object? attachments = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      srNo: null == srNo
          ? _value.srNo
          : srNo // ignore: cast_nullable_to_non_nullable
              as String,
      holders: null == holders
          ? _value.holders
          : holders // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      fdrNo: null == fdrNo
          ? _value.fdrNo
          : fdrNo // ignore: cast_nullable_to_non_nullable
              as String,
      amountDeposited: null == amountDeposited
          ? _value.amountDeposited
          : amountDeposited // ignore: cast_nullable_to_non_nullable
              as double,
      dueAmount: null == dueAmount
          ? _value.dueAmount
          : dueAmount // ignore: cast_nullable_to_non_nullable
              as double,
      dateDeposited: null == dateDeposited
          ? _value.dateDeposited
          : dateDeposited // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DepositStatus,
      closureType: freezed == closureType
          ? _value.closureType
          : closureType // ignore: cast_nullable_to_non_nullable
              as ClosureType?,
      previousDepositId: freezed == previousDepositId
          ? _value.previousDepositId
          : previousDepositId // ignore: cast_nullable_to_non_nullable
              as String?,
      nextDepositId: freezed == nextDepositId
          ? _value.nextDepositId
          : nextDepositId // ignore: cast_nullable_to_non_nullable
              as String?,
      chainId: freezed == chainId
          ? _value.chainId
          : chainId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DepositImplCopyWith<$Res> implements $DepositCopyWith<$Res> {
  factory _$$DepositImplCopyWith(
          _$DepositImpl value, $Res Function(_$DepositImpl) then) =
      __$$DepositImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String srNo,
      List<String> holders,
      String bankName,
      String accountNumber,
      String fdrNo,
      double amountDeposited,
      double dueAmount,
      DateTime dateDeposited,
      DateTime dueDate,
      DepositStatus status,
      ClosureType? closureType,
      String? previousDepositId,
      String? nextDepositId,
      String? chainId,
      DateTime createdAt,
      DateTime updatedAt,
      String? notes,
      List<Attachment> attachments});
}

/// @nodoc
class __$$DepositImplCopyWithImpl<$Res>
    extends _$DepositCopyWithImpl<$Res, _$DepositImpl>
    implements _$$DepositImplCopyWith<$Res> {
  __$$DepositImplCopyWithImpl(
      _$DepositImpl _value, $Res Function(_$DepositImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? srNo = null,
    Object? holders = null,
    Object? bankName = null,
    Object? accountNumber = null,
    Object? fdrNo = null,
    Object? amountDeposited = null,
    Object? dueAmount = null,
    Object? dateDeposited = null,
    Object? dueDate = null,
    Object? status = null,
    Object? closureType = freezed,
    Object? previousDepositId = freezed,
    Object? nextDepositId = freezed,
    Object? chainId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? notes = freezed,
    Object? attachments = null,
  }) {
    return _then(_$DepositImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      srNo: null == srNo
          ? _value.srNo
          : srNo // ignore: cast_nullable_to_non_nullable
              as String,
      holders: null == holders
          ? _value._holders
          : holders // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      fdrNo: null == fdrNo
          ? _value.fdrNo
          : fdrNo // ignore: cast_nullable_to_non_nullable
              as String,
      amountDeposited: null == amountDeposited
          ? _value.amountDeposited
          : amountDeposited // ignore: cast_nullable_to_non_nullable
              as double,
      dueAmount: null == dueAmount
          ? _value.dueAmount
          : dueAmount // ignore: cast_nullable_to_non_nullable
              as double,
      dateDeposited: null == dateDeposited
          ? _value.dateDeposited
          : dateDeposited // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DepositStatus,
      closureType: freezed == closureType
          ? _value.closureType
          : closureType // ignore: cast_nullable_to_non_nullable
              as ClosureType?,
      previousDepositId: freezed == previousDepositId
          ? _value.previousDepositId
          : previousDepositId // ignore: cast_nullable_to_non_nullable
              as String?,
      nextDepositId: freezed == nextDepositId
          ? _value.nextDepositId
          : nextDepositId // ignore: cast_nullable_to_non_nullable
              as String?,
      chainId: freezed == chainId
          ? _value.chainId
          : chainId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DepositImpl extends _Deposit {
  const _$DepositImpl(
      {required this.id,
      required this.srNo,
      required final List<String> holders,
      required this.bankName,
      required this.accountNumber,
      required this.fdrNo,
      required this.amountDeposited,
      required this.dueAmount,
      required this.dateDeposited,
      required this.dueDate,
      this.status = DepositStatus.active,
      this.closureType,
      this.previousDepositId,
      this.nextDepositId,
      this.chainId,
      required this.createdAt,
      required this.updatedAt,
      this.notes,
      final List<Attachment> attachments = const []})
      : _holders = holders,
        _attachments = attachments,
        super._();

  factory _$DepositImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepositImplFromJson(json);

  @override
  final String id;
  @override
  final String srNo;
  final List<String> _holders;
  @override
  List<String> get holders {
    if (_holders is EqualUnmodifiableListView) return _holders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_holders);
  }

  @override
  final String bankName;
  @override
  final String accountNumber;
  @override
  final String fdrNo;
  @override
  final double amountDeposited;
  @override
  final double dueAmount;
  @override
  final DateTime dateDeposited;
  @override
  final DateTime dueDate;
  @override
  @JsonKey()
  final DepositStatus status;
  @override
  final ClosureType? closureType;
  @override
  final String? previousDepositId;
  @override
  final String? nextDepositId;
  @override
  final String? chainId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? notes;
  final List<Attachment> _attachments;
  @override
  @JsonKey()
  List<Attachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  String toString() {
    return 'Deposit(id: $id, srNo: $srNo, holders: $holders, bankName: $bankName, accountNumber: $accountNumber, fdrNo: $fdrNo, amountDeposited: $amountDeposited, dueAmount: $dueAmount, dateDeposited: $dateDeposited, dueDate: $dueDate, status: $status, closureType: $closureType, previousDepositId: $previousDepositId, nextDepositId: $nextDepositId, chainId: $chainId, createdAt: $createdAt, updatedAt: $updatedAt, notes: $notes, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepositImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.srNo, srNo) || other.srNo == srNo) &&
            const DeepCollectionEquality().equals(other._holders, _holders) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.fdrNo, fdrNo) || other.fdrNo == fdrNo) &&
            (identical(other.amountDeposited, amountDeposited) ||
                other.amountDeposited == amountDeposited) &&
            (identical(other.dueAmount, dueAmount) ||
                other.dueAmount == dueAmount) &&
            (identical(other.dateDeposited, dateDeposited) ||
                other.dateDeposited == dateDeposited) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.closureType, closureType) ||
                other.closureType == closureType) &&
            (identical(other.previousDepositId, previousDepositId) ||
                other.previousDepositId == previousDepositId) &&
            (identical(other.nextDepositId, nextDepositId) ||
                other.nextDepositId == nextDepositId) &&
            (identical(other.chainId, chainId) || other.chainId == chainId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        srNo,
        const DeepCollectionEquality().hash(_holders),
        bankName,
        accountNumber,
        fdrNo,
        amountDeposited,
        dueAmount,
        dateDeposited,
        dueDate,
        status,
        closureType,
        previousDepositId,
        nextDepositId,
        chainId,
        createdAt,
        updatedAt,
        notes,
        const DeepCollectionEquality().hash(_attachments)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DepositImplCopyWith<_$DepositImpl> get copyWith =>
      __$$DepositImplCopyWithImpl<_$DepositImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DepositImplToJson(
      this,
    );
  }
}

abstract class _Deposit extends Deposit {
  const factory _Deposit(
      {required final String id,
      required final String srNo,
      required final List<String> holders,
      required final String bankName,
      required final String accountNumber,
      required final String fdrNo,
      required final double amountDeposited,
      required final double dueAmount,
      required final DateTime dateDeposited,
      required final DateTime dueDate,
      final DepositStatus status,
      final ClosureType? closureType,
      final String? previousDepositId,
      final String? nextDepositId,
      final String? chainId,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final String? notes,
      final List<Attachment> attachments}) = _$DepositImpl;
  const _Deposit._() : super._();

  factory _Deposit.fromJson(Map<String, dynamic> json) = _$DepositImpl.fromJson;

  @override
  String get id;
  @override
  String get srNo;
  @override
  List<String> get holders;
  @override
  String get bankName;
  @override
  String get accountNumber;
  @override
  String get fdrNo;
  @override
  double get amountDeposited;
  @override
  double get dueAmount;
  @override
  DateTime get dateDeposited;
  @override
  DateTime get dueDate;
  @override
  DepositStatus get status;
  @override
  ClosureType? get closureType;
  @override
  String? get previousDepositId;
  @override
  String? get nextDepositId;
  @override
  String? get chainId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String? get notes;
  @override
  List<Attachment> get attachments;
  @override
  @JsonKey(ignore: true)
  _$$DepositImplCopyWith<_$DepositImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
