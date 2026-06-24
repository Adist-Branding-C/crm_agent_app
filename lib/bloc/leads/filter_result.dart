import 'package:equatable/equatable.dart';
import 'leads_enums.dart';

/// Carries the values chosen in the filter bottom sheet.
class FilterResult extends Equatable {
  /// Selected sorting criterion.
  final SortLeadsBy sortBy;

  /// Selected status criteria.
  final LeadStatus? status;

  /// Selected source channel.
  final LeadSource? source;

  /// Creates a constant [FilterResult].
  const FilterResult({required this.sortBy, this.status, this.source});

  @override
  List<Object?> get props => [sortBy, status, source];
}
