import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Fallback widget when invalid lead or call log activity is provided.
class InvalidCallLogFallback extends StatelessWidget {
  const InvalidCallLogFallback({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(child: Center(child: Text('Invalid call log or lead.'))),
    );
  }
}
