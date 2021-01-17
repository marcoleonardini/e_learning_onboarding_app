import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key key, @required String image})
      : _image = image,
        super(key: key);

  final String _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        Expanded(
          flex: 6,
          child: Transform.scale(
            scale: 1.25,
            child: Image.asset(
              _image,
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
      ],
    );
  }
}
