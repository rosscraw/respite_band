import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// Widget to display an animated loading spinner for loading operations.
class LoadingSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitFadingCircle(
          color: const Color.fromARGB(205, 212, 175, 55),
          size: 50.0,
        ),
      ),
    );
  }
}
