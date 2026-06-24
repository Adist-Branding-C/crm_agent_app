import 'package:equatable/equatable.dart';
import '../leads/leads_enums.dart';
import 'analytics_tab_data.dart';

/// The active tab on the Analytics screen.
enum AnalyticsTab { leads, deals }

/// Base class for all states emitted by the [AnalyticsBloc].
abstract class AnalyticsState extends Equatable {
  const AnalyticsState();

  @override
  List<Object?> get props => [];
}

/// Initial state of the Analytics view.
class AnalyticsInitial extends AnalyticsState {
  const AnalyticsInitial();
}

/// State emitted while loading analytics data.
class AnalyticsLoading extends AnalyticsState {
  const AnalyticsLoading();
}

/// State emitted when analytics data has been loaded successfully.
class AnalyticsLoaded extends AnalyticsState {
  final AnalyticsTab activeTab;
  final String selectedPeriod;
  final DateTime? customStartDate;
  final DateTime? customEndDate;
  final Set<LeadStatus> selectedStatuses;
  final Set<LeadSource> selectedSources;
  final LeadsTabData? leadsData;
  final DealsTabData? dealsData;

  const AnalyticsLoaded({
    required this.activeTab,
    required this.selectedPeriod,
    this.customStartDate,
    this.customEndDate,
    required this.selectedStatuses,
    required this.selectedSources,
    this.leadsData,
    this.dealsData,
  });

  @override
  List<Object?> get props => [
        activeTab, selectedPeriod, customStartDate, customEndDate,
        selectedStatuses, selectedSources, leadsData, dealsData,
      ];
}

enum AnalyticsFailure { load, unknown }

/// State emitted when loading analytics data fails.
class AnalyticsError extends AnalyticsState {
  final AnalyticsFailure failure;
  const AnalyticsError({required this.failure});

  @override
  List<Object?> get props => [failure];
}
