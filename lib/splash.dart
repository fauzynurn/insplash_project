import 'package:flutter/material.dart';
import 'package:insplash_project/components/Circle.dart';
import 'package:insplash_project/didi.dart';
import 'package:insplash_project/didipure.dart';
import 'package:insplash_project/main.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:insplash_project/screens/login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  SequenceAnimation sequenceAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
    sequenceAnimation = new SequenceAnimationBuilder()
        //683.4285714285714
        //411.42857142857144
        .addAnimatable(
            animatable: new Tween(begin: 0.0, end: -1200.0),
            from: const Duration(seconds: 2),
            to: const Duration(seconds: 3),
            tag: "goUp",
            curve: Curves.elasticIn)
        .animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Login(),
        AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget child) {
            return DidiPure(
              sequenceAnimation: sequenceAnimation,
            );
          },
        )
      ],
    );
  }
}
