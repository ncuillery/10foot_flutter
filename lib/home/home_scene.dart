import 'package:flutter/material.dart';

class HomeScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Home scene', style: TextStyle(color: Colors.white)),
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, '/detail'),
              child: Text('Go to detail'),
              textColor: Colors.white,
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}
