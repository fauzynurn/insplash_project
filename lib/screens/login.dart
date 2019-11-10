import 'package:flutter/material.dart';
import 'package:insplash_project/components/buttons/animatedbutton.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  String _emailAddress;
  String _password;
  AnimationController _controller;
  AnimationController _loginController;
  Animation<double> translateAnimation;
  Animation<double> fontSizeAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    _loginController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    translateAnimation = Tween(begin: 0.0, end: -30.0).animate(CurvedAnimation(
        parent: _loginController,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeOutCirc,
        ),
        reverseCurve: Interval(
          0.0,
          1.0,
          curve: Curves.easeOutCirc.flipped,
        )));
    fontSizeAnimation = Tween(begin: 50.0, end: 25.0).animate(CurvedAnimation(
        parent: _loginController,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeOutCirc,
        ),
        reverseCurve: Interval(
          0.0,
          1.0,
          curve: Curves.easeOutCirc.flipped,
        )));
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        if (visible) {
          _loginController.forward();
        } else {
          _loginController.reverse();
        }
      },
    );
  }

  Future startAnimation() async {
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {
      print('Animation Failed');
    }
  }

  Future reverseAnimation() async {
    try {
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      print('Animation reverse Failed');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _loginController,
        builder: (BuildContext context, Widget child) {
          return Container(
            color: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                //Expanded solve the problem! lol
                Expanded(
                    child: Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 25, right: 55),
                        child: Center(
                            child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                              Transform.translate(
                                  offset: Offset(0.0, translateAnimation.value),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Text('Infinite',
                                          style: TextStyle(
                                              fontSize: fontSizeAnimation.value,
                                              color: Colors.black,
                                              fontFamily: 'SecondaSoft-Black')),
                                      Text('Inspiration',
                                          style: TextStyle(
                                              fontSize: fontSizeAnimation.value,
                                              color: Colors.black,
                                              fontFamily: 'SecondaSoft-Black'))
                                    ],
                                  )),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Text('Let\'s go in!',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontFamily: 'SecondaSoft-Regular')),
                              ),
                              Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(top: 17.0),
                                        width: 200,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Email address',
                                          ),
                                        )),
                                    Container(
                                        margin: EdgeInsets.only(top: 25),
                                        width: 200,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Password',
                                          ),
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(top: 25),
                                      child: AnimatedButton(
                                          controller: _controller,
                                          startCallback: startAnimation,
                                          stopCallback: reverseAnimation),
                                    )
                                  ]),
                            ]))))
              ],
            ),
          );
        });
  }
}
