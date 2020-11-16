import 'package:checklist/views/home/home_screen.dart';
import 'package:checklist/views/navigation/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppRoot extends StatefulWidget {
  @override
  _AppRootState createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {

  final Image logo = Image.asset('images/respite_logo_transparent.png', fit: BoxFit.contain, height: 48,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            logo,
            SizedBox(width: 8,),
            Text('RESPITE', style: GoogleFonts.robotoSlab(
                color: const Color.fromARGB(205, 212, 175, 55))
            ),

          ],
        ),
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

