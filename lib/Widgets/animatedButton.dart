import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedScaleButton extends StatefulWidget {
  final Widget child;
  final Function onTap;
  final Duration duration;

  AnimatedScaleButton({
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
    return GestureDetector(
      onTapDown: (details) => _controller.forward(),
      onLongPress: () async {
        _controller.forward();
        // Delay for the forward animation to be visible
        await Future.delayed(const Duration(milliseconds: 200));

        // Press up effect
        _controller.reverse();

        // Delay the action for the reverse animation to be visible
        await Future.delayed(const Duration(milliseconds: 200));
        widget.onTap();
      }, // Disable long-press
      onLongPressCancel: () => _controller.forward(),
      onTap: () async {
        _controller.forward();
        // Delay for the forward animation to be visible
        await Future.delayed(const Duration(milliseconds: 200));

        // Press up effect
        _controller.reverse();

        // Delay the action for the reverse animation to be visible
        await Future.delayed(const Duration(milliseconds: 200));
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
