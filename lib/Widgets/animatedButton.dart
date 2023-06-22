import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedScaleButton extends StatefulWidget {
  final Widget child;
  final Function onTap;
  final Duration duration;

  AnimatedScaleButton({
    required this.child,
    required this.onTap,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  _AnimatedScaleButtonState createState() => _AnimatedScaleButtonState();
}

class _AnimatedScaleButtonState extends State<AnimatedScaleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _controller.forward(),
      onTapUp: (details) async {
        // Delay for the forward animation to be visible
        await Future.delayed(widget.duration);

        // Press up effect
        _controller.reverse();

        // Delay the action for the reverse animation to be visible
        await Future.delayed(widget.duration);
        widget.onTap();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: 1 - _controller.value,
            child: widget.child,
          );
        },
      ),
    );
  }
}
