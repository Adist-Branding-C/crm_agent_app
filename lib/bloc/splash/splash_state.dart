part of 'splash_bloc.dart';

/// Base class for all states of the Splash Screen.
///
/// Subclasses represent distinct states of the splash screen workflow.
abstract class SplashState extends Equatable {
  /// Creates a constant [SplashState].
  const SplashState();

  @override
  List<Object?> get props => [];
}

/// The initial state of the splash screen prior to initialization.
class SplashInitial extends SplashState {
  /// Creates a constant [SplashInitial] state.
  const SplashInitial();
}

/// State emitted while the splash screen is loading branding or assets.
class SplashLoading extends SplashState {
  /// Creates a constant [SplashLoading] state.
  const SplashLoading();
}

/// State indicating that the splash duration has completed.
///
/// This state instructs the UI listener to route the user to the login page.
class SplashNavigateToLogin extends SplashState {
  /// Creates a constant [SplashNavigateToLogin] state.
  const SplashNavigateToLogin();
}
