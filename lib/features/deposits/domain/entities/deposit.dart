import 'package:freezed_annotation/freezed_annotation.dart';

part 'deposit.freezed.dart';
part 'deposit.g.dart';

enum DepositStatus {
  @JsonValue('active')
  active,
  @JsonValue('matured')
  matured,
  @JsonValue('closed')
  closed,
  @JsonValue('inProcess')
  inProcess,
}

enum ClosureType {
  @JsonValue('reinvested')
  reinvested,
  @JsonValue('withdrawn')
  withdrawn,
  @JsonValue('unknown')
  unknown,
}

enum AttachmentKind {
  @JsonValue('receipt')
  receipt,
  @JsonValue('diary_page')
  diaryPage,
  @JsonValue('other')
  other,
}

@freezed
class Attachment with _$Attachment {
  const factory Attachment({
    required String id,
    required String storagePath,
    required AttachmentKind kind,
    String? ocrVersion,
    Map<String, dynamic>? fieldsExtracted,
  }) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);
}

@freezed
class Deposit with _$Deposit {
  const factory Deposit({
    required String id,
    required String srNo,
    required List<String> holders,
    required String bankName,
    required String accountNumber,
    required String fdrNo,
    required double amountDeposited,
    required double dueAmount,
    required DateTime dateDeposited,
    required DateTime dueDate,
    @Default(DepositStatus.active) DepositStatus status,
    ClosureType? closureType,
    String? previousDepositId,
    String? nextDepositId,
    String? chainId,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? notes,
    @Default([]) List<Attachment> attachments,
  }) = _Deposit;

  factory Deposit.fromJson(Map<String, dynamic> json) =>
      _$DepositFromJson(json);

  const Deposit._();

  /// Validation for holders list
  static String? validateHolders(List<String> holders) {
    if (holders.isEmpty) {
      return 'At least one holder is required';
    }
    if (holders.length > 2) {
      return 'Maximum 2 holders allowed';
    }
    for (String holder in holders) {
      if (holder.trim().isEmpty) {
        return 'Holder name cannot be empty';
      }
    }
    return null;
  }

  /// Get primary holder (first in list)
  String get primaryHolder => holders.isNotEmpty ? holders.first : '';

  /// Get secondary holder if exists
  String? get secondaryHolder => holders.length > 1 ? holders[1] : null;

  /// Get formatted holders string for display
  String get holdersDisplay => holders.join(' & ');

  /// Check if this deposit is part of a chain
  bool get isPartOfChain => previousDepositId != null || nextDepositId != null;

  /// Check if this deposit is the first in a chain
  bool get isFirstInChain => previousDepositId == null && nextDepositId != null;

  /// Check if this deposit is the last in a chain
  bool get isLastInChain => previousDepositId != null && nextDepositId == null;

  /// Check if this deposit is a single deposit (not part of any chain)
  bool get isSingleDeposit =>
      previousDepositId == null && nextDepositId == null;

  /// Check if this deposit is matured
  bool get isMatured => DateTime.now().isAfter(dueDate);

  /// Check if this deposit is due soon (within specified days)
  bool isDueSoon(int days) {
    final now = DateTime.now();
    final dueSoon = dueDate.subtract(Duration(days: days));
    return now.isAfter(dueSoon) && !isMatured;
  }

  /// Check if this matured deposit requires action (not yet processed)
  bool get requiresAction => isMatured && status == DepositStatus.active;

  /// Check if this matured deposit has been processed
  bool get isProcessed => isMatured && status == DepositStatus.closed;

  /// Check if this deposit is part of lineage (has been processed from matured page)
  bool get isPartOfLineage => isMatured && closureType != null;

  /// Check if this is a reinvested deposit
  bool get isReinvested => closureType == ClosureType.reinvested;

  /// Check if this is a withdrawn deposit
  bool get isWithdrawn => closureType == ClosureType.withdrawn;

  /// Check if this is a closed deposit (other reasons)
  bool get isClosed => closureType == ClosureType.unknown;

  /// Get the maturity period in days
  int get maturityPeriodDays => dueDate.difference(dateDeposited).inDays;

  /// Get the interest amount
  double get interestAmount => dueAmount - amountDeposited;

  /// Get the interest rate (approximate)
  double get interestRate {
    if (amountDeposited == 0) return 0;
    final years = maturityPeriodDays / 365;
    if (years == 0) return 0;
    return (interestAmount / amountDeposited) / years * 100;
  }

  /// Basic validation: returns a list of human-readable issues
  List<String> validate() {
    final issues = <String>[];
    if (srNo.trim().isEmpty) issues.add('Serial number is required');

    // Validate holders using the static method
    final holdersError = validateHolders(holders);
    if (holdersError != null) issues.add(holdersError);

    if (bankName.trim().isEmpty) issues.add('Bank name is required');
    if (amountDeposited <= 0) issues.add('Amount deposited must be > 0');
    if (dueAmount < amountDeposited) {
      issues.add('Due amount should be >= amount deposited');
    }
    if (!dueDate.isAfter(dateDeposited)) {
      issues.add('Due date must be after date deposited');
    }
    return issues;
  }

  /// Create a copy with updated status
  Deposit markAsMatured() {
    return copyWith(
      status: DepositStatus.matured,
      updatedAt: DateTime.now(),
    );
  }

  /// Create a copy with closure information
  Deposit close(ClosureType closureType, {String? notes}) {
    return copyWith(
      status: DepositStatus.closed,
      closureType: closureType,
      notes: notes,
      updatedAt: DateTime.now(),
    );
  }

  /// Create a copy linked to a new deposit
  Deposit linkToNext(String nextDepositId) {
    return copyWith(
      nextDepositId: nextDepositId,
      updatedAt: DateTime.now(),
    );
  }

  /// Create a copy linked from a previous deposit
  Deposit linkFromPrevious(String previousDepositId, String chainId) {
    return copyWith(
      previousDepositId: previousDepositId,
      chainId: chainId,
      updatedAt: DateTime.now(),
    );
  }
}
