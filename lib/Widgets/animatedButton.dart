import 'package:flutter/material.dart';

class AnimatedScaleButton extends StatefulWidget {
  final Widget child;
  final Function onTap;
  final Duration duration;

  const AnimatedScaleButton({
    super.key,
    required this.child,
    required this.onTap,
    this.duration = const Duration(milliseconds: 50),
  });

  @override
  _AnimatedScaleButtonState createState() => _AnimatedScaleButtonState();
}

class _AnimatedScaleButtonState extends State<AnimatedScaleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _ignorePointer = false;

  void handleTap() async {
    setState(() => _ignorePointer = true);
    _controller.forward();
    await Future.delayed(const Duration(milliseconds: 180));
    _controller.reverse();
    await Future.delayed(const Duration(milliseconds: 180));
    widget.onTap();
    setState(() => _ignorePointer = false);
  }

  void handleLongPress() async {
    setState(() => _ignorePointer = true);
    _controller.forward();
    await Future.delayed(const Duration(milliseconds: 180));
    _controller.reverse();
    await Future.delayed(const Duration(milliseconds: 180));
    widget.onTap();
    setState(() => _ignorePointer = false);
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: _ignorePointer,
      child: InkWell(
        //onTapDown: (details) => _controller.forward(),

        onLongPress: handleLongPress, // Disable long-press
        //onLongPressCancel: () => _controller.forward(),
        onTap: handleTap,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: 1 - _controller.value,
              child: widget.child,
            );
          },
        ),
      ),
    );
  }
}
