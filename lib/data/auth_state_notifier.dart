import 'package:flutter/foundation.dart';

/// Notifies the router when authentication state changes.
///
/// This is used by [GoRouter.refreshListenable] to trigger a redirect
/// re-evaluation after login or logout events.
class AuthStateNotifier extends ChangeNotifier {
  /// Requests the router to refresh its redirect logic.
  void refresh() => notifyListeners();
}
