import 'package:equatable/equatable.dart';
import '../leads/leads_enums.dart';

/// Summarized top-level metrics for leads.
class LeadsSummary extends Equatable {
  /// Total number of leads.
  final int totalLeads;

  /// Conversion rate percentage (e.g. 64.0 for 64%).
  final double conversionRate;

  /// Number of interested leads.
  final int interestedCount;

  /// Number of lost leads.
  final int lostCount;

  /// Creates a constant [LeadsSummary].
  const LeadsSummary({
    required this.totalLeads,
    required this.conversionRate,
    required this.interestedCount,
    required this.lostCount,
  });

  @override
  List<Object?> get props => [
        totalLeads,
        conversionRate,
        interestedCount,
        lostCount,
      ];
}

/// Represents a single lead status metric.
class StatusMetric extends Equatable {
  /// The status enum.
  final LeadStatus status;

  /// Count of leads with this status.
  final int count;

  /// Creates a constant [StatusMetric].
  const StatusMetric({required this.status, required this.count});

  @override
  List<Object?> get props => [status, count];
}

/// Represents a single lead source metric.
class SourceMetric extends Equatable {
  /// The source enum.
  final LeadSource source;

  /// Count of leads from this source.
  final int count;

  /// Creates a constant [SourceMetric].
  const SourceMetric({required this.source, required this.count});

  @override
  List<Object?> get props => [source, count];
}
