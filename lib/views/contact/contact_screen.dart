import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  ContactScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Contacts and Social Media', style: GoogleFonts.robotoSlab(
            color: const Color.fromARGB(205, 212, 175, 55), fontSize: 20)),
            InkWell(
              child: Row(
                children: [
                  Icon(Icons.email, color: const Color.fromARGB(205, 212, 175, 55),),
                  Text(' respite@gmail.com', style: GoogleFonts.robotoSlab(
          color: const Color.fromARGB(205, 212, 175, 55), fontSize: 20)),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.twitter, color: const Color.fromARGB(205, 212, 175, 55),),
                  Text(" @findingargyle",
                      style: GoogleFonts.robotoSlab(
                        color: const Color.fromARGB(205, 212, 175, 55), fontSize: 20)),
                ],
              ),
              onTap: () =>
                  launch('https://www.twitter.com/findingargyle' ),
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.instagram, color: const Color.fromARGB(205, 212, 175, 55),),
                  Text(" @findingargyleband",
                      style: GoogleFonts.robotoSlab(
                        color: const Color.fromARGB(205, 212, 175, 55), fontSize: 20)),
                ],
              ),
              onTap: () =>
                  launch('https://www.instagram.com/findingargyleband' ),
            )
          ],
        ),
      ),
    ),
    );
  }
}
