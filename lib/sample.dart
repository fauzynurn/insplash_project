import 'package:flutter/material.dart';

class MainMask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return RadialGradient(
          center: Alignment.topLeft,
          colors: <Color>[Colors.lightBlue]
        ).createShader(bounds);
      },
      child: const Text('I’m burning the memories'),
    );
  }
}
