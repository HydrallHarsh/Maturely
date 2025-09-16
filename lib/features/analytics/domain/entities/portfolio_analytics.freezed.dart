// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_analytics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PortfolioAnalytics {
  PortfolioSummary get summary => throw _privateConstructorUsedError;
  List<BankDistribution> get bankDistribution =>
      throw _privateConstructorUsedError;
  List<StatusDistribution> get statusDistribution =>
      throw _privateConstructorUsedError;
  List<MonthlyTrend> get monthlyTrends => throw _privateConstructorUsedError;
  List<MaturityTimeline> get maturityTimeline =>
      throw _privateConstructorUsedError;
  PerformanceMetrics get performance => throw _privateConstructorUsedError;
  List<HolderDistribution> get holderDistribution =>
      throw _privateConstructorUsedError;
  List<TopPerformer> get topPerformers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PortfolioAnalyticsCopyWith<PortfolioAnalytics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioAnalyticsCopyWith<$Res> {
  factory $PortfolioAnalyticsCopyWith(
          PortfolioAnalytics value, $Res Function(PortfolioAnalytics) then) =
      _$PortfolioAnalyticsCopyWithImpl<$Res, PortfolioAnalytics>;
  @useResult
  $Res call(
      {PortfolioSummary summary,
      List<BankDistribution> bankDistribution,
      List<StatusDistribution> statusDistribution,
      List<MonthlyTrend> monthlyTrends,
      List<MaturityTimeline> maturityTimeline,
      PerformanceMetrics performance,
      List<HolderDistribution> holderDistribution,
      List<TopPerformer> topPerformers});

  $PortfolioSummaryCopyWith<$Res> get summary;
  $PerformanceMetricsCopyWith<$Res> get performance;
}

