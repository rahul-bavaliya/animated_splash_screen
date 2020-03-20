import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_splash_new/utils/openpainter.dart';

import 'home_main.dart';

class SplashScreen extends StatefulWidget {
  @override
  State createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Transform Function(BuildContext context, Widget _widget) transFormFunction;

  onDoneLoading() async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    );
    transFormFunction = (BuildContext context, Widget _widget) {
      return Transform.rotate(
        angle: animationController.value * 25,
        child: _widget,
      );
    };
    loadData();
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: AnimatedBuilder(
                  animation: animationController,
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        child: CustomPaint(
                          painter: OpenPainter(5, 4),
                        ),
                      ),
                    ),
                  ),
                  builder: transFormFunction,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                  animation: animationController,
                  child: Container(
                    height: 75.0,
                    width: 75.0,
                    child: Center(
                      child: Container(
                        width: 75,
                        height: 75,
                        child: CustomPaint(
                          painter: OpenPainter(5, 5),
                        ),
                      ),
                    ),
                  ),
                  builder: transFormFunction,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                  animation: animationController,
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    child: Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        child: CustomPaint(
                          painter: OpenPainter(5, 2),
                        ),
                      ),
                    ),
                  ),
                  builder: transFormFunction,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                  animation: animationController,
                  child: Container(
                    height: 25.0,
                    width: 25.0,
                    child: Center(
                      child: Container(
                        width: 25,
                        height: 25,
                        child: CustomPaint(
                          painter: OpenPainter(5, 1),
                        ),
                      ),
                    ),
                  ),
                  builder: transFormFunction,
                ),
              ),
              //       Center(
              //         child: Container(
              //           width: 240,
              //           height: 240,
              //           child: CustomPaint(
              //             painter: OpenPainter(5, 5),
              //           ),
              //         ),
              //       ),
              //       Center(
              //         child: Container(
              //           width: 200,
              //           height: 200,
              //           child: CustomPaint(
              //             painter: OpenPainter(5, 4),
              //           ),
              //         ),
              //       ),
            ],
          ),
        ),
      );
}
