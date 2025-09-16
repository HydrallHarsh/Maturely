// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchFilters {
  String get query => throw _privateConstructorUsedError;
  List<DepositStatus> get statusFilters => throw _privateConstructorUsedError;
  List<String> get bankFilters => throw _privateConstructorUsedError;
  List<String> get holderFilters => throw _privateConstructorUsedError;
  DateTime? get fromDate => throw _privateConstructorUsedError;
  DateTime? get toDate => throw _privateConstructorUsedError;
  DateTime? get maturityFromDate => throw _privateConstructorUsedError;
  DateTime? get maturityToDate => throw _privateConstructorUsedError;
  double? get minAmount => throw _privateConstructorUsedError;
  double? get maxAmount => throw _privateConstructorUsedError;
  double? get minDueAmount => throw _privateConstructorUsedError;
  double? get maxDueAmount => throw _privateConstructorUsedError;
  SearchSortBy get sortBy => throw _privateConstructorUsedError;
  SortOrder get sortOrder => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchFiltersCopyWith<SearchFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchFiltersCopyWith<$Res> {
  factory $SearchFiltersCopyWith(
          SearchFilters value, $Res Function(SearchFilters) then) =
      _$SearchFiltersCopyWithImpl<$Res, SearchFilters>;
  @useResult
  $Res call(
      {String query,
      List<DepositStatus> statusFilters,
      List<String> bankFilters,
      List<String> holderFilters,
      DateTime? fromDate,
      DateTime? toDate,
      DateTime? maturityFromDate,
      DateTime? maturityToDate,
      double? minAmount,
      double? maxAmount,
      double? minDueAmount,
      double? maxDueAmount,
      SearchSortBy sortBy,
      SortOrder sortOrder});
}

/// @nodoc
class _$SearchFiltersCopyWithImpl<$Res, $Val extends SearchFilters>
    implements $SearchFiltersCopyWith<$Res> {
  _$SearchFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? statusFilters = null,
    Object? bankFilters = null,
    Object? holderFilters = null,
    Object? fromDate = freezed,
    Object? toDate = freezed,
    Object? maturityFromDate = freezed,
    Object? maturityToDate = freezed,
    Object? minAmount = freezed,
    Object? maxAmount = freezed,
    Object? minDueAmount = freezed,
    Object? maxDueAmount = freezed,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      statusFilters: null == statusFilters
          ? _value.statusFilters
          : statusFilters // ignore: cast_nullable_to_non_nullable
              as List<DepositStatus>,
      bankFilters: null == bankFilters
          ? _value.bankFilters
          : bankFilters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      holderFilters: null == holderFilters
          ? _value.holderFilters
          : holderFilters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fromDate: freezed == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      maturityFromDate: freezed == maturityFromDate
          ? _value.maturityFromDate
          : maturityFromDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      maturityToDate: freezed == maturityToDate
          ? _value.maturityToDate
          : maturityToDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minAmount: freezed == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      maxAmount: freezed == maxAmount
          ? _value.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      minDueAmount: freezed == minDueAmount
          ? _value.minDueAmount
          : minDueAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      maxDueAmount: freezed == maxDueAmount
          ? _value.maxDueAmount
          : maxDueAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SearchSortBy,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SortOrder,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchFiltersImplCopyWith<$Res>
    implements $SearchFiltersCopyWith<$Res> {
  factory _$$SearchFiltersImplCopyWith(
          _$SearchFiltersImpl value, $Res Function(_$SearchFiltersImpl) then) =
      __$$SearchFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String query,
      List<DepositStatus> statusFilters,
      List<String> bankFilters,
      List<String> holderFilters,
      DateTime? fromDate,
      DateTime? toDate,
      DateTime? maturityFromDate,
      DateTime? maturityToDate,
      double? minAmount,
      double? maxAmount,
      double? minDueAmount,
      double? maxDueAmount,
      SearchSortBy sortBy,
      SortOrder sortOrder});
}

/// @nodoc
class __$$SearchFiltersImplCopyWithImpl<$Res>
    extends _$SearchFiltersCopyWithImpl<$Res, _$SearchFiltersImpl>
    implements _$$SearchFiltersImplCopyWith<$Res> {
  __$$SearchFiltersImplCopyWithImpl(
      _$SearchFiltersImpl _value, $Res Function(_$SearchFiltersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? statusFilters = null,
    Object? bankFilters = null,
    Object? holderFilters = null,
    Object? fromDate = freezed,
    Object? toDate = freezed,
    Object? maturityFromDate = freezed,
    Object? maturityToDate = freezed,
    Object? minAmount = freezed,
    Object? maxAmount = freezed,
    Object? minDueAmount = freezed,
    Object? maxDueAmount = freezed,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(_$SearchFiltersImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      statusFilters: null == statusFilters
          ? _value._statusFilters
          : statusFilters // ignore: cast_nullable_to_non_nullable
              as List<DepositStatus>,
      bankFilters: null == bankFilters
          ? _value._bankFilters
          : bankFilters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      holderFilters: null == holderFilters
          ? _value._holderFilters
          : holderFilters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fromDate: freezed == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      maturityFromDate: freezed == maturityFromDate
          ? _value.maturityFromDate
          : maturityFromDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      maturityToDate: freezed == maturityToDate
          ? _value.maturityToDate
          : maturityToDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minAmount: freezed == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      maxAmount: freezed == maxAmount
          ? _value.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      minDueAmount: freezed == minDueAmount
          ? _value.minDueAmount
          : minDueAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      maxDueAmount: freezed == maxDueAmount
          ? _value.maxDueAmount
          : maxDueAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SearchSortBy,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SortOrder,
    ));
  }
}

