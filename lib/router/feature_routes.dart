import 'package:go_router/go_router.dart';
import '../screens/leads/add_lead_screen.dart';
import '../screens/deals/deals_screen.dart';
import '../screens/analytics/analytics_screen.dart';
import '../screens/campaigns/campaigns_screen.dart';
import '../screens/notifications/notifications_screen.dart';
import 'app_routes.dart';

/// Builds the feature and marketing related routes.
List<RouteBase> buildFeatureRoutes() {
  return [
    GoRoute(
      name: AppRoutes.addLead,
      path: AppRoutes.addLeadPath,
      builder: (c, s) => const AddLeadScreen(),
    ),
    GoRoute(
      name: AppRoutes.deals,
      path: AppRoutes.dealsPath,
      builder: (c, s) => const DealsScreen(),
    ),
    GoRoute(
      name: AppRoutes.analytics,
      path: AppRoutes.analyticsPath,
      builder: (c, s) => const AnalyticsScreen(),
    ),
    GoRoute(
      name: AppRoutes.campaigns,
      path: AppRoutes.campaignsPath,
      builder: (c, s) => const CampaignsScreen(),
    ),
    GoRoute(
      name: AppRoutes.notifications,
      path: AppRoutes.notificationsPath,
      builder: (c, s) => const NotificationsScreen(),
    ),
  ];
}
