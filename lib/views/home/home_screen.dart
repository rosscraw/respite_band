import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final Image weekends = Image.asset('images/weekends.png', fit: BoxFit.contain,);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/weekends.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: Container(color: Colors.black.withOpacity(0.1))
        ),
      ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'images/weekends.png'),
                fit: BoxFit.contain
              ),
            ),
          ),
        )
      ],
    );
  }
}
