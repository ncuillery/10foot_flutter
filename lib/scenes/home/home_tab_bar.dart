import 'package:flutter/material.dart';

class HomeTabBar extends StatelessWidget {
  final Function onTabPress;

  HomeTabBar(this.onTabPress);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          onPressed: () => this.onTabPress('/'),
          child: Text('Discover'),
          textColor: Colors.white,
        ),
        FlatButton(
          onPressed: () => this.onTabPress('/tvshow'),
          child: Text('TV Shows'),
          textColor: Colors.white,
        ),
        FlatButton(
          onPressed: () => this.onTabPress('/movie'),
          child: Text('Movies'),
          textColor: Colors.white,
        ),
      ],
    );
  }
}
