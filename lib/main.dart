import 'file:///C:/Users/rossb/OneDrive/Documents/Flutter%20Projects/checklist/lib/views/home/home_screen.dart';
import 'package:checklist/models/band_member.dart';
import 'package:checklist/services/band_data.dart';
import 'package:checklist/views/app_root.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  BandData data = new BandData();



  @override
  Widget build(BuildContext context) {
    List<BandMember> members = data.retrieveInfo();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Provider<List<BandMember>>.value(
      value: members,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AppRoot(),
      ),
    );
  }
}



