import 'package:flutter/material.dart';

/// An item of gear a [BandMember] owns.
class Gear {

  Gear({this.make, this.model, this.image});

  final String make;
  final String model;
  String type;
  final Image image;


  void setType(String type) {
    this.type = type;
  }

}