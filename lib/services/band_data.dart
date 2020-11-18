import 'file:///C:/Users/rossb/OneDrive/Documents/Flutter%20Projects/respite_band/lib/models/gear/instrument.dart';
import 'package:flutter/material.dart';
import 'package:checklist/models/band_member.dart';

/// The initial band data used throughout the app.
class BandData{

  BandData();

  List<BandMember> retrieveInfo() {

    // ROSS
    final BandMember ross = new BandMember(name: 'Ross Crawford', plays: 'Bass', image: Image.asset('images/members/ross/ross.jpg'));
    final Instrument modelt = new Instrument(make: 'Schecter', model: 'Model-T', type: 'Bass', image: Image.asset('images/members/ross/modelt.jpg'));
    final Instrument aerodyne = new Instrument(make: 'Fender', model: 'Aerodyne', type: 'Bass', image: Image.asset('images/members/ross/aerodyne.jpg'));
    ross.addInstrument(modelt);
    ross.addInstrument(aerodyne);
    ross.instagram ='rossbremcraw';
    ross.twitter = 'rossbremcraw';
    ross.nickname = 'Bass Master Elite';

    // SAM
    final BandMember sam = new BandMember(name: 'Samuel Nicholson', plays: 'Vocals', image: Image.asset('images/members/sam/sam.jpg'));
    final Instrument mic = new Instrument(make: 'Microphone', model: 'Shouty Stick', type: 'Microphone', image: Image.asset('images/members/sam/mic.jpg'));
    sam.addInstrument(mic);
    //sam.twitter = '';
    sam.instagram = 'callthatacarrot';
    sam.nickname = 'Sambo';

    // ANDREW
    final BandMember andrew = new BandMember(name: 'Andrew Vaughan', plays: 'Guitar', image: Image.asset('images/members/andrew/andrew.jpg'));
    final Instrument charvel = new Instrument(make: 'Charvel', model: 'DK24 2PT HH', type: 'Electric Guitar', image: Image.asset('images/members/andrew/charvel.png'));
    final Instrument prs = new Instrument(make: 'PRS', model: 'S2 Vela McCarty', type: 'Electric Guitar', image: Image.asset('images/members/andrew/prs.jpg'));
    final Instrument pawnshop = new Instrument(make: 'Fender', model: 'Pawn Shop Offset Special', type: 'Electric Guitar', image: Image.asset('images/members/andrew/pawnshop.jpg'));
    andrew.addInstrument(charvel);
    andrew.addInstrument(prs);
    andrew.addInstrument(pawnshop);
    andrew.instagram = 'findingandrew_';
    andrew.twitter = 'findingandrew_';
    andrew.nickname = 'Banandrew';

    // EUAN
    final BandMember euan = new BandMember(name: 'Euan Macqueen', plays: 'Guitar', image: Image.asset('images/members/euan/euan.jpg'));
    final Instrument strat = new Instrument(make: 'Fender', model: 'American Performer Stratocaster HSS', type: 'Electric Guitar', image: Image.asset('images/members/euan/strat.jpeg'));
    final Instrument schecter = new Instrument(make: 'Schecter', model: '', type: 'Electric Guitar', image: Image.asset('images/members/andrew/prs.jpg'));
    euan.addInstrument(strat);
    euan.twitter = 'euan_m108';
    euan.instagram = 'euan_mac_';
    euan.nickname = 'Eubo';
    //euan.addInstrument(schecter);

    //REISS
    final BandMember reiss = new BandMember(name: 'Reiss McLeod', plays: 'Drums', image: Image.asset('images/members/reiss/reiss.jpg'));
    final Instrument mapex = new Instrument(make: 'Mapex', model: 'Tornado III', type: 'Drums', image: Image.asset('images/members/reiss/mapex.jpg'));
    reiss.addInstrument(mapex);
    //reiss.twitter = '';
    reiss.instagram = 'reiss.mcleod';
    reiss.nickname = 'Creiss';

    return [sam, andrew, euan, ross, reiss];

  }

}