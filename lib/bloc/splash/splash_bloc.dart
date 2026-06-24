import 'package:flutter_bloc/flutter_bloc.dart';

export 'splash_event.dart';
export 'splash_state.dart';
import 'splash_event.dart';
import 'splash_state.dart';

/// BLoC that manages the state transitions of the Splash Screen.
///
/// It responds to [SplashEvent]s and emits corresponding [SplashState]s.
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  /// Initializes the BLoC with [SplashInitial] and registers the event handlers.
  SplashBloc() : super(const SplashInitial()) {
    on<StartSplash>(_onStartSplash);
  }

  /// Handles the [StartSplash] event to run the splash sequence.
  ///
  /// Emits [SplashLoading], waits 3 seconds, and then emits [SplashNavigateToLogin].
  Future<void> _onStartSplash(
    StartSplash event,
    Emitter<SplashState> emit,
  ) async {
    emit(const SplashLoading());
    // Simulate loading time (e.g. database setup, config loading, or branding showcase)
    await Future.delayed(const Duration(seconds: 3));
    emit(const SplashNavigateToLogin());
  }
}
