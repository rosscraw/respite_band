import 'package:flutter/material.dart';

class MusicScreen extends StatefulWidget {
  MusicScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
    );
  }
}
