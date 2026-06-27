import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// Configures the default screen dimensions for all widget tests to match a standard
/// tablet display viewport (800x1000) to ensure plenty of horizontal space for list items
/// and status badges.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  
  // Set default virtual screen size to 800x1000
  binding.platformDispatcher.views.first.physicalSize = const Size(800, 1000);
  binding.platformDispatcher.views.first.devicePixelRatio = 1.0;
  
  // ignore: deprecated_member_use
  binding.window.physicalSizeTestValue = const Size(800, 1000);
  // ignore: deprecated_member_use
  binding.window.devicePixelRatioTestValue = 1.0;

  await testMain();
}
