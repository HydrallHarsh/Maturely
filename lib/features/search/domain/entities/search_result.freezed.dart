// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchResult {
  List<Deposit> get deposits => throw _privateConstructorUsedError;
  SearchFilters get filters => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  Duration get searchDuration => throw _privateConstructorUsedError;
  List<String> get suggestions => throw _privateConstructorUsedError;
  Map<String, int> get aggregations => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchResultCopyWith<SearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultCopyWith<$Res> {
  factory $SearchResultCopyWith(
          SearchResult value, $Res Function(SearchResult) then) =
      _$SearchResultCopyWithImpl<$Res, SearchResult>;
  @useResult
  $Res call(
      {List<Deposit> deposits,
      SearchFilters filters,
      int totalCount,
      Duration searchDuration,
      List<String> suggestions,
      Map<String, int> aggregations});

  $SearchFiltersCopyWith<$Res> get filters;
}

/// @nodoc
class _$SearchResultCopyWithImpl<$Res, $Val extends SearchResult>
    implements $SearchResultCopyWith<$Res> {
  _$SearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deposits = null,
    Object? filters = null,
    Object? totalCount = null,
    Object? searchDuration = null,
    Object? suggestions = null,
    Object? aggregations = null,
  }) {
    return _then(_value.copyWith(
      deposits: null == deposits
          ? _value.deposits
          : deposits // ignore: cast_nullable_to_non_nullable
              as List<Deposit>,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as SearchFilters,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      searchDuration: null == searchDuration
          ? _value.searchDuration
          : searchDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      aggregations: null == aggregations
          ? _value.aggregations
          : aggregations // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SearchFiltersCopyWith<$Res> get filters {
    return $SearchFiltersCopyWith<$Res>(_value.filters, (value) {
      return _then(_value.copyWith(filters: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchResultImplCopyWith<$Res>
    implements $SearchResultCopyWith<$Res> {
  factory _$$SearchResultImplCopyWith(
          _$SearchResultImpl value, $Res Function(_$SearchResultImpl) then) =
      __$$SearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Deposit> deposits,
      SearchFilters filters,
      int totalCount,
      Duration searchDuration,
      List<String> suggestions,
      Map<String, int> aggregations});

  @override
  $SearchFiltersCopyWith<$Res> get filters;
}

/// @nodoc
class __$$SearchResultImplCopyWithImpl<$Res>
    extends _$SearchResultCopyWithImpl<$Res, _$SearchResultImpl>
    implements _$$SearchResultImplCopyWith<$Res> {
  __$$SearchResultImplCopyWithImpl(
      _$SearchResultImpl _value, $Res Function(_$SearchResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deposits = null,
    Object? filters = null,
    Object? totalCount = null,
    Object? searchDuration = null,
    Object? suggestions = null,
    Object? aggregations = null,
  }) {
    return _then(_$SearchResultImpl(
      deposits: null == deposits
          ? _value._deposits
          : deposits // ignore: cast_nullable_to_non_nullable
              as List<Deposit>,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as SearchFilters,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      searchDuration: null == searchDuration
          ? _value.searchDuration
          : searchDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      suggestions: null == suggestions
          ? _value._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      aggregations: null == aggregations
          ? _value._aggregations
          : aggregations // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc

class _$SearchResultImpl extends _SearchResult {
  const _$SearchResultImpl(
      {required final List<Deposit> deposits,
      required this.filters,
      required this.totalCount,
      required this.searchDuration,
      final List<String> suggestions = const [],
      final Map<String, int> aggregations = const {}})
      : _deposits = deposits,
        _suggestions = suggestions,
        _aggregations = aggregations,
        super._();

  final List<Deposit> _deposits;
  @override
  List<Deposit> get deposits {
    if (_deposits is EqualUnmodifiableListView) return _deposits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deposits);
  }

  @override
  final SearchFilters filters;
  @override
  final int totalCount;
  @override
  final Duration searchDuration;
  final List<String> _suggestions;
  @override
  @JsonKey()
  List<String> get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  final Map<String, int> _aggregations;
  @override
  @JsonKey()
  Map<String, int> get aggregations {
    if (_aggregations is EqualUnmodifiableMapView) return _aggregations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_aggregations);
  }

  @override
  String toString() {
    return 'SearchResult(deposits: $deposits, filters: $filters, totalCount: $totalCount, searchDuration: $searchDuration, suggestions: $suggestions, aggregations: $aggregations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultImpl &&
            const DeepCollectionEquality().equals(other._deposits, _deposits) &&
            (identical(other.filters, filters) || other.filters == filters) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.searchDuration, searchDuration) ||
                other.searchDuration == searchDuration) &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions) &&
            const DeepCollectionEquality()
                .equals(other._aggregations, _aggregations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_deposits),
      filters,
      totalCount,
      searchDuration,
      const DeepCollectionEquality().hash(_suggestions),
      const DeepCollectionEquality().hash(_aggregations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      __$$SearchResultImplCopyWithImpl<_$SearchResultImpl>(this, _$identity);
}

abstract class _SearchResult extends SearchResult {
  const factory _SearchResult(
      {required final List<Deposit> deposits,
      required final SearchFilters filters,
      required final int totalCount,
      required final Duration searchDuration,
      final List<String> suggestions,
      final Map<String, int> aggregations}) = _$SearchResultImpl;
  const _SearchResult._() : super._();

  @override
  List<Deposit> get deposits;
  @override
  SearchFilters get filters;
  @override
  int get totalCount;
  @override
  Duration get searchDuration;
  @override
  List<String> get suggestions;
  @override
  Map<String, int> get aggregations;
  @override
  @JsonKey(ignore: true)
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
