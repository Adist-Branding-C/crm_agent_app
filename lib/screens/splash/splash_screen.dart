import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/splash/splash_bloc.dart';
import '../../theme.dart';
import '../login/login_screen.dart';
import 'widgets/splash_animator.dart';
import 'widgets/splash_loader.dart';

/// The startup landing page showing CRM Agent branding.
class SplashScreen extends StatelessWidget {
  /// Creates a constant [SplashScreen] widget.
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(const StartSplash()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateToLogin) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: Container(color: AppTheme.backgroundColor),
              ),
              const Center(child: SplashAnimator()),
              const Positioned(
                bottom: 64,
                left: 0,
                right: 0,
                child: Center(child: SplashLoader()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
