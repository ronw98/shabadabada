part of 'timer_widget.dart';

class _TimerDisplay extends StatefulWidget {
  const _TimerDisplay({
    Key? key,
    required this.initialValue,
    required this.controller,
    this.timerTextStyle,
  }) : super(key: key);
  final int initialValue;
  final _TimerController controller;
  final TextStyle? timerTextStyle;

  @override
  State<_TimerDisplay> createState() => _TimerDisplayState();
}

class _TimerDisplayState extends State<_TimerDisplay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: widget.initialValue,
      ),
    );
    _animation = Tween<double>(begin: widget.initialValue.toDouble(), end: 0)
        .animate(_animationController);
    _animation.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    widget.controller.animationController = _animationController;
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _animation.value.toStringAsFixed(1),
      style: widget.timerTextStyle,
    );
  }
}