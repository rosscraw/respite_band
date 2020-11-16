import 'package:checklist/models/band_member.dart';
import 'package:checklist/views/member_details/member_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
class MembersScreen extends StatefulWidget {
  MembersScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {


//  List<BandMember> bandMembers = [
//    Constant.sam,
//    Constant.andrew,
//    Constant.euan,
//    Constant.ross,
//    Constant.reiss
//  ];




//  List<BandMember> bandMembers = [
//    BandMember(name: 'Samuel Nicholson', plays: 'Vocals', image: Image.asset('images/members/sam/sam.jpg')),
//    BandMember(name: 'Andrew Vaughan', plays: 'Guitar', image: Image.asset('images/members/andrew/andrew.jpg')),
//    BandMember(name: 'Euan Macqueen', plays: 'Guitar', image: Image.asset('images/members/euan/euan.jpg')),
//    BandMember(name: 'Ross Crawford', plays: 'Bass', image: Image.asset('images/members/ross/ross.jpg')),
//    BandMember(name: 'Reiss McLeod', plays: 'Drums', image: Image.asset('images/members/reiss/reiss.jpg')),
//  ];



  @override
  Widget build(BuildContext context) {
//    Constant.ross.addInstrument(Constant.modelt);
//    Constant.ross.addInstrument(Constant.aerodyne);
//    Constant.andrew.addInstrument(Constant.charvel);
//    Constant.andrew.addInstrument(Constant.prs);
//    Constant.andrew.addInstrument(Constant.pawnshop);

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
                  return Card(
                    color: Colors.grey[900],
                    child: ListTile(
                      //TODO update to circle icon of member
                      leading: CircleAvatar(
                        backgroundImage: bandMembers[index].image.image,
                        //child: bandMembers[index].image
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
            )
          ),
        ),
      ),
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
