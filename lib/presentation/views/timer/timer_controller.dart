part of 'timer_widget.dart';


class _TimerController {
  AnimationController? _animationController;
  final Function()? onTimerEnd;
  ValueNotifier<bool> isPlaying = ValueNotifier(false);
  ValueNotifier<bool> isStart = ValueNotifier(true);
  ValueNotifier<bool> isComplete = ValueNotifier(false);

  AnimationController? get animationController => _animationController;

  set animationController(AnimationController? animationController) {
    if (_animationController != null) {
      throw StateError(
          'An animation controller is already assigned to this object.');
    }
    _animationController = animationController;
    _animationController?.addListener(_onAnimationChange);
  }

  _TimerController({this.onTimerEnd});

  void _onAnimationChange() {
    if (_animationController?.isCompleted ?? false) {
      onTimerEnd?.call();
      isPlaying.value = false;
      isComplete.value = true;
    }
  }

  void play() {
    if (!(_animationController?.isCompleted ?? true)) {
      _animationController?.forward();
      isPlaying.value = true;
      isStart.value = false;
    }
  }

  void pause() {
    _animationController?.stop();
    isPlaying.value = false;
  }

  void reset() {
    _animationController?.reset();
    isPlaying.value = false;
    isStart.value = true;
    isComplete.value = false;
  }

  void dispose() {
    _animationController?.removeListener(_onAnimationChange);
    _animationController = null;
  }
}