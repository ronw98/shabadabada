import 'package:flutter/material.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';
import 'package:shabadapp/presentation/widgets/none_widget.dart';

part 'timer_text.dart';

part 'timer_controller.dart';

/// A timer with control buttons and animations to play, pause and reset
class TimerWidget extends StatefulWidget {
  const TimerWidget({
    Key? key,
    required this.duration,
    this.onTimerEnd,
    this.playFilLColor = Colors.green,
    this.pauseFillColor = Colors.red,
    this.resetFillColor = Colors.blue,
    this.playPauseColor = Colors.white,
    this.resetColor = Colors.white,
    this.switchFillColor = Colors.blue,
    this.switchTextStyle,
    this.timerTextStyle,
  }) : super(key: key);
  final int duration;
  final Function()? onTimerEnd;
  final Color playFilLColor;
  final Color pauseFillColor;
  final Color resetFillColor;
  final Color playPauseColor;
  final Color resetColor;
  final Color switchFillColor;
  final TextStyle? timerTextStyle;
  final TextStyle? switchTextStyle;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget>
    with SingleTickerProviderStateMixin {
  late final _TimerController _controller;
  late final AnimationController _playPauseController;
  late final Animation<Color?> _playPauseColorAnimation;
  late final ValueNotifier<Color?> _playPauseColor;

  @override
  void initState() {
    // Initialize the timer controller
    _controller = _TimerController(onTimerEnd: widget.onTimerEnd);

    // Controller for the animated play/pause icon
    _playPauseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    // Animation for the play pause color
    _playPauseColorAnimation = ColorTween(
      begin: widget.playFilLColor,
      end: widget.pauseFillColor,
    ).animate(_playPauseController);
    _playPauseColorAnimation.addListener(() {
      _playPauseColor.value = _playPauseColorAnimation.value;
    });

    // Use a value notifier to avoid calling set state too often
    _playPauseColor = ValueNotifier(widget.playFilLColor);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _playPauseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _TimerDisplay(
          initialValue: widget.duration,
          controller: _controller,
          timerTextStyle: widget.timerTextStyle,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MultiValueListenableBuilder(
              valueListenables: [_controller.isComplete, _playPauseColor],
              builder: (context, values, child) {
                final bool isComplete = values[0];
                final Color? color = values[1];
                if (isComplete) {
                  return const NoneWidget();
                }
                return RawMaterialButton(
                  onPressed: _onPlayPauseTap,
                  padding: const EdgeInsets.all(4),
                  shape: const CircleBorder(),
                  fillColor: color,
                  child: child!,
                );
              },
              child: AnimatedIcon(
                size: 35,
                icon: AnimatedIcons.play_pause,
                progress: _playPauseController,
                color: widget.playPauseColor,
              ),
            ),
            MultiValueListenableBuilder(
              valueListenables: [_controller.isPlaying, _controller.isStart],
              builder: (context, values, child) {
                final isPlaying = values[0];
                final isStart = values[1];

                if (!isPlaying && !isStart) {
                  return child!;
                }
                return const NoneWidget();
              },
              child: RawMaterialButton(
                onPressed: _onResetTap,
                padding: const EdgeInsets.all(4),
                shape: const CircleBorder(),
                fillColor: widget.resetFillColor,
                child: Icon(
                  Icons.replay,
                  size: 35,
                  color: widget.resetColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        ValueListenableBuilder<bool>(
          valueListenable: _controller.isStart,
          builder: (context, isPlaying, child) {
            if (!isPlaying) {
              return child!;
            }
            return const NoneWidget();
          },
          child: RawMaterialButton(
            padding: const EdgeInsets.all(4),
            onPressed: _onSwitchPressed,
            fillColor: widget.switchFillColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(
              height: 35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Switch',
                    style: widget.switchTextStyle ??
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onResetTap() {
    _controller.reset();
    _playPauseController.reverse();
  }

  void _onPlayPauseTap() {
    if (_controller.isPlaying.value) {
      _controller.pause();
      _playPauseController.reverse();
    } else {
      _controller.play();
      _playPauseController.forward();
    }
  }

  void _onSwitchPressed() {
    _controller.reset();
    _controller.play();
    _playPauseController.forward();
  }
}
