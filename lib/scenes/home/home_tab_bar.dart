import 'package:auryn/widgets/focusable.dart';
import 'package:flutter/material.dart';

class _HomeTabBarButton extends StatelessWidget {
  final Function onPressed;
  final String title;

  const _HomeTabBarButton({Key key, this.onPressed, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      focusNode: Focusable.of(context).focusNode,
      onPressed: () => this.onPressed(),
      child: Text(title),
      textColor: Colors.white,
    );
  }
}


class HomeTabBar extends StatelessWidget {
  final Function onTabPress;

  HomeTabBar(this.onTabPress);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Focusable(
          child: _HomeTabBarButton(title: 'Discover', onPressed: () => this.onTabPress('/')),
        ),
        Focusable(
          child: _HomeTabBarButton(title: 'TV Shows', onPressed: () => this.onTabPress('/tvshow')),
        ),
        Focusable(
          child: _HomeTabBarButton(title: 'Movies', onPressed: () => this.onTabPress('/movies')),
        ),
      ],
    );
  }
}
