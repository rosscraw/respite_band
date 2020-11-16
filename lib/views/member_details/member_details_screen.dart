import 'package:checklist/models/band_member.dart';
import 'package:checklist/models/instrument.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MemberDetailsScreen extends StatefulWidget {
  MemberDetailsScreen({Key key, this.member});

  final BandMember member;

  @override
  _MemberDetailsScreenState createState() => _MemberDetailsScreenState();
}

class _MemberDetailsScreenState extends State<MemberDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(
          color: const Color.fromARGB(205, 212, 175, 55),
        ),
        title: Text(
          widget.member.name,
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: widget.member.image,
                ),
                SizedBox(
                  width: 8
                ),
                //TODO update so is a list of contact details
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Twitter", style: GoogleFonts.robotoSlab(color: const Color.fromARGB(205, 212, 175, 55)),),
                    Text("Instagram", style: GoogleFonts.robotoSlab(color: const Color.fromARGB(205, 212, 175, 55)), ),
                    Text("Email", style: GoogleFonts.robotoSlab(color: const Color.fromARGB(205, 212, 175, 55)),)
                  ],
                )
              ],
            ),
            widget.member.instruments.isNotEmpty
                ? instrumentList()
                : Text('No Instruments:', style: GoogleFonts.robotoSlab(color: const Color.fromARGB(205, 212, 175, 55), fontSize: 20),),
          ],
        ),
      )),
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
              Text('Instruments:', style: GoogleFonts.robotoSlab(color: const Color.fromARGB(205, 212, 175, 55), fontSize: 20),),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: instruments.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(instruments[index].make, style: GoogleFonts.robotoSlab(),),
                        subtitle: Text(instruments[index].model, style: GoogleFonts.robotoSlab()),
                        trailing: Container(
                            width: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: instruments[index].image.image,
                                fit: BoxFit.contain
                              )
                            ),
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
