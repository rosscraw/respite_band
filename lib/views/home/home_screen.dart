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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/weekends.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
