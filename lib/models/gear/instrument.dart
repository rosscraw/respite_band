import 'package:flutter/material.dart';

/// An instrument that a [BandMember] plays.
class Instrument{

  Instrument({Key key, this.make, this.model, this.type, this.image});

  final String make;
  final String model;
  final String type;
  final Image image;



}