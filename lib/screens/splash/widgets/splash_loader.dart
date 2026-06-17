import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/splash/splash_bloc.dart';
import '../../../widgets/app_loading_widget.dart';

/// Loading indicator element displayed at the bottom of the splash screen.
class SplashLoader extends StatelessWidget {
  /// Creates a constant [SplashLoader] widget.
  const SplashLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      buildWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
      builder: (context, state) {
        if (state is SplashLoading) {
          return const SizedBox(
            width: 24,
            height: 24,
            child: AppLoadingWidget(size: 24),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
