import 'file:///C:/Users/rossb/OneDrive/Documents/Flutter%20Projects/respite_band/lib/models/gear/instrument.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// A member of the band.
///
/// A Band Member will be used to
class BandMember {

  BandMember({Key key, this.name, this.plays, this.image});

  final String name;
  final String plays;
  final Image image;
  String _nickname;
  FaIcon _instrumentIcon;

  FaIcon get instrumentIcon => _instrumentIcon;

  set instrumentIcon(FaIcon instrumentIcon) {
    _instrumentIcon = instrumentIcon;
  }


  String _twitter;
  String _instagram;
  String _email;
  List<Instrument> instruments = [];
  List<String> _facts = [];

  /// Adds an [Instrument] to the band member's list.
  void addInstrument(Instrument instrument) {
    if(instruments.contains(instrument)) {

    }
    else {
      instruments.add(instrument);
    }
  }

  String get nickname => _nickname;

  set nickname(String nickname) {
    _nickname = nickname;
  }

  String get twitter {
    return _twitter;
  }

  set twitter(String twitter) {
    _twitter = twitter;
  }

  String get instagram {
    return _instagram;
  }

  set instagram(String instagram) {
    _instagram = instagram;
  }
  String get email {
    return _email;
  }

  set email(String email) {
    _email = email;
  }


}


