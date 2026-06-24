import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/splash/splash_bloc.dart';
import '../../data/auth_state_notifier.dart';
import '../../data/repositories/session_repository.dart';
import '../../router/app_routes.dart';
import '../../theme.dart';
import 'widgets/splash_animator.dart';
import 'widgets/splash_loader.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(const StartSplash()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateToLogin) {
            _navigateWhenReady(context);
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

void _navigateWhenReady(BuildContext context) {
  final authRepo = context.read<SessionRepository>();
  if (authRepo.isInitialized) {
    context.goNamed(AppRoutes.login);
    return;
  }
  final notifier = context.read<AuthStateNotifier>();
  void listener() {
    if (!authRepo.isInitialized || !context.mounted) return;
    notifier.removeListener(listener);
    context.goNamed(AppRoutes.login);
  }

  notifier.addListener(listener);
}
