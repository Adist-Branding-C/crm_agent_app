import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/splash/splash_bloc.dart';
import '../../../theme.dart';

/// Loading indicator element displayed at the bottom of the splash screen.
class SplashLoader extends StatelessWidget {
  /// Creates a constant [SplashLoader] widget.
  const SplashLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        if (state is SplashLoading) {
          return const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
