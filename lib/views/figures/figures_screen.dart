import 'package:flutter/material.dart';

class FiguresScreen extends StatefulWidget {
  FiguresScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FiguresScreenState createState() => _FiguresScreenState();
}

class _FiguresScreenState extends State<FiguresScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.title),
    );
  }
}
