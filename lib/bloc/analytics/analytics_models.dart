import 'package:equatable/equatable.dart';

/// Summarized top-level metrics for the analytics.
class AnalyticsSummary extends Equatable {
  /// Total number of leads.
  final int totalLeads;

  /// Conversion rate percentage (e.g. 64.0 for 64%).
  final double conversionRate;

  /// Number of won deals.
  final int wonDeals;

  /// Pipeline value display string (e.g. "₹18.40L").
  final String pipelineValue;

  /// Creates a constant [AnalyticsSummary].
  const AnalyticsSummary({
    required this.totalLeads,
    required this.conversionRate,
    required this.wonDeals,
    required this.pipelineValue,
  });

  @override
  List<Object?> get props => [
    totalLeads,
    conversionRate,
    wonDeals,
    pipelineValue,
  ];
}

/// Represents a single lead status metric.
class StatusMetric extends Equatable {
  /// The status name (e.g., "New", "Interested").
  final String status;

  /// Count of leads with this status.
  final int count;

  /// Creates a constant [StatusMetric].
  const StatusMetric({required this.status, required this.count});

  @override
  List<Object?> get props => [status, count];
}

/// Represents a single lead source metric.
class SourceMetric extends Equatable {
  /// The source name (e.g., "Facebook", "Website").
  final String source;

  /// Count of leads from this source.
  final int count;

  /// Creates a constant [SourceMetric].
  const SourceMetric({required this.source, required this.count});

  @override
  List<Object?> get props => [source, count];
}