/// @nodoc

class _$SearchFiltersImpl extends _SearchFilters {
  const _$SearchFiltersImpl(
      {this.query = '',
      final List<DepositStatus> statusFilters = const [],
      final List<String> bankFilters = const [],
      final List<String> holderFilters = const [],
      this.fromDate,
      this.toDate,
      this.maturityFromDate,
      this.maturityToDate,
      this.minAmount,
      this.maxAmount,
      this.minDueAmount,
      this.maxDueAmount,
      this.sortBy = SearchSortBy.dateCreated,
      this.sortOrder = SortOrder.descending})
      : _statusFilters = statusFilters,
        _bankFilters = bankFilters,
        _holderFilters = holderFilters,
        super._();

  @override
  @JsonKey()
  final String query;
  final List<DepositStatus> _statusFilters;
  @override
  @JsonKey()
  List<DepositStatus> get statusFilters {
    if (_statusFilters is EqualUnmodifiableListView) return _statusFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statusFilters);
  }

  final List<String> _bankFilters;
  @override
  @JsonKey()
  List<String> get bankFilters {
    if (_bankFilters is EqualUnmodifiableListView) return _bankFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bankFilters);
  }

  final List<String> _holderFilters;
  @override
  @JsonKey()
  List<String> get holderFilters {
    if (_holderFilters is EqualUnmodifiableListView) return _holderFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_holderFilters);
  }

  @override
  final DateTime? fromDate;
  @override
  final DateTime? toDate;
  @override
  final DateTime? maturityFromDate;
  @override
  final DateTime? maturityToDate;
  @override
  final double? minAmount;
  @override
  final double? maxAmount;
  @override
  final double? minDueAmount;
  @override
  final double? maxDueAmount;
  @override
  @JsonKey()
  final SearchSortBy sortBy;
  @override
  @JsonKey()
  final SortOrder sortOrder;

  @override
  String toString() {
    return 'SearchFilters(query: $query, statusFilters: $statusFilters, bankFilters: $bankFilters, holderFilters: $holderFilters, fromDate: $fromDate, toDate: $toDate, maturityFromDate: $maturityFromDate, maturityToDate: $maturityToDate, minAmount: $minAmount, maxAmount: $maxAmount, minDueAmount: $minDueAmount, maxDueAmount: $maxDueAmount, sortBy: $sortBy, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchFiltersImpl &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality()
                .equals(other._statusFilters, _statusFilters) &&
            const DeepCollectionEquality()
                .equals(other._bankFilters, _bankFilters) &&
            const DeepCollectionEquality()
                .equals(other._holderFilters, _holderFilters) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.toDate, toDate) || other.toDate == toDate) &&
            (identical(other.maturityFromDate, maturityFromDate) ||
                other.maturityFromDate == maturityFromDate) &&
            (identical(other.maturityToDate, maturityToDate) ||
                other.maturityToDate == maturityToDate) &&
            (identical(other.minAmount, minAmount) ||
                other.minAmount == minAmount) &&
            (identical(other.maxAmount, maxAmount) ||
                other.maxAmount == maxAmount) &&
            (identical(other.minDueAmount, minDueAmount) ||
                other.minDueAmount == minDueAmount) &&
            (identical(other.maxDueAmount, maxDueAmount) ||
                other.maxDueAmount == maxDueAmount) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      query,
      const DeepCollectionEquality().hash(_statusFilters),
      const DeepCollectionEquality().hash(_bankFilters),
      const DeepCollectionEquality().hash(_holderFilters),
      fromDate,
      toDate,
      maturityFromDate,
      maturityToDate,
      minAmount,
      maxAmount,
      minDueAmount,
      maxDueAmount,
      sortBy,
      sortOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchFiltersImplCopyWith<_$SearchFiltersImpl> get copyWith =>
      __$$SearchFiltersImplCopyWithImpl<_$SearchFiltersImpl>(this, _$identity);
}

abstract class _SearchFilters extends SearchFilters {
  const factory _SearchFilters(
      {final String query,
      final List<DepositStatus> statusFilters,
      final List<String> bankFilters,
      final List<String> holderFilters,
      final DateTime? fromDate,
      final DateTime? toDate,
      final DateTime? maturityFromDate,
      final DateTime? maturityToDate,
      final double? minAmount,
      final double? maxAmount,
      final double? minDueAmount,
      final double? maxDueAmount,
      final SearchSortBy sortBy,
      final SortOrder sortOrder}) = _$SearchFiltersImpl;
  const _SearchFilters._() : super._();

  @override
  String get query;
  @override
  List<DepositStatus> get statusFilters;
  @override
  List<String> get bankFilters;
  @override
  List<String> get holderFilters;
  @override
  DateTime? get fromDate;
  @override
  DateTime? get toDate;
  @override
  DateTime? get maturityFromDate;
  @override
  DateTime? get maturityToDate;
  @override
  double? get minAmount;
  @override
  double? get maxAmount;
  @override
  double? get minDueAmount;
  @override
  double? get maxDueAmount;
  @override
  SearchSortBy get sortBy;
  @override
  SortOrder get sortOrder;
  @override
  @JsonKey(ignore: true)
  _$$SearchFiltersImplCopyWith<_$SearchFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
