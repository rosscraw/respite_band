import 'package:checklist/models/instrument.dart';
import 'package:flutter/material.dart';

class BandMember {

  BandMember({Key key, this.name, this.plays, this.image});

  final String name;
  final String plays;
  final Image image;
  String twitter;
  String instagram;
  List<Instrument> instruments = [];
  List<String> _facts = [];

  void addInstrument(Instrument instrument) {
    if(instruments.contains(instrument)) {

    }
    else {
      instruments.add(instrument);
    }
  }

}


BandMember ross = new BandMember(name: 'Ross Crawford', plays: 'Bass', image: Image.asset('images/members/ross/ross.jpg'));
Instrument modelt = new Instrument(make: 'Schecter', model: 'Model-T', type: 'Bass');
BandMember sam = new BandMember(name: 'Samuel Nicholson', plays: 'Vocals', image: Image.asset('images/members/sam/sam.jpg'));
BandMember andrew = new BandMember(name: 'Andrew Vaughan', plays: 'Guitar', image: Image.asset('images/members/andrew/andrew.jpg'));
BandMember euan = new BandMember(name: 'Euan Macqueen', plays: 'Guitar', image: Image.asset('images/members/euan/euan.jpg'));
BandMember reiss = new BandMember(name: 'Reiss McLeod', plays: 'Drums', image: Image.asset('images/members/reiss/reiss.jpg'));

List<BandMember> bandMembers = [
  sam,
  andrew,
  euan,
  ross,
  reiss
];