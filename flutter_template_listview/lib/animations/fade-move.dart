import 'package:flutter/material.dart';

class FadeMoveAnimation extends StatefulWidget {
  double opacity;
  double left;
  double top;
  double bottom;
  Widget child;

  FadeMoveAnimation({
    @required this.child,
    this.left,
    this.bottom,
    this.top,
    this.opacity
  });

  @override
  _FadeMoveAnimationState createState() => _FadeMoveAnimationState(
    child: this.child,
    left: this.left,
    top: this.top,
    bottom: this.bottom,
    opacity: this.opacity
  );
}

class _FadeMoveAnimationState extends State<FadeMoveAnimation> {

  double opacity;
  double left;
  double top;
  double bottom;
  Widget child;

  _FadeMoveAnimationState({
    @required this.child,
    this.left,
    this.bottom,
    this.top,
    this.opacity
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: this.top,
      left: this.left,
      bottom: this.bottom,
      child: Opacity(
        child: this.child,
        opacity: this.opacity,
      ),
    );
  }
}