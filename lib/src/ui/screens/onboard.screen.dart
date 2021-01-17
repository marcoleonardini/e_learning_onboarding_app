import 'package:e_learning_onboarding_app/src/widgets/painters/buttom_painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

ValueNotifier<int> index = ValueNotifier(0);

class OnboardScreen extends StatefulWidget {
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final _images = <String>[
    'assets/blog-post-bro.png',
    'assets/novelist-writing-bro.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: CustomFloatingActionButton(),
        body: Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Transform.scale(
                  scale: 1.25,
                  child: ValueListenableBuilder(
                      valueListenable: index,
                      builder: (context, _index, _) {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 750),
                          child: Image.asset(
                            _images[_index % 2],
                            key: UniqueKey(),
                            fit: BoxFit.cover,
                            alignment: Alignment.centerLeft,
                          ),
                        );
                      }),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  constraints: BoxConstraints.expand(),
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Online study is the',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Best choice for',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'everyone',
                        style: TextStyle(
                          fontSize: 22.0,
                          shadows: [
                            Shadow(color: Colors.black, offset: Offset(0, -4))
                          ],
                          color: Colors.transparent,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Theme.of(context).primaryColor,
                          decorationThickness: 5.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final double _width = 60.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        index.value = index.value + 1;
      },
      child: Container(
        width: _width,
        height: _width,
        child: ValueListenableBuilder(
          valueListenable: index,
          builder: (context, int _index, child) {
            print(_index);
            return BottomCustomPainter(
              key: UniqueKey(),
              width: _width,
              child: child,
              index: _index.toDouble() % 3,
            );
          },
          child: Center(
            child: Container(
              width: _width * 0.7,
              height: _width * 0.7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
              child: Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 28.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
    // TODO: implement initState
    super.initState();
    print('BottomCustomPainter ${widget.index}');
    _animation = Tween(begin: widget.index, end: widget.index + 1);

    // _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 500),
      tween: _animation,
      builder: (context, value, _) {
        print(value);
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
