import 'package:flutter/material.dart';
import 'package:insplash_project/components/Circle.dart';
import 'package:insplash_project/didi.dart';
import 'package:insplash_project/didipure.dart';
import 'package:insplash_project/main.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

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
        .addAnimatable(
            animatable: new Tween(begin: 1.0, end: 0.0),
            from: const Duration(seconds: 0),
            to: const Duration(seconds: 1),
            tag: "opacity",
            curve: Curves.linear)
        .animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
            child: Container(
                child: Image.asset(
          'assets/images/bg.jpg',
          width: 300,
          height: 300,
        ))),
        Didi(),
        AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget child){
            return DidiPure(sequenceAnimation: sequenceAnimation,);
          },
        )
      ],
    );
  }
}