/// @nodoc
class _$PortfolioAnalyticsCopyWithImpl<$Res, $Val extends PortfolioAnalytics>
    implements $PortfolioAnalyticsCopyWith<$Res> {
  _$PortfolioAnalyticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? bankDistribution = null,
    Object? statusDistribution = null,
    Object? monthlyTrends = null,
    Object? maturityTimeline = null,
    Object? performance = null,
    Object? holderDistribution = null,
    Object? topPerformers = null,
  }) {
    return _then(_value.copyWith(
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as PortfolioSummary,
      bankDistribution: null == bankDistribution
          ? _value.bankDistribution
          : bankDistribution // ignore: cast_nullable_to_non_nullable
              as List<BankDistribution>,
      statusDistribution: null == statusDistribution
          ? _value.statusDistribution
          : statusDistribution // ignore: cast_nullable_to_non_nullable
              as List<StatusDistribution>,
      monthlyTrends: null == monthlyTrends
          ? _value.monthlyTrends
          : monthlyTrends // ignore: cast_nullable_to_non_nullable
              as List<MonthlyTrend>,
      maturityTimeline: null == maturityTimeline
          ? _value.maturityTimeline
          : maturityTimeline // ignore: cast_nullable_to_non_nullable
              as List<MaturityTimeline>,
      performance: null == performance
          ? _value.performance
          : performance // ignore: cast_nullable_to_non_nullable
              as PerformanceMetrics,
      holderDistribution: null == holderDistribution
          ? _value.holderDistribution
          : holderDistribution // ignore: cast_nullable_to_non_nullable
              as List<HolderDistribution>,
      topPerformers: null == topPerformers
          ? _value.topPerformers
          : topPerformers // ignore: cast_nullable_to_non_nullable
              as List<TopPerformer>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PortfolioSummaryCopyWith<$Res> get summary {
    return $PortfolioSummaryCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PerformanceMetricsCopyWith<$Res> get performance {
    return $PerformanceMetricsCopyWith<$Res>(_value.performance, (value) {
      return _then(_value.copyWith(performance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PortfolioAnalyticsImplCopyWith<$Res>
    implements $PortfolioAnalyticsCopyWith<$Res> {
  factory _$$PortfolioAnalyticsImplCopyWith(_$PortfolioAnalyticsImpl value,
          $Res Function(_$PortfolioAnalyticsImpl) then) =
      __$$PortfolioAnalyticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PortfolioSummary summary,
      List<BankDistribution> bankDistribution,
      List<StatusDistribution> statusDistribution,
      List<MonthlyTrend> monthlyTrends,
      List<MaturityTimeline> maturityTimeline,
      PerformanceMetrics performance,
      List<HolderDistribution> holderDistribution,
      List<TopPerformer> topPerformers});

  @override
  $PortfolioSummaryCopyWith<$Res> get summary;
  @override
  $PerformanceMetricsCopyWith<$Res> get performance;
}

/// @nodoc
class __$$PortfolioAnalyticsImplCopyWithImpl<$Res>
    extends _$PortfolioAnalyticsCopyWithImpl<$Res, _$PortfolioAnalyticsImpl>
    implements _$$PortfolioAnalyticsImplCopyWith<$Res> {
  __$$PortfolioAnalyticsImplCopyWithImpl(_$PortfolioAnalyticsImpl _value,
      $Res Function(_$PortfolioAnalyticsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? bankDistribution = null,
    Object? statusDistribution = null,
    Object? monthlyTrends = null,
    Object? maturityTimeline = null,
    Object? performance = null,
    Object? holderDistribution = null,
    Object? topPerformers = null,
  }) {
    return _then(_$PortfolioAnalyticsImpl(
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as PortfolioSummary,
      bankDistribution: null == bankDistribution
          ? _value._bankDistribution
          : bankDistribution // ignore: cast_nullable_to_non_nullable
              as List<BankDistribution>,
      statusDistribution: null == statusDistribution
          ? _value._statusDistribution
          : statusDistribution // ignore: cast_nullable_to_non_nullable
              as List<StatusDistribution>,
      monthlyTrends: null == monthlyTrends
          ? _value._monthlyTrends
          : monthlyTrends // ignore: cast_nullable_to_non_nullable
              as List<MonthlyTrend>,
      maturityTimeline: null == maturityTimeline
          ? _value._maturityTimeline
          : maturityTimeline // ignore: cast_nullable_to_non_nullable
              as List<MaturityTimeline>,
      performance: null == performance
          ? _value.performance
          : performance // ignore: cast_nullable_to_non_nullable
              as PerformanceMetrics,
      holderDistribution: null == holderDistribution
          ? _value._holderDistribution
          : holderDistribution // ignore: cast_nullable_to_non_nullable
              as List<HolderDistribution>,
      topPerformers: null == topPerformers
          ? _value._topPerformers
          : topPerformers // ignore: cast_nullable_to_non_nullable
              as List<TopPerformer>,
    ));
  }
}

/// @nodoc

class _$PortfolioAnalyticsImpl extends _PortfolioAnalytics {
  const _$PortfolioAnalyticsImpl(
      {required this.summary,
      required final List<BankDistribution> bankDistribution,
      required final List<StatusDistribution> statusDistribution,
      required final List<MonthlyTrend> monthlyTrends,
      required final List<MaturityTimeline> maturityTimeline,
      required this.performance,
      required final List<HolderDistribution> holderDistribution,
      final List<TopPerformer> topPerformers = const []})
      : _bankDistribution = bankDistribution,
        _statusDistribution = statusDistribution,
        _monthlyTrends = monthlyTrends,
        _maturityTimeline = maturityTimeline,
        _holderDistribution = holderDistribution,
        _topPerformers = topPerformers,
        super._();

  @override
  final PortfolioSummary summary;
  final List<BankDistribution> _bankDistribution;
  @override
  List<BankDistribution> get bankDistribution {
    if (_bankDistribution is EqualUnmodifiableListView)
      return _bankDistribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bankDistribution);
  }

  final List<StatusDistribution> _statusDistribution;
  @override
  List<StatusDistribution> get statusDistribution {
    if (_statusDistribution is EqualUnmodifiableListView)
      return _statusDistribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statusDistribution);
  }

  final List<MonthlyTrend> _monthlyTrends;
  @override
  List<MonthlyTrend> get monthlyTrends {
    if (_monthlyTrends is EqualUnmodifiableListView) return _monthlyTrends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthlyTrends);
  }

  final List<MaturityTimeline> _maturityTimeline;
  @override
  List<MaturityTimeline> get maturityTimeline {
    if (_maturityTimeline is EqualUnmodifiableListView)
      return _maturityTimeline;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_maturityTimeline);
  }

  @override
  final PerformanceMetrics performance;
  final List<HolderDistribution> _holderDistribution;
  @override
  List<HolderDistribution> get holderDistribution {
    if (_holderDistribution is EqualUnmodifiableListView)
      return _holderDistribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_holderDistribution);
  }

  final List<TopPerformer> _topPerformers;
  @override
  @JsonKey()
  List<TopPerformer> get topPerformers {
    if (_topPerformers is EqualUnmodifiableListView) return _topPerformers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topPerformers);
  }

  @override
  String toString() {
    return 'PortfolioAnalytics(summary: $summary, bankDistribution: $bankDistribution, statusDistribution: $statusDistribution, monthlyTrends: $monthlyTrends, maturityTimeline: $maturityTimeline, performance: $performance, holderDistribution: $holderDistribution, topPerformers: $topPerformers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioAnalyticsImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality()
                .equals(other._bankDistribution, _bankDistribution) &&
            const DeepCollectionEquality()
                .equals(other._statusDistribution, _statusDistribution) &&
            const DeepCollectionEquality()
                .equals(other._monthlyTrends, _monthlyTrends) &&
            const DeepCollectionEquality()
                .equals(other._maturityTimeline, _maturityTimeline) &&
            (identical(other.performance, performance) ||
                other.performance == performance) &&
            const DeepCollectionEquality()
                .equals(other._holderDistribution, _holderDistribution) &&
            const DeepCollectionEquality()
                .equals(other._topPerformers, _topPerformers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      summary,
      const DeepCollectionEquality().hash(_bankDistribution),
      const DeepCollectionEquality().hash(_statusDistribution),
      const DeepCollectionEquality().hash(_monthlyTrends),
      const DeepCollectionEquality().hash(_maturityTimeline),
      performance,
      const DeepCollectionEquality().hash(_holderDistribution),
      const DeepCollectionEquality().hash(_topPerformers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioAnalyticsImplCopyWith<_$PortfolioAnalyticsImpl> get copyWith =>
      __$$PortfolioAnalyticsImplCopyWithImpl<_$PortfolioAnalyticsImpl>(
          this, _$identity);
}

abstract class _PortfolioAnalytics extends PortfolioAnalytics {
  const factory _PortfolioAnalytics(
      {required final PortfolioSummary summary,
      required final List<BankDistribution> bankDistribution,
      required final List<StatusDistribution> statusDistribution,
      required final List<MonthlyTrend> monthlyTrends,
      required final List<MaturityTimeline> maturityTimeline,
      required final PerformanceMetrics performance,
      required final List<HolderDistribution> holderDistribution,
      final List<TopPerformer> topPerformers}) = _$PortfolioAnalyticsImpl;
  const _PortfolioAnalytics._() : super._();

  @override
  PortfolioSummary get summary;
  @override
  List<BankDistribution> get bankDistribution;
  @override
  List<StatusDistribution> get statusDistribution;
  @override
  List<MonthlyTrend> get monthlyTrends;
  @override
  List<MaturityTimeline> get maturityTimeline;
  @override
  PerformanceMetrics get performance;
  @override
  List<HolderDistribution> get holderDistribution;
  @override
  List<TopPerformer> get topPerformers;
  @override
  @JsonKey(ignore: true)
  _$$PortfolioAnalyticsImplCopyWith<_$PortfolioAnalyticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PortfolioSummary {
  int get totalDeposits => throw _privateConstructorUsedError;
  int get activeDeposits => throw _privateConstructorUsedError;
  int get maturedDeposits => throw _privateConstructorUsedError;
  int get closedDeposits => throw _privateConstructorUsedError;
  double get totalAmountDeposited => throw _privateConstructorUsedError;
  double get totalDueAmount => throw _privateConstructorUsedError;
  double get totalInterestEarned => throw _privateConstructorUsedError;
  int get depositsDueSoon => throw _privateConstructorUsedError;
  int get uniqueBanks => throw _privateConstructorUsedError;
  int get uniqueHolders => throw _privateConstructorUsedError;
  DateTime? get earliestDeposit => throw _privateConstructorUsedError;
  DateTime? get latestDeposit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PortfolioSummaryCopyWith<PortfolioSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioSummaryCopyWith<$Res> {
  factory $PortfolioSummaryCopyWith(
          PortfolioSummary value, $Res Function(PortfolioSummary) then) =
      _$PortfolioSummaryCopyWithImpl<$Res, PortfolioSummary>;
  @useResult
  $Res call(
      {int totalDeposits,
      int activeDeposits,
      int maturedDeposits,
      int closedDeposits,
      double totalAmountDeposited,
      double totalDueAmount,
      double totalInterestEarned,
      int depositsDueSoon,
      int uniqueBanks,
      int uniqueHolders,
      DateTime? earliestDeposit,
      DateTime? latestDeposit});
}

/// @nodoc
class _$PortfolioSummaryCopyWithImpl<$Res, $Val extends PortfolioSummary>
    implements $PortfolioSummaryCopyWith<$Res> {
  _$PortfolioSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalDeposits = null,
    Object? activeDeposits = null,
    Object? maturedDeposits = null,
    Object? closedDeposits = null,
    Object? totalAmountDeposited = null,
    Object? totalDueAmount = null,
    Object? totalInterestEarned = null,
    Object? depositsDueSoon = null,
    Object? uniqueBanks = null,
    Object? uniqueHolders = null,
    Object? earliestDeposit = freezed,
    Object? latestDeposit = freezed,
  }) {
    return _then(_value.copyWith(
      totalDeposits: null == totalDeposits
          ? _value.totalDeposits
          : totalDeposits // ignore: cast_nullable_to_non_nullable
              as int,
      activeDeposits: null == activeDeposits
          ? _value.activeDeposits
          : activeDeposits // ignore: cast_nullable_to_non_nullable
              as int,
      maturedDeposits: null == maturedDeposits
          ? _value.maturedDeposits
          : maturedDeposits // ignore: cast_nullable_to_non_nullable
              as int,
      closedDeposits: null == closedDeposits
          ? _value.closedDeposits
          : closedDeposits // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmountDeposited: null == totalAmountDeposited
          ? _value.totalAmountDeposited
          : totalAmountDeposited // ignore: cast_nullable_to_non_nullable
              as double,
      totalDueAmount: null == totalDueAmount
          ? _value.totalDueAmount
          : totalDueAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalInterestEarned: null == totalInterestEarned
          ? _value.totalInterestEarned
          : totalInterestEarned // ignore: cast_nullable_to_non_nullable
              as double,
      depositsDueSoon: null == depositsDueSoon
          ? _value.depositsDueSoon
          : depositsDueSoon // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueBanks: null == uniqueBanks
          ? _value.uniqueBanks
          : uniqueBanks // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueHolders: null == uniqueHolders
          ? _value.uniqueHolders
          : uniqueHolders // ignore: cast_nullable_to_non_nullable
              as int,
      earliestDeposit: freezed == earliestDeposit
          ? _value.earliestDeposit
          : earliestDeposit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      latestDeposit: freezed == latestDeposit
          ? _value.latestDeposit
          : latestDeposit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PortfolioSummaryImplCopyWith<$Res>
    implements $PortfolioSummaryCopyWith<$Res> {
  factory _$$PortfolioSummaryImplCopyWith(_$PortfolioSummaryImpl value,
          $Res Function(_$PortfolioSummaryImpl) then) =
      __$$PortfolioSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalDeposits,
      int activeDeposits,
      int maturedDeposits,
      int closedDeposits,
      double totalAmountDeposited,
      double totalDueAmount,
      double totalInterestEarned,
      int depositsDueSoon,
      int uniqueBanks,
      int uniqueHolders,
      DateTime? earliestDeposit,
      DateTime? latestDeposit});
}

/// @nodoc
class __$$PortfolioSummaryImplCopyWithImpl<$Res>
    extends _$PortfolioSummaryCopyWithImpl<$Res, _$PortfolioSummaryImpl>
    implements _$$PortfolioSummaryImplCopyWith<$Res> {
  __$$PortfolioSummaryImplCopyWithImpl(_$PortfolioSummaryImpl _value,
      $Res Function(_$PortfolioSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalDeposits = null,
    Object? activeDeposits = null,
    Object? maturedDeposits = null,
    Object? closedDeposits = null,
    Object? totalAmountDeposited = null,
    Object? totalDueAmount = null,
    Object? totalInterestEarned = null,
    Object? depositsDueSoon = null,
    Object? uniqueBanks = null,
    Object? uniqueHolders = null,
    Object? earliestDeposit = freezed,
    Object? latestDeposit = freezed,
  }) {
    return _then(_$PortfolioSummaryImpl(
      totalDeposits: null == totalDeposits
          ? _value.totalDeposits
          : totalDeposits // ignore: cast_nullable_to_non_nullable
              as int,
      activeDeposits: null == activeDeposits
          ? _value.activeDeposits
          : activeDeposits // ignore: cast_nullable_to_non_nullable
              as int,
      maturedDeposits: null == maturedDeposits
          ? _value.maturedDeposits
          : maturedDeposits // ignore: cast_nullable_to_non_nullable
              as int,
      closedDeposits: null == closedDeposits
          ? _value.closedDeposits
          : closedDeposits // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmountDeposited: null == totalAmountDeposited
          ? _value.totalAmountDeposited
          : totalAmountDeposited // ignore: cast_nullable_to_non_nullable
              as double,
      totalDueAmount: null == totalDueAmount
          ? _value.totalDueAmount
          : totalDueAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalInterestEarned: null == totalInterestEarned
          ? _value.totalInterestEarned
          : totalInterestEarned // ignore: cast_nullable_to_non_nullable
              as double,
      depositsDueSoon: null == depositsDueSoon
          ? _value.depositsDueSoon
          : depositsDueSoon // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueBanks: null == uniqueBanks
          ? _value.uniqueBanks
          : uniqueBanks // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueHolders: null == uniqueHolders
          ? _value.uniqueHolders
          : uniqueHolders // ignore: cast_nullable_to_non_nullable
              as int,
      earliestDeposit: freezed == earliestDeposit
          ? _value.earliestDeposit
          : earliestDeposit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      latestDeposit: freezed == latestDeposit
          ? _value.latestDeposit
          : latestDeposit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$PortfolioSummaryImpl implements _PortfolioSummary {
  const _$PortfolioSummaryImpl(
      {required this.totalDeposits,
      required this.activeDeposits,
      required this.maturedDeposits,
      required this.closedDeposits,
      required this.totalAmountDeposited,
      required this.totalDueAmount,
      required this.totalInterestEarned,
      required this.depositsDueSoon,
      required this.uniqueBanks,
      required this.uniqueHolders,
      required this.earliestDeposit,
      required this.latestDeposit});

  @override
  final int totalDeposits;
  @override
  final int activeDeposits;
  @override
  final int maturedDeposits;
  @override
  final int closedDeposits;
  @override
  final double totalAmountDeposited;
  @override
  final double totalDueAmount;
  @override
  final double totalInterestEarned;
  @override
  final int depositsDueSoon;
  @override
  final int uniqueBanks;
  @override
  final int uniqueHolders;
  @override
  final DateTime? earliestDeposit;
  @override
  final DateTime? latestDeposit;

  @override
  String toString() {
    return 'PortfolioSummary(totalDeposits: $totalDeposits, activeDeposits: $activeDeposits, maturedDeposits: $maturedDeposits, closedDeposits: $closedDeposits, totalAmountDeposited: $totalAmountDeposited, totalDueAmount: $totalDueAmount, totalInterestEarned: $totalInterestEarned, depositsDueSoon: $depositsDueSoon, uniqueBanks: $uniqueBanks, uniqueHolders: $uniqueHolders, earliestDeposit: $earliestDeposit, latestDeposit: $latestDeposit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioSummaryImpl &&
            (identical(other.totalDeposits, totalDeposits) ||
                other.totalDeposits == totalDeposits) &&
            (identical(other.activeDeposits, activeDeposits) ||
                other.activeDeposits == activeDeposits) &&
            (identical(other.maturedDeposits, maturedDeposits) ||
                other.maturedDeposits == maturedDeposits) &&
            (identical(other.closedDeposits, closedDeposits) ||
                other.closedDeposits == closedDeposits) &&
            (identical(other.totalAmountDeposited, totalAmountDeposited) ||
                other.totalAmountDeposited == totalAmountDeposited) &&
            (identical(other.totalDueAmount, totalDueAmount) ||
                other.totalDueAmount == totalDueAmount) &&
            (identical(other.totalInterestEarned, totalInterestEarned) ||
                other.totalInterestEarned == totalInterestEarned) &&
            (identical(other.depositsDueSoon, depositsDueSoon) ||
                other.depositsDueSoon == depositsDueSoon) &&
            (identical(other.uniqueBanks, uniqueBanks) ||
                other.uniqueBanks == uniqueBanks) &&
            (identical(other.uniqueHolders, uniqueHolders) ||
                other.uniqueHolders == uniqueHolders) &&
            (identical(other.earliestDeposit, earliestDeposit) ||
                other.earliestDeposit == earliestDeposit) &&
            (identical(other.latestDeposit, latestDeposit) ||
                other.latestDeposit == latestDeposit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalDeposits,
      activeDeposits,
      maturedDeposits,
      closedDeposits,
      totalAmountDeposited,
      totalDueAmount,
      totalInterestEarned,
      depositsDueSoon,
      uniqueBanks,
      uniqueHolders,
      earliestDeposit,
      latestDeposit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioSummaryImplCopyWith<_$PortfolioSummaryImpl> get copyWith =>
      __$$PortfolioSummaryImplCopyWithImpl<_$PortfolioSummaryImpl>(
          this, _$identity);
}

abstract class _PortfolioSummary implements PortfolioSummary {
  const factory _PortfolioSummary(
      {required final int totalDeposits,
      required final int activeDeposits,
      required final int maturedDeposits,
      required final int closedDeposits,
      required final double totalAmountDeposited,
      required final double totalDueAmount,
      required final double totalInterestEarned,
      required final int depositsDueSoon,
      required final int uniqueBanks,
      required final int uniqueHolders,
      required final DateTime? earliestDeposit,
      required final DateTime? latestDeposit}) = _$PortfolioSummaryImpl;

  @override
  int get totalDeposits;
  @override
  int get activeDeposits;
  @override
  int get maturedDeposits;
  @override
  int get closedDeposits;
  @override
  double get totalAmountDeposited;
  @override
  double get totalDueAmount;
  @override
  double get totalInterestEarned;
  @override
  int get depositsDueSoon;
  @override
  int get uniqueBanks;
  @override
  int get uniqueHolders;
  @override
  DateTime? get earliestDeposit;
  @override
  DateTime? get latestDeposit;
  @override
  @JsonKey(ignore: true)
  _$$PortfolioSummaryImplCopyWith<_$PortfolioSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BankDistribution {
  String get bankName => throw _privateConstructorUsedError;
  int get depositCount => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BankDistributionCopyWith<BankDistribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankDistributionCopyWith<$Res> {
  factory $BankDistributionCopyWith(
          BankDistribution value, $Res Function(BankDistribution) then) =
      _$BankDistributionCopyWithImpl<$Res, BankDistribution>;
  @useResult
  $Res call(
      {String bankName,
      int depositCount,
      double totalAmount,
      double percentage,
      String color});
}

/// @nodoc
class _$BankDistributionCopyWithImpl<$Res, $Val extends BankDistribution>
    implements $BankDistributionCopyWith<$Res> {
  _$BankDistributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankName = null,
    Object? depositCount = null,
    Object? totalAmount = null,
    Object? percentage = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      depositCount: null == depositCount
          ? _value.depositCount
          : depositCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankDistributionImplCopyWith<$Res>
    implements $BankDistributionCopyWith<$Res> {
  factory _$$BankDistributionImplCopyWith(_$BankDistributionImpl value,
          $Res Function(_$BankDistributionImpl) then) =
      __$$BankDistributionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bankName,
      int depositCount,
      double totalAmount,
      double percentage,
      String color});
}

/// @nodoc
class __$$BankDistributionImplCopyWithImpl<$Res>
    extends _$BankDistributionCopyWithImpl<$Res, _$BankDistributionImpl>
    implements _$$BankDistributionImplCopyWith<$Res> {
  __$$BankDistributionImplCopyWithImpl(_$BankDistributionImpl _value,
      $Res Function(_$BankDistributionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankName = null,
    Object? depositCount = null,
    Object? totalAmount = null,
    Object? percentage = null,
    Object? color = null,
  }) {
    return _then(_$BankDistributionImpl(
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      depositCount: null == depositCount
          ? _value.depositCount
          : depositCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BankDistributionImpl implements _BankDistribution {
  const _$BankDistributionImpl(
      {required this.bankName,
      required this.depositCount,
      required this.totalAmount,
      required this.percentage,
      required this.color});

  @override
  final String bankName;
  @override
  final int depositCount;
  @override
  final double totalAmount;
  @override
  final double percentage;
  @override
  final String color;

  @override
  String toString() {
    return 'BankDistribution(bankName: $bankName, depositCount: $depositCount, totalAmount: $totalAmount, percentage: $percentage, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankDistributionImpl &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.depositCount, depositCount) ||
                other.depositCount == depositCount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, bankName, depositCount, totalAmount, percentage, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankDistributionImplCopyWith<_$BankDistributionImpl> get copyWith =>
      __$$BankDistributionImplCopyWithImpl<_$BankDistributionImpl>(
          this, _$identity);
}

abstract class _BankDistribution implements BankDistribution {
  const factory _BankDistribution(
      {required final String bankName,
      required final int depositCount,
      required final double totalAmount,
      required final double percentage,
      required final String color}) = _$BankDistributionImpl;

  @override
  String get bankName;
  @override
  int get depositCount;
  @override
  double get totalAmount;
  @override
  double get percentage;
  @override
  String get color;
  @override
  @JsonKey(ignore: true)
  _$$BankDistributionImplCopyWith<_$BankDistributionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StatusDistribution {
  DepositStatus get status => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatusDistributionCopyWith<StatusDistribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusDistributionCopyWith<$Res> {
  factory $StatusDistributionCopyWith(
          StatusDistribution value, $Res Function(StatusDistribution) then) =
      _$StatusDistributionCopyWithImpl<$Res, StatusDistribution>;
  @useResult
  $Res call(
      {DepositStatus status,
      int count,
      double amount,
      double percentage,
      String color});
}

/// @nodoc
class _$StatusDistributionCopyWithImpl<$Res, $Val extends StatusDistribution>
    implements $StatusDistributionCopyWith<$Res> {
  _$StatusDistributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? count = null,
    Object? amount = null,
    Object? percentage = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DepositStatus,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusDistributionImplCopyWith<$Res>
    implements $StatusDistributionCopyWith<$Res> {
  factory _$$StatusDistributionImplCopyWith(_$StatusDistributionImpl value,
          $Res Function(_$StatusDistributionImpl) then) =
      __$$StatusDistributionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DepositStatus status,
      int count,
      double amount,
      double percentage,
      String color});
}

/// @nodoc
class __$$StatusDistributionImplCopyWithImpl<$Res>
    extends _$StatusDistributionCopyWithImpl<$Res, _$StatusDistributionImpl>
    implements _$$StatusDistributionImplCopyWith<$Res> {
  __$$StatusDistributionImplCopyWithImpl(_$StatusDistributionImpl _value,
      $Res Function(_$StatusDistributionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? count = null,
    Object? amount = null,
    Object? percentage = null,
    Object? color = null,
  }) {
    return _then(_$StatusDistributionImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DepositStatus,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StatusDistributionImpl implements _StatusDistribution {
  const _$StatusDistributionImpl(
      {required this.status,
      required this.count,
      required this.amount,
      required this.percentage,
      required this.color});

  @override
  final DepositStatus status;
  @override
  final int count;
  @override
  final double amount;
  @override
  final double percentage;
  @override
  final String color;

  @override
  String toString() {
    return 'StatusDistribution(status: $status, count: $count, amount: $amount, percentage: $percentage, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusDistributionImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, count, amount, percentage, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusDistributionImplCopyWith<_$StatusDistributionImpl> get copyWith =>
      __$$StatusDistributionImplCopyWithImpl<_$StatusDistributionImpl>(
          this, _$identity);
}

abstract class _StatusDistribution implements StatusDistribution {
  const factory _StatusDistribution(
      {required final DepositStatus status,
      required final int count,
      required final double amount,
      required final double percentage,
      required final String color}) = _$StatusDistributionImpl;

  @override
  DepositStatus get status;
  @override
  int get count;
  @override
  double get amount;
  @override
  double get percentage;
  @override
  String get color;
  @override
  @JsonKey(ignore: true)
  _$$StatusDistributionImplCopyWith<_$StatusDistributionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MonthlyTrend {
  DateTime get month => throw _privateConstructorUsedError;
  double get depositsAmount => throw _privateConstructorUsedError;
  double get maturityAmount => throw _privateConstructorUsedError;
  int get depositCount => throw _privateConstructorUsedError;
  int get maturityCount => throw _privateConstructorUsedError;
  double get cumulativeAmount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MonthlyTrendCopyWith<MonthlyTrend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyTrendCopyWith<$Res> {
  factory $MonthlyTrendCopyWith(
          MonthlyTrend value, $Res Function(MonthlyTrend) then) =
      _$MonthlyTrendCopyWithImpl<$Res, MonthlyTrend>;
  @useResult
  $Res call(
      {DateTime month,
      double depositsAmount,
      double maturityAmount,
      int depositCount,
      int maturityCount,
      double cumulativeAmount});
}

/// @nodoc
class _$MonthlyTrendCopyWithImpl<$Res, $Val extends MonthlyTrend>
    implements $MonthlyTrendCopyWith<$Res> {
  _$MonthlyTrendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? depositsAmount = null,
    Object? maturityAmount = null,
    Object? depositCount = null,
    Object? maturityCount = null,
    Object? cumulativeAmount = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime,
      depositsAmount: null == depositsAmount
          ? _value.depositsAmount
          : depositsAmount // ignore: cast_nullable_to_non_nullable
              as double,
      maturityAmount: null == maturityAmount
          ? _value.maturityAmount
          : maturityAmount // ignore: cast_nullable_to_non_nullable
              as double,
      depositCount: null == depositCount
          ? _value.depositCount
          : depositCount // ignore: cast_nullable_to_non_nullable
              as int,
      maturityCount: null == maturityCount
          ? _value.maturityCount
          : maturityCount // ignore: cast_nullable_to_non_nullable
              as int,
      cumulativeAmount: null == cumulativeAmount
          ? _value.cumulativeAmount
          : cumulativeAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlyTrendImplCopyWith<$Res>
    implements $MonthlyTrendCopyWith<$Res> {
  factory _$$MonthlyTrendImplCopyWith(
          _$MonthlyTrendImpl value, $Res Function(_$MonthlyTrendImpl) then) =
      __$$MonthlyTrendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime month,
      double depositsAmount,
      double maturityAmount,
      int depositCount,
      int maturityCount,
      double cumulativeAmount});
}

/// @nodoc
class __$$MonthlyTrendImplCopyWithImpl<$Res>
    extends _$MonthlyTrendCopyWithImpl<$Res, _$MonthlyTrendImpl>
    implements _$$MonthlyTrendImplCopyWith<$Res> {
  __$$MonthlyTrendImplCopyWithImpl(
      _$MonthlyTrendImpl _value, $Res Function(_$MonthlyTrendImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? depositsAmount = null,
    Object? maturityAmount = null,
    Object? depositCount = null,
    Object? maturityCount = null,
    Object? cumulativeAmount = null,
  }) {
    return _then(_$MonthlyTrendImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime,
      depositsAmount: null == depositsAmount
          ? _value.depositsAmount
          : depositsAmount // ignore: cast_nullable_to_non_nullable
              as double,
      maturityAmount: null == maturityAmount
          ? _value.maturityAmount
          : maturityAmount // ignore: cast_nullable_to_non_nullable
              as double,
      depositCount: null == depositCount
          ? _value.depositCount
          : depositCount // ignore: cast_nullable_to_non_nullable
              as int,
      maturityCount: null == maturityCount
          ? _value.maturityCount
          : maturityCount // ignore: cast_nullable_to_non_nullable
              as int,
      cumulativeAmount: null == cumulativeAmount
          ? _value.cumulativeAmount
          : cumulativeAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$MonthlyTrendImpl implements _MonthlyTrend {
  const _$MonthlyTrendImpl(
      {required this.month,
      required this.depositsAmount,
      required this.maturityAmount,
      required this.depositCount,
      required this.maturityCount,
      required this.cumulativeAmount});

  @override
  final DateTime month;
  @override
  final double depositsAmount;
  @override
  final double maturityAmount;
  @override
  final int depositCount;
  @override
  final int maturityCount;
  @override
  final double cumulativeAmount;

  @override
  String toString() {
    return 'MonthlyTrend(month: $month, depositsAmount: $depositsAmount, maturityAmount: $maturityAmount, depositCount: $depositCount, maturityCount: $maturityCount, cumulativeAmount: $cumulativeAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyTrendImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.depositsAmount, depositsAmount) ||
                other.depositsAmount == depositsAmount) &&
            (identical(other.maturityAmount, maturityAmount) ||
                other.maturityAmount == maturityAmount) &&
            (identical(other.depositCount, depositCount) ||
                other.depositCount == depositCount) &&
            (identical(other.maturityCount, maturityCount) ||
                other.maturityCount == maturityCount) &&
            (identical(other.cumulativeAmount, cumulativeAmount) ||
                other.cumulativeAmount == cumulativeAmount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, month, depositsAmount,
      maturityAmount, depositCount, maturityCount, cumulativeAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyTrendImplCopyWith<_$MonthlyTrendImpl> get copyWith =>
      __$$MonthlyTrendImplCopyWithImpl<_$MonthlyTrendImpl>(this, _$identity);
}

abstract class _MonthlyTrend implements MonthlyTrend {
  const factory _MonthlyTrend(
      {required final DateTime month,
      required final double depositsAmount,
      required final double maturityAmount,
      required final int depositCount,
      required final int maturityCount,
      required final double cumulativeAmount}) = _$MonthlyTrendImpl;

  @override
  DateTime get month;
  @override
  double get depositsAmount;
  @override
  double get maturityAmount;
  @override
  int get depositCount;
  @override
  int get maturityCount;
  @override
  double get cumulativeAmount;
  @override
  @JsonKey(ignore: true)
  _$$MonthlyTrendImplCopyWith<_$MonthlyTrendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MaturityTimeline {
  DateTime get month => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  List<String> get depositIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaturityTimelineCopyWith<MaturityTimeline> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaturityTimelineCopyWith<$Res> {
  factory $MaturityTimelineCopyWith(
          MaturityTimeline value, $Res Function(MaturityTimeline) then) =
      _$MaturityTimelineCopyWithImpl<$Res, MaturityTimeline>;
  @useResult
  $Res call(
      {DateTime month, double amount, int count, List<String> depositIds});
}

/// @nodoc
class _$MaturityTimelineCopyWithImpl<$Res, $Val extends MaturityTimeline>
    implements $MaturityTimelineCopyWith<$Res> {
  _$MaturityTimelineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? amount = null,
    Object? count = null,
    Object? depositIds = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      depositIds: null == depositIds
          ? _value.depositIds
          : depositIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaturityTimelineImplCopyWith<$Res>
    implements $MaturityTimelineCopyWith<$Res> {
  factory _$$MaturityTimelineImplCopyWith(_$MaturityTimelineImpl value,
          $Res Function(_$MaturityTimelineImpl) then) =
      __$$MaturityTimelineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime month, double amount, int count, List<String> depositIds});
}

/// @nodoc
class __$$MaturityTimelineImplCopyWithImpl<$Res>
    extends _$MaturityTimelineCopyWithImpl<$Res, _$MaturityTimelineImpl>
    implements _$$MaturityTimelineImplCopyWith<$Res> {
  __$$MaturityTimelineImplCopyWithImpl(_$MaturityTimelineImpl _value,
      $Res Function(_$MaturityTimelineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? amount = null,
    Object? count = null,
    Object? depositIds = null,
  }) {
    return _then(_$MaturityTimelineImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      depositIds: null == depositIds
          ? _value._depositIds
          : depositIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$MaturityTimelineImpl implements _MaturityTimeline {
  const _$MaturityTimelineImpl(
      {required this.month,
      required this.amount,
      required this.count,
      required final List<String> depositIds})
      : _depositIds = depositIds;

  @override
  final DateTime month;
  @override
  final double amount;
  @override
  final int count;
  final List<String> _depositIds;
  @override
  List<String> get depositIds {
    if (_depositIds is EqualUnmodifiableListView) return _depositIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_depositIds);
  }

  @override
  String toString() {
    return 'MaturityTimeline(month: $month, amount: $amount, count: $count, depositIds: $depositIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaturityTimelineImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality()
                .equals(other._depositIds, _depositIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, month, amount, count,
      const DeepCollectionEquality().hash(_depositIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaturityTimelineImplCopyWith<_$MaturityTimelineImpl> get copyWith =>
      __$$MaturityTimelineImplCopyWithImpl<_$MaturityTimelineImpl>(
          this, _$identity);
}

abstract class _MaturityTimeline implements MaturityTimeline {
  const factory _MaturityTimeline(
      {required final DateTime month,
      required final double amount,
      required final int count,
      required final List<String> depositIds}) = _$MaturityTimelineImpl;

  @override
  DateTime get month;
  @override
  double get amount;
  @override
  int get count;
  @override
  List<String> get depositIds;
  @override
  @JsonKey(ignore: true)
  _$$MaturityTimelineImplCopyWith<_$MaturityTimelineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PerformanceMetrics {
  double get averageInterestRate => throw _privateConstructorUsedError;
  double get totalInterestEarned => throw _privateConstructorUsedError;
  double get projectedAnnualIncome => throw _privateConstructorUsedError;
  double get averageMaturityPeriod => throw _privateConstructorUsedError;
  double get riskScore => throw _privateConstructorUsedError;
  String get riskLevel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PerformanceMetricsCopyWith<PerformanceMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceMetricsCopyWith<$Res> {
  factory $PerformanceMetricsCopyWith(
          PerformanceMetrics value, $Res Function(PerformanceMetrics) then) =
      _$PerformanceMetricsCopyWithImpl<$Res, PerformanceMetrics>;
  @useResult
  $Res call(
      {double averageInterestRate,
      double totalInterestEarned,
      double projectedAnnualIncome,
      double averageMaturityPeriod,
      double riskScore,
      String riskLevel});
}

/// @nodoc
class _$PerformanceMetricsCopyWithImpl<$Res, $Val extends PerformanceMetrics>
    implements $PerformanceMetricsCopyWith<$Res> {
  _$PerformanceMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? averageInterestRate = null,
    Object? totalInterestEarned = null,
    Object? projectedAnnualIncome = null,
    Object? averageMaturityPeriod = null,
    Object? riskScore = null,
    Object? riskLevel = null,
  }) {
    return _then(_value.copyWith(
      averageInterestRate: null == averageInterestRate
          ? _value.averageInterestRate
          : averageInterestRate // ignore: cast_nullable_to_non_nullable
              as double,
      totalInterestEarned: null == totalInterestEarned
          ? _value.totalInterestEarned
          : totalInterestEarned // ignore: cast_nullable_to_non_nullable
              as double,
      projectedAnnualIncome: null == projectedAnnualIncome
          ? _value.projectedAnnualIncome
          : projectedAnnualIncome // ignore: cast_nullable_to_non_nullable
              as double,
      averageMaturityPeriod: null == averageMaturityPeriod
          ? _value.averageMaturityPeriod
          : averageMaturityPeriod // ignore: cast_nullable_to_non_nullable
              as double,
      riskScore: null == riskScore
          ? _value.riskScore
          : riskScore // ignore: cast_nullable_to_non_nullable
              as double,
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerformanceMetricsImplCopyWith<$Res>
    implements $PerformanceMetricsCopyWith<$Res> {
  factory _$$PerformanceMetricsImplCopyWith(_$PerformanceMetricsImpl value,
          $Res Function(_$PerformanceMetricsImpl) then) =
      __$$PerformanceMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double averageInterestRate,
      double totalInterestEarned,
      double projectedAnnualIncome,
      double averageMaturityPeriod,
      double riskScore,
      String riskLevel});
}

/// @nodoc
class __$$PerformanceMetricsImplCopyWithImpl<$Res>
    extends _$PerformanceMetricsCopyWithImpl<$Res, _$PerformanceMetricsImpl>
    implements _$$PerformanceMetricsImplCopyWith<$Res> {
  __$$PerformanceMetricsImplCopyWithImpl(_$PerformanceMetricsImpl _value,
      $Res Function(_$PerformanceMetricsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? averageInterestRate = null,
    Object? totalInterestEarned = null,
    Object? projectedAnnualIncome = null,
    Object? averageMaturityPeriod = null,
    Object? riskScore = null,
    Object? riskLevel = null,
  }) {
    return _then(_$PerformanceMetricsImpl(
      averageInterestRate: null == averageInterestRate
          ? _value.averageInterestRate
          : averageInterestRate // ignore: cast_nullable_to_non_nullable
              as double,
      totalInterestEarned: null == totalInterestEarned
          ? _value.totalInterestEarned
          : totalInterestEarned // ignore: cast_nullable_to_non_nullable
              as double,
      projectedAnnualIncome: null == projectedAnnualIncome
          ? _value.projectedAnnualIncome
          : projectedAnnualIncome // ignore: cast_nullable_to_non_nullable
              as double,
      averageMaturityPeriod: null == averageMaturityPeriod
          ? _value.averageMaturityPeriod
          : averageMaturityPeriod // ignore: cast_nullable_to_non_nullable
              as double,
      riskScore: null == riskScore
          ? _value.riskScore
          : riskScore // ignore: cast_nullable_to_non_nullable
              as double,
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PerformanceMetricsImpl implements _PerformanceMetrics {
  const _$PerformanceMetricsImpl(
      {required this.averageInterestRate,
      required this.totalInterestEarned,
      required this.projectedAnnualIncome,
      required this.averageMaturityPeriod,
      required this.riskScore,
      required this.riskLevel});

  @override
  final double averageInterestRate;
  @override
  final double totalInterestEarned;
  @override
  final double projectedAnnualIncome;
  @override
  final double averageMaturityPeriod;
  @override
  final double riskScore;
  @override
  final String riskLevel;

  @override
  String toString() {
    return 'PerformanceMetrics(averageInterestRate: $averageInterestRate, totalInterestEarned: $totalInterestEarned, projectedAnnualIncome: $projectedAnnualIncome, averageMaturityPeriod: $averageMaturityPeriod, riskScore: $riskScore, riskLevel: $riskLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceMetricsImpl &&
            (identical(other.averageInterestRate, averageInterestRate) ||
                other.averageInterestRate == averageInterestRate) &&
            (identical(other.totalInterestEarned, totalInterestEarned) ||
                other.totalInterestEarned == totalInterestEarned) &&
            (identical(other.projectedAnnualIncome, projectedAnnualIncome) ||
                other.projectedAnnualIncome == projectedAnnualIncome) &&
            (identical(other.averageMaturityPeriod, averageMaturityPeriod) ||
                other.averageMaturityPeriod == averageMaturityPeriod) &&
            (identical(other.riskScore, riskScore) ||
                other.riskScore == riskScore) &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      averageInterestRate,
      totalInterestEarned,
      projectedAnnualIncome,
      averageMaturityPeriod,
      riskScore,
      riskLevel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceMetricsImplCopyWith<_$PerformanceMetricsImpl> get copyWith =>
      __$$PerformanceMetricsImplCopyWithImpl<_$PerformanceMetricsImpl>(
          this, _$identity);
}

abstract class _PerformanceMetrics implements PerformanceMetrics {
  const factory _PerformanceMetrics(
      {required final double averageInterestRate,
      required final double totalInterestEarned,
      required final double projectedAnnualIncome,
      required final double averageMaturityPeriod,
      required final double riskScore,
      required final String riskLevel}) = _$PerformanceMetricsImpl;

  @override
  double get averageInterestRate;
  @override
  double get totalInterestEarned;
  @override
  double get projectedAnnualIncome;
  @override
  double get averageMaturityPeriod;
  @override
  double get riskScore;
  @override
  String get riskLevel;
  @override
  @JsonKey(ignore: true)
  _$$PerformanceMetricsImplCopyWith<_$PerformanceMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HolderDistribution {
  String get holderName => throw _privateConstructorUsedError;
  int get depositCount => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HolderDistributionCopyWith<HolderDistribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HolderDistributionCopyWith<$Res> {
  factory $HolderDistributionCopyWith(
          HolderDistribution value, $Res Function(HolderDistribution) then) =
      _$HolderDistributionCopyWithImpl<$Res, HolderDistribution>;
  @useResult
  $Res call(
      {String holderName,
      int depositCount,
      double totalAmount,
      double percentage});
}

/// @nodoc
class _$HolderDistributionCopyWithImpl<$Res, $Val extends HolderDistribution>
    implements $HolderDistributionCopyWith<$Res> {
  _$HolderDistributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? holderName = null,
    Object? depositCount = null,
    Object? totalAmount = null,
    Object? percentage = null,
  }) {
    return _then(_value.copyWith(
      holderName: null == holderName
          ? _value.holderName
          : holderName // ignore: cast_nullable_to_non_nullable
              as String,
      depositCount: null == depositCount
          ? _value.depositCount
          : depositCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HolderDistributionImplCopyWith<$Res>
    implements $HolderDistributionCopyWith<$Res> {
  factory _$$HolderDistributionImplCopyWith(_$HolderDistributionImpl value,
          $Res Function(_$HolderDistributionImpl) then) =
      __$$HolderDistributionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String holderName,
      int depositCount,
      double totalAmount,
      double percentage});
}

/// @nodoc
class __$$HolderDistributionImplCopyWithImpl<$Res>
    extends _$HolderDistributionCopyWithImpl<$Res, _$HolderDistributionImpl>
    implements _$$HolderDistributionImplCopyWith<$Res> {
  __$$HolderDistributionImplCopyWithImpl(_$HolderDistributionImpl _value,
      $Res Function(_$HolderDistributionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? holderName = null,
    Object? depositCount = null,
    Object? totalAmount = null,
    Object? percentage = null,
  }) {
    return _then(_$HolderDistributionImpl(
      holderName: null == holderName
          ? _value.holderName
          : holderName // ignore: cast_nullable_to_non_nullable
              as String,
      depositCount: null == depositCount
          ? _value.depositCount
          : depositCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$HolderDistributionImpl implements _HolderDistribution {
  const _$HolderDistributionImpl(
      {required this.holderName,
      required this.depositCount,
      required this.totalAmount,
      required this.percentage});

  @override
  final String holderName;
  @override
  final int depositCount;
  @override
  final double totalAmount;
  @override
  final double percentage;

  @override
  String toString() {
    return 'HolderDistribution(holderName: $holderName, depositCount: $depositCount, totalAmount: $totalAmount, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HolderDistributionImpl &&
            (identical(other.holderName, holderName) ||
                other.holderName == holderName) &&
            (identical(other.depositCount, depositCount) ||
                other.depositCount == depositCount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, holderName, depositCount, totalAmount, percentage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HolderDistributionImplCopyWith<_$HolderDistributionImpl> get copyWith =>
      __$$HolderDistributionImplCopyWithImpl<_$HolderDistributionImpl>(
          this, _$identity);
}

abstract class _HolderDistribution implements HolderDistribution {
  const factory _HolderDistribution(
      {required final String holderName,
      required final int depositCount,
      required final double totalAmount,
      required final double percentage}) = _$HolderDistributionImpl;

  @override
  String get holderName;
  @override
  int get depositCount;
  @override
  double get totalAmount;
  @override
  double get percentage;
  @override
  @JsonKey(ignore: true)
  _$$HolderDistributionImplCopyWith<_$HolderDistributionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TopPerformer {
  String get depositId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get metric => throw _privateConstructorUsedError;
  String get displayValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TopPerformerCopyWith<TopPerformer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopPerformerCopyWith<$Res> {
  factory $TopPerformerCopyWith(
          TopPerformer value, $Res Function(TopPerformer) then) =
      _$TopPerformerCopyWithImpl<$Res, TopPerformer>;
  @useResult
  $Res call(
      {String depositId,
      String title,
      double value,
      String metric,
      String displayValue});
}

/// @nodoc
class _$TopPerformerCopyWithImpl<$Res, $Val extends TopPerformer>
    implements $TopPerformerCopyWith<$Res> {
  _$TopPerformerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? depositId = null,
    Object? title = null,
    Object? value = null,
    Object? metric = null,
    Object? displayValue = null,
  }) {
    return _then(_value.copyWith(
      depositId: null == depositId
          ? _value.depositId
          : depositId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      metric: null == metric
          ? _value.metric
          : metric // ignore: cast_nullable_to_non_nullable
              as String,
      displayValue: null == displayValue
          ? _value.displayValue
          : displayValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopPerformerImplCopyWith<$Res>
    implements $TopPerformerCopyWith<$Res> {
  factory _$$TopPerformerImplCopyWith(
          _$TopPerformerImpl value, $Res Function(_$TopPerformerImpl) then) =
      __$$TopPerformerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String depositId,
      String title,
      double value,
      String metric,
      String displayValue});
}

/// @nodoc
class __$$TopPerformerImplCopyWithImpl<$Res>
    extends _$TopPerformerCopyWithImpl<$Res, _$TopPerformerImpl>
    implements _$$TopPerformerImplCopyWith<$Res> {
  __$$TopPerformerImplCopyWithImpl(
      _$TopPerformerImpl _value, $Res Function(_$TopPerformerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? depositId = null,
    Object? title = null,
    Object? value = null,
    Object? metric = null,
    Object? displayValue = null,
  }) {
    return _then(_$TopPerformerImpl(
      depositId: null == depositId
          ? _value.depositId
          : depositId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      metric: null == metric
          ? _value.metric
          : metric // ignore: cast_nullable_to_non_nullable
              as String,
      displayValue: null == displayValue
          ? _value.displayValue
          : displayValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TopPerformerImpl implements _TopPerformer {
  const _$TopPerformerImpl(
      {required this.depositId,
      required this.title,
      required this.value,
      required this.metric,
      required this.displayValue});

  @override
  final String depositId;
  @override
  final String title;
  @override
  final double value;
  @override
  final String metric;
  @override
  final String displayValue;

  @override
  String toString() {
    return 'TopPerformer(depositId: $depositId, title: $title, value: $value, metric: $metric, displayValue: $displayValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopPerformerImpl &&
            (identical(other.depositId, depositId) ||
                other.depositId == depositId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.metric, metric) || other.metric == metric) &&
            (identical(other.displayValue, displayValue) ||
                other.displayValue == displayValue));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, depositId, title, value, metric, displayValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopPerformerImplCopyWith<_$TopPerformerImpl> get copyWith =>
      __$$TopPerformerImplCopyWithImpl<_$TopPerformerImpl>(this, _$identity);
}

abstract class _TopPerformer implements TopPerformer {
  const factory _TopPerformer(
      {required final String depositId,
      required final String title,
      required final double value,
      required final String metric,
      required final String displayValue}) = _$TopPerformerImpl;

  @override
  String get depositId;
  @override
  String get title;
  @override
  double get value;
  @override
  String get metric;
  @override
  String get displayValue;
  @override
  @JsonKey(ignore: true)
  _$$TopPerformerImplCopyWith<_$TopPerformerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChartDataPoint {
  String get label => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChartDataPointCopyWith<ChartDataPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartDataPointCopyWith<$Res> {
  factory $ChartDataPointCopyWith(
          ChartDataPoint value, $Res Function(ChartDataPoint) then) =
      _$ChartDataPointCopyWithImpl<$Res, ChartDataPoint>;
  @useResult
  $Res call({String label, double value, String color, String subtitle});
}

/// @nodoc
class _$ChartDataPointCopyWithImpl<$Res, $Val extends ChartDataPoint>
    implements $ChartDataPointCopyWith<$Res> {
  _$ChartDataPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? color = null,
    Object? subtitle = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChartDataPointImplCopyWith<$Res>
    implements $ChartDataPointCopyWith<$Res> {
  factory _$$ChartDataPointImplCopyWith(_$ChartDataPointImpl value,
          $Res Function(_$ChartDataPointImpl) then) =
      __$$ChartDataPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, double value, String color, String subtitle});
}

/// @nodoc
class __$$ChartDataPointImplCopyWithImpl<$Res>
    extends _$ChartDataPointCopyWithImpl<$Res, _$ChartDataPointImpl>
    implements _$$ChartDataPointImplCopyWith<$Res> {
  __$$ChartDataPointImplCopyWithImpl(
      _$ChartDataPointImpl _value, $Res Function(_$ChartDataPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? color = null,
    Object? subtitle = null,
  }) {
    return _then(_$ChartDataPointImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChartDataPointImpl implements _ChartDataPoint {
  const _$ChartDataPointImpl(
      {required this.label,
      required this.value,
      required this.color,
      this.subtitle = ''});

  @override
  final String label;
  @override
  final double value;
  @override
  final String color;
  @override
  @JsonKey()
  final String subtitle;

  @override
  String toString() {
    return 'ChartDataPoint(label: $label, value: $value, color: $color, subtitle: $subtitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartDataPointImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, value, color, subtitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartDataPointImplCopyWith<_$ChartDataPointImpl> get copyWith =>
      __$$ChartDataPointImplCopyWithImpl<_$ChartDataPointImpl>(
          this, _$identity);
}

abstract class _ChartDataPoint implements ChartDataPoint {
  const factory _ChartDataPoint(
      {required final String label,
      required final double value,
      required final String color,
      final String subtitle}) = _$ChartDataPointImpl;

  @override
  String get label;
  @override
  double get value;
  @override
  String get color;
  @override
  String get subtitle;
  @override
  @JsonKey(ignore: true)
  _$$ChartDataPointImplCopyWith<_$ChartDataPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TimeSeriesDataPoint {
  DateTime get date => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimeSeriesDataPointCopyWith<TimeSeriesDataPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSeriesDataPointCopyWith<$Res> {
  factory $TimeSeriesDataPointCopyWith(
          TimeSeriesDataPoint value, $Res Function(TimeSeriesDataPoint) then) =
      _$TimeSeriesDataPointCopyWithImpl<$Res, TimeSeriesDataPoint>;
  @useResult
  $Res call({DateTime date, double value, String label});
}

/// @nodoc
class _$TimeSeriesDataPointCopyWithImpl<$Res, $Val extends TimeSeriesDataPoint>
    implements $TimeSeriesDataPointCopyWith<$Res> {
  _$TimeSeriesDataPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? value = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeSeriesDataPointImplCopyWith<$Res>
    implements $TimeSeriesDataPointCopyWith<$Res> {
  factory _$$TimeSeriesDataPointImplCopyWith(_$TimeSeriesDataPointImpl value,
          $Res Function(_$TimeSeriesDataPointImpl) then) =
      __$$TimeSeriesDataPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double value, String label});
}

/// @nodoc
class __$$TimeSeriesDataPointImplCopyWithImpl<$Res>
    extends _$TimeSeriesDataPointCopyWithImpl<$Res, _$TimeSeriesDataPointImpl>
    implements _$$TimeSeriesDataPointImplCopyWith<$Res> {
  __$$TimeSeriesDataPointImplCopyWithImpl(_$TimeSeriesDataPointImpl _value,
      $Res Function(_$TimeSeriesDataPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? value = null,
    Object? label = null,
  }) {
    return _then(_$TimeSeriesDataPointImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TimeSeriesDataPointImpl implements _TimeSeriesDataPoint {
  const _$TimeSeriesDataPointImpl(
      {required this.date, required this.value, this.label = ''});

  @override
  final DateTime date;
  @override
  final double value;
  @override
  @JsonKey()
  final String label;

  @override
  String toString() {
    return 'TimeSeriesDataPoint(date: $date, value: $value, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeSeriesDataPointImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, value, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeSeriesDataPointImplCopyWith<_$TimeSeriesDataPointImpl> get copyWith =>
      __$$TimeSeriesDataPointImplCopyWithImpl<_$TimeSeriesDataPointImpl>(
          this, _$identity);
}

abstract class _TimeSeriesDataPoint implements TimeSeriesDataPoint {
  const factory _TimeSeriesDataPoint(
      {required final DateTime date,
      required final double value,
      final String label}) = _$TimeSeriesDataPointImpl;

  @override
  DateTime get date;
  @override
  double get value;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$TimeSeriesDataPointImplCopyWith<_$TimeSeriesDataPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
