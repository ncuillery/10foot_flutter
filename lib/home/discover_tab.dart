import 'package:flutter/material.dart';

class DiscoverTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Discover scene', style: TextStyle(color: Colors.white)),
          RaisedButton(
            onPressed: () => Navigator.of(context, rootNavigator: true).pushNamed('/detail'),
            child: Text('Go to detail'),
            textColor: Colors.white,
            color: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}
