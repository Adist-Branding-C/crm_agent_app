import 'dart:ui';

import 'package:flutter/material.dart';
import 'app.dart';
import 'data/datasources/auth_datasource.dart';
import 'data/repositories/auth_repository_impl.dart';

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

  final authRepo = AuthRepositoryImpl(authDataSource: AuthDataSourceImpl());
  await authRepo.init();
  runApp(MyApp(authRepository: authRepo));
}
