part of 'my_activity_bloc.dart';

/// Base class for all My Activity states.
abstract class MyActivityState extends Equatable {
  const MyActivityState();

  @override
  List<Object?> get props => [];
}

/// Initial state before data loads.
class MyActivityInitial extends MyActivityState {
  const MyActivityInitial();
}

/// State while activities are loading.
class MyActivityLoading extends MyActivityState {
  const MyActivityLoading();
}

/// State when activities are loaded and filters are active.
class MyActivityLoaded extends MyActivityState {
  final List<ActivityDateGroup> groupedActivities;
  final int totalCount;
  final ActivityTimeFilter selectedTimeFilter;
  final ActivityTypeFilter selectedTypeFilter;
  final String selectedLead;
  final List<String> availableLeads;

  const MyActivityLoaded({
    required this.groupedActivities,
    required this.totalCount,
    required this.selectedTimeFilter,
    required this.selectedTypeFilter,
    required this.selectedLead,
    required this.availableLeads,
  });

  MyActivityLoaded copyWith({
    List<ActivityDateGroup>? groupedActivities,
    int? totalCount,
    ActivityTimeFilter? selectedTimeFilter,
    ActivityTypeFilter? selectedTypeFilter,
    String? selectedLead,
    List<String>? availableLeads,
  }) {
    return MyActivityLoaded(
      groupedActivities: groupedActivities ?? this.groupedActivities,
      totalCount: totalCount ?? this.totalCount,
      selectedTimeFilter: selectedTimeFilter ?? this.selectedTimeFilter,
      selectedTypeFilter: selectedTypeFilter ?? this.selectedTypeFilter,
      selectedLead: selectedLead ?? this.selectedLead,
      availableLeads: availableLeads ?? this.availableLeads,
    );
  }

  @override
  List<Object?> get props => [
        groupedActivities,
        totalCount,
        selectedTimeFilter,
        selectedTypeFilter,
        selectedLead,
        availableLeads,
      ];
}

/// State emitted on error.
class MyActivityError extends MyActivityState {
  final String message;

  const MyActivityError(this.message);

  @override
  List<Object?> get props => [message];
}
