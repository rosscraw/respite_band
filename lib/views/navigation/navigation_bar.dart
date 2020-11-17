import 'package:checklist/views/contact/contact_screen.dart';
import 'package:checklist/views/music/music_screen.dart';
import 'package:checklist/views/home/home_screen.dart';
import 'package:checklist/views/members/members_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {

  int _currentIndex = 0;

  final List<Widget> _navTabs = [
    HomeScreen(title: 'Home Screen', key: PageStorageKey('Home')),
    MembersScreen(title: 'Members Screen', key: PageStorageKey('Members')),
    MusicScreen(title: 'Music Screen', key: PageStorageKey('Music')),
    ContactScreen(title: 'Contact Screen', key: PageStorageKey('Contact'))
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: _navTabs[_currentIndex],
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: const Color.fromARGB(205, 212, 175, 55),
        unselectedItemColor: Colors.grey[600],
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex:
        _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home', style: GoogleFonts.robotoSlab(),),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.group),
            title: new Text('Members', style: GoogleFonts.robotoSlab(),),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.music_note), title: Text('Music', style: GoogleFonts.robotoSlab(),)),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail), title: Text('Contact', style: GoogleFonts.robotoSlab(),)),
        ],
      ),
    );
  }

  /// Sets the state so that the current index is that of the tab tapped in the bottom navigation bar.
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
