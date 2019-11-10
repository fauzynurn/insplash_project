import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insplash_project/components/Circle.dart';

class AnimatedButton extends StatefulWidget {
  final AnimationController controller;

  final Animation<Color> color;
  final Animation<double> textTranslation;
  final Animation<double> loadingTranslation;
  final Animation<double> fadeIn;
  final Animation<double> fadeOut;

  final Function startCallback;
  final Function stopCallback;

  AnimatedButton(
      {Key key, this.controller, this.startCallback, this.stopCallback})
      : color = ColorTween(
          begin: Colors.black,
          end: Colors.grey[300],
        ).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              1.0,
              curve: Curves.easeOutCirc,
            ),
            reverseCurve: Interval(
              0.0,
              1.0,
              curve: Curves.easeOutCirc.flipped,
            ))),
        textTranslation = Tween(
          begin: 0.0,
          end: 20.0,
        ).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              1.0,
              curve: Curves.easeOutCirc,
            ),
            reverseCurve: Interval(
              0.0,
              1.0,
              curve: Curves.easeOutCirc.flipped,
            ))),
        loadingTranslation = Tween(
          begin: -20.0,
          end: 0.0,
        ).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              1.0,
              curve: Curves.easeOutCirc,
            ),
            reverseCurve: Interval(
              0.0,
              1.0,
              curve: Curves.easeOutCirc.flipped,
            ))),
        fadeIn = Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              1.0,
              curve: Curves.easeOutCirc,
            ),
            reverseCurve: Interval(
              0.0,
              1.0,
              curve: Curves.easeOutCirc.flipped,
            ))),
        fadeOut = Tween(
          begin: 1.0,
          end: 0.0,
        ).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              1.0,
              curve: Curves.easeOutCirc,
            ),
            reverseCurve: Interval(
              0.0,
              1.0,
              curve: Curves.easeOutCirc.flipped,
            ))),
        super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool isLoading = false;

  startAnimation() {
    widget.startCallback();
    setState(() {
      isLoading = true;
    });
  }

  stopAnimation() {
    widget.stopCallback();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
            animation: widget.controller,
            builder: (BuildContext context, Widget child) {
              return RaisedButton(
                  disabledColor: Colors.grey[300],
                  onPressed: isLoading ? null : () => startAnimation(),
                  textColor: Colors.white,
                  color: widget.color.value,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Transform.translate(
                          offset: Offset(widget.textTranslation.value, 0.0),
                          child: Opacity(
                            opacity: widget.fadeOut.value,
                            child: Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text('Sign in',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'SecondaSoft-Bold',
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(widget.loadingTranslation.value, 0.0),
                          child: Opacity(
                            opacity: widget.fadeIn.value,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[700])
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 12, top: 10, bottom: 10),
                                    child: Text('Loading',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey[700],
                                            fontFamily: 'SecondaSoft-Bold',
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            }),
        // RaisedButton(
        //     onPressed: () => stopAnimation(),
        //     textColor: Colors.white,
        //     color: Colors.blue,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: new BorderRadius.circular(8.0),
        //     ),
        //     child: Container(
        //       child: Text('Reset'),
        //     ))
      ],
    );
  }
}
