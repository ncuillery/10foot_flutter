import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class SplashScene extends StatefulWidget {
  @override
  _SplashSceneState createState() => _SplashSceneState();
}

class _SplashSceneState extends State<SplashScene> {
  String currentAnimation = 'In';

  void _handleComplete(String animationName) {
    if (animationName == 'In') {
      Future.delayed(Duration(seconds: 1), () {
        setState(() => currentAnimation = 'Out');
      });
    } else if (animationName == 'Out') {
      Navigator.of(context).pushNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlareActor('assets/splash.flr',
          animation: currentAnimation,
          callback: _handleComplete,
        ),
      ),
    );
  }
}
