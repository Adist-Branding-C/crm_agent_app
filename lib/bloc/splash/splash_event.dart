import 'package:equatable/equatable.dart';

/// Base class for all events related to the Splash Screen.
///
/// Subclasses should define specific actions that occur on the splash screen.
abstract class SplashEvent extends Equatable {
  /// Creates a constant [SplashEvent].
  const SplashEvent();

  @override
  List<Object?> get props => [];
}

/// Event that signals the splash screen sequence has started.
///
/// This event triggers the loading timer and branding display.
class StartSplash extends SplashEvent {
  /// Creates a constant [StartSplash] event.
  const StartSplash();
}
