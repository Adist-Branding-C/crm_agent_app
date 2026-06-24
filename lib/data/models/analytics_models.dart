import 'package:equatable/equatable.dart';
import 'lead_enums.dart';

class LeadsSummary extends Equatable {
  final int totalLeads;
  final double conversionRate;
  final int interestedCount;
  final int lostCount;

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

class StatusMetric extends Equatable {
  final LeadStatus status;
  final int count;

  const StatusMetric({required this.status, required this.count});

  @override
  List<Object?> get props => [status, count];
}

class SourceMetric extends Equatable {
  final LeadSource source;
  final int count;

  const SourceMetric({required this.source, required this.count});

  @override
  List<Object?> get props => [source, count];
}
