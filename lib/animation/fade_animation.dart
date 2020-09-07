import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track<dynamic>('opacity').add(Duration(milliseconds: 500), Tween<dynamic>(begin: 0.0, end: 1.0)),
      Track<dynamic>('translateY').add(
        Duration(milliseconds: 500), Tween<dynamic>(begin: -30.0, end: 0.0),
        curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (BuildContext context, Widget child, Map<String, dynamic> animation) => Opacity(
        opacity: animation['opacity'],
        child: Transform.translate(
          offset: Offset(0, animation['translateY']), 
          child: child
        ),
      ),
    );
  }
}