import 'dart:async';

class OtpTimerService {
  StreamSubscription<int>? _subscription;

  void start(void Function(int secondsLeft) onTick) {
    _subscription?.cancel();
    _subscription = Stream.periodic(
      const Duration(seconds: 1),
      (x) => 29 - x,
    ).take(30).listen((s) => onTick(s));
  }

  void cancel() {
    _subscription?.cancel();
    _subscription = null;
  }
}
