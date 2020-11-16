import 'package:checklist/models/band_member.dart';
import 'package:checklist/models/instrument.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MemberDetailsScreen extends StatefulWidget {
  MemberDetailsScreen({Key key, this.member});

  final BandMember member;

  @override
  _MemberDetailsScreenState createState() => _MemberDetailsScreenState();
}

class _MemberDetailsScreenState extends State<MemberDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    BandMember member = widget.member;
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(
          color: const Color.fromARGB(205, 212, 175, 55),
        ),
        title: Text(
          member.name,
          style: GoogleFonts.robotoSlab(
              color: const Color.fromARGB(205, 212, 175, 55)),
        ),
      ),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: const Color.fromARGB(205, 212, 175, 55),
                    ),
                  ),
                  child: member.image,
                ),
                SizedBox(width: 8),
                contactList(member),
              ],
            ),
            widget.member.instruments.isNotEmpty
                ? instrumentList()
                : Text(
                    'No Instruments:',
                    style: GoogleFonts.robotoSlab(
                        color: const Color.fromARGB(205, 212, 175, 55),
                        fontSize: 20),
                  ),
          ],
        ),
      )),
    );
  }

  Widget contactList(BandMember member) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        member.twitter != null
            ? InkWell(
                child: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.twitter, color: const Color.fromARGB(205, 212, 175, 55),),
                    Text(" @" + member.twitter,
                        style: GoogleFonts.robotoSlab(
                            color: const Color.fromARGB(205, 212, 175, 55),)),
                  ],
                ),
                onTap: () =>
                    launch('https://www.twitter.com/' + member.twitter),
              )
            : SizedBox.shrink(),
        member.instagram != null
            ? InkWell(
                child: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.instagram,color: const Color.fromARGB(205, 212, 175, 55),),
                    Text(" @" + member.instagram,
                        style: GoogleFonts.robotoSlab(
                            color: const Color.fromARGB(205, 212, 175, 55))),
                  ],
                ),
                onTap: () =>
                    launch('https://www.instagram.com/' + member.instagram),
              )
            : SizedBox.shrink(),
        member.email != null
            ? Text("Email: @",
                style: GoogleFonts.robotoSlab(
                    color: const Color.fromARGB(205, 212, 175, 55),
                    fontSize: 12))
            : SizedBox.shrink()
      ],
    );
  }

  Widget instrumentList() {
    List<Instrument> instruments = widget.member.instruments;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Instruments:',
                style: GoogleFonts.robotoSlab(
                    color: const Color.fromARGB(205, 212, 175, 55),
                    fontSize: 20),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: instruments.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          instruments[index].make,
                          style: GoogleFonts.robotoSlab(),
                        ),
                        subtitle: Text(instruments[index].model,
                            style: GoogleFonts.robotoSlab()),
                        trailing: Container(
                          width: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: instruments[index].image.image,
                                  fit: BoxFit.contain)),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
