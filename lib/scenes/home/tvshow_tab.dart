import 'package:flutter/material.dart';

class TvShowTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('TV Shows scene', style: TextStyle(color: Colors.white)),
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
