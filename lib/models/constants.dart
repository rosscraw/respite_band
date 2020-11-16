library members;

import 'package:flutter/material.dart';

import 'band_member.dart';
import 'instrument.dart';

final BandMember ross = new BandMember(name: 'Ross Crawford', plays: 'Bass', image: Image.asset('images/members/ross/ross.jpg'));
final Instrument modelt = new Instrument(make: 'Schecter', model: 'Model-T', type: 'Bass', image: Image.asset('images/members/ross/modelt.jpg'));
final Instrument aerodyne = new Instrument(make: 'Fender', model: 'Aerodyne', type: 'Bass', image: Image.asset('images/members/ross/aerodyne.jpg'));

BandMember sam = new BandMember(name: 'Samuel Nicholson', plays: 'Vocals', image: Image.asset('images/members/sam/sam.jpg'));

BandMember andrew = new BandMember(name: 'Andrew Vaughan', plays: 'Guitar', image: Image.asset('images/members/andrew/andrew.jpg'));
final Instrument charvel = new Instrument(make: 'Charvel', model: 'DK24 2PT HH', type: 'Electric Guitar', image: Image.asset('images/members/andrew/charvel.png'));
final Instrument prs = new Instrument(make: 'PRS', model: 'S2 Vela McCarty', type: 'Electric Guitar', image: Image.asset('images/members/andrew/prs.jpg'));
final Instrument pawnshop = new Instrument(make: 'Fender', model: 'Pawn Shop Offset Special', type: 'Electric Guitar', image: Image.asset('images/members/andrew/pawnshop.jpg'));

BandMember euan = new BandMember(name: 'Euan Macqueen', plays: 'Guitar', image: Image.asset('images/members/euan/euan.jpg'));

BandMember reiss = new BandMember(name: 'Reiss McLeod', plays: 'Drums', image: Image.asset('images/members/reiss/reiss.jpg'));

