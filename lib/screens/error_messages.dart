import '../bloc/analytics/analytics_bloc.dart' show AnalyticsFailure;
import '../bloc/dashboard/dashboard_bloc.dart' show DashboardFailure;
import '../bloc/enquiry_details/enquiry_details_state.dart' show EnquiryDetailsFailure;
import '../bloc/tasks/tasks_state.dart' show TasksFailure;

extension AnalyticsFailureMessage on AnalyticsFailure {
  String get message => switch (this) {
    AnalyticsFailure.load => 'Failed to load analytics',
    AnalyticsFailure.unknown => 'An error occurred',
  };
}

extension DashboardFailureMessage on DashboardFailure {
  String get message => switch (this) {
    DashboardFailure.load => 'Failed to fetch dashboard data',
    DashboardFailure.unknown => 'An error occurred',
  };
}

extension EnquiryDetailsFailureMessage on EnquiryDetailsFailure {
  String get message => switch (this) {
    EnquiryDetailsFailure.leadNotFound => 'Lead not found',
    EnquiryDetailsFailure.load => 'Failed to load enquiry details',
    EnquiryDetailsFailure.unknown => 'An error occurred',
  };
}

extension TasksFailureMessage on TasksFailure {
  String get message => switch (this) {
    TasksFailure.load => 'Failed to load tasks',
    TasksFailure.unknown => 'An error occurred',
  };
}
