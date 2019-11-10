import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class Didi extends StatelessWidget {
  final SequenceAnimation sequenceAnimation;

  Didi({this.sequenceAnimation});
  @override
  Widget build(BuildContext context) {
    return 
    Opacity(
      opacity: sequenceAnimation['fadesIn'].value,
    child: Container(
      child: Center(
        child: Container(
            child: Image.asset('assets/images/refined_logo_masked1x.png')
    )
      )
    )
    );
  }
}
