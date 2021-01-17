import 'package:flutter/material.dart';
import 'package:e_learning_onboarding_app/src/widgets/painters/buttom_painter.dart';
import 'dart:math' as math;

class BottomCustomPainter extends StatefulWidget {
  const BottomCustomPainter({
    Key key,
    @required this.width,
    @required this.child,
    @required this.index,
  }) : super(key: key);

  final double width;
  final Widget child;
  final double index;

  @override
  _BottomCustomPainterState createState() => _BottomCustomPainterState();
}

class _BottomCustomPainterState extends State<BottomCustomPainter> {
  Tween<double> _animation;

  @override
  void initState() {
    super.initState();

    _animation = Tween(begin: widget.index, end: widget.index + 1);

    // _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 500),
      tween: _animation,
      builder: (context, value, _) {
        return CustomPaint(
            painter: ButtomPainter(
              width: widget.width,
              seepAngleSecond: ((360 / 3) * math.pi / 180) * value,
            ),
            child: widget.child);
      },
    );
  }
}
