import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'data/datasources/auth_datasource.dart';
import 'data/repositories/session_repository_impl.dart';

export 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint('Unhandled error: $error\n$stack');
    return true;
  };

  await SharedPreferences.getInstance();
  final authDataSource = AuthDataSourceImpl();
  final sessionRepo = SessionRepositoryImpl(authDataSource: authDataSource);
  await sessionRepo.init();
  runApp(MyApp(
    sessionRepository: sessionRepo,
    authDataSource: authDataSource,
  ));
}
