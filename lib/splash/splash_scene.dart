import 'package:flutter/material.dart';

class SplashScene extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Splash scene', style: TextStyle(color: Colors.white)),
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, '/home'),
              child: Text('Go to Home'),
              textColor: Colors.white,
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}
