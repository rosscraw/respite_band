import 'package:checklist/views/home/home_screen.dart';
import 'package:checklist/views/navigation/navigation_bar.dart';
import 'package:flutter/material.dart';

class AppRoot extends StatefulWidget {
  @override
  _AppRootState createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {

  final Image logo = Image.asset('images/respite_logo.jpg', fit: BoxFit.contain, height: 48,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: logo,
        actions: <Widget>[
          popupMenuButton(),
        ],
      ),
      body: NavigationBar(),
    );
  }

  /// PopUp Menu button for the app bar.
  /// Allows user to access settings and Log out of application.
  PopupMenuButton popupMenuButton() {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) {
        return {'Settings', 'Logout'}.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }


}

