import 'package:e_learning_onboarding_app/src/ui/screens/first_page.screen.dart';
import 'package:e_learning_onboarding_app/src/ui/screens/second_page.screen.dart';
import 'package:e_learning_onboarding_app/src/ui/screens/third_page.screen.dart';
import 'package:e_learning_onboarding_app/src/widgets/customButtomPainter.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> index = ValueNotifier(0);

class OnboardScreen extends StatefulWidget {
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final _images = <String>[
    'assets/blog-post-bro.png',
    'assets/novelist-writing-bro.png',
    'assets/blogging-bro.png'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: CustomFloatingActionButton(),
        body: Container(
          constraints: BoxConstraints.expand(),
          child: ValueListenableBuilder(
              valueListenable: index,
              builder: (context, int _index, _) {
                switch (_index % 3) {
                  case 0:
                    return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 750),
                        child: FirstPage(
                          key: UniqueKey(),
                          image: _images[_index % 3],
                        ));

                    break;
                  case 1:
                    return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 750),
                        child: SecondPage(
                          key: UniqueKey(),
                          image: _images[_index % 3],
                        ));

                    break;
                  case 2:
                    return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 750),
                        child: ThirdPage(
                          key: UniqueKey(),
                          image: _images[_index % 3],
                        ));

                    break;

                  default:
                    return CircularProgressIndicator();
                }
              }),
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
