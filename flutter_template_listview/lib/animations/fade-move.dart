import 'package:flutter/material.dart';

class FadeMoveAnimation extends StatefulWidget {
  final double opacity;
  final double right;
  final double left;
  final double top;
  final double bottom;
  final Widget child;

  FadeMoveAnimation({
    @required this.child,
    this.left,
    this.bottom,
    this.top,
    this.right,
    this.opacity
  });

  @override
  _FadeMoveAnimationState createState() => _FadeMoveAnimationState();
}

class _FadeMoveAnimationState extends State<FadeMoveAnimation> {

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top,
      left: widget.left,
      bottom: widget.bottom,
      right: widget.right,
      child: Opacity(
        child: widget.child,
        opacity: widget.opacity,
      ),
    );
  }
}