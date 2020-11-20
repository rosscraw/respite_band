import 'package:checklist/models/band_member.dart';
import 'package:checklist/views/member_details/member_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

/// Screen that provides a list of all the [BandMember]s.
///
/// Shows the member's name, their role and a picture.
/// Can access further information for each member by selecting the information button.
class MembersScreen extends StatefulWidget {
  MembersScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {

  @override
  Widget build(BuildContext context) {

  final bandMembers = Provider.of<List<BandMember>>(context);

    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: bandMembers.length,
                itemBuilder: (context, index) {
                  return memberCard(index, bandMembers);
//                  return Card(
//                    color: Colors.grey[900],
//                    child: ListTile(
//                      //TODO update to circle icon of member
//                      leading: CircleAvatar(
//                        backgroundImage: bandMembers[index].image.image,
//                        //child: bandMembers[index].image
//                      ),
//                      //TODO Style
//                      title: Text(bandMembers[index].name, style: GoogleFonts.robotoSlab(color: const Color.fromARGB(205, 212, 175, 55),)),
//                      //TODO Style
//                      subtitle: Text(bandMembers[index].plays, style: GoogleFonts.robotoSlab(color: const Color.fromARGB(205, 212, 175, 55),)),
//                      //TODO take to separate page
//                      trailing: FlatButton.icon(
//                        icon: Icon(Icons.info_outline, color: const Color.fromARGB(205, 212, 175, 55),
//                        ),
//                        label: Text('info', style: GoogleFonts.robotoSlab(color: const Color.fromARGB(205, 212, 175, 55),)),
//                        //TODO Navigate to band member details page
//                        onPressed: () {
//                          navigateToMemberDetails(bandMembers[index]);
//                        },
//                      ),
//
//                    )
//                  );
                }
            )
          ),
        ),
      ),
    );
  }

  /// This produces a [Card] which displays information about a [BandMember].
  /// Can access [MemberDetailsScreen] for specific member by selecting the trailing [FlatButton].
  Card memberCard(int index, List<BandMember> bandMembers) {
    return Card(
        color: Colors.grey[900],
        child: ListTile(
          //TODO update to circle icon of member
          leading: SizedBox(
            child: bandMembers[index].image
          ),
          //TODO Style
          title: Text(bandMembers[index].name, style: GoogleFonts.robotoSlab(color: const Color.fromARGB(205, 212, 175, 55),)),
          //TODO Style
          subtitle: Text(bandMembers[index].plays, style: GoogleFonts.robotoSlab(color: const Color.fromARGB(205, 212, 175, 55),)),
          //TODO take to separate page
          trailing: FlatButton.icon(
            icon: Icon(Icons.info_outline, color: const Color.fromARGB(205, 212, 175, 55),
            ),
            label: Text('info', style: GoogleFonts.robotoSlab(color: const Color.fromARGB(205, 212, 175, 55),)),
            //TODO Navigate to band member details page
            onPressed: () {
              navigateToMemberDetails(bandMembers[index]);
            },
          ),

        )
    );
  }

  void navigateToMemberDetails(BandMember member) {
    // TODO Firestore Integration
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => MemberDetailsScreen(member: member,))).then((value) {
      setState(() {});
    });
  }
}
