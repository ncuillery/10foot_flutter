import 'package:flutter/material.dart';

import 'discover_tab.dart';
import 'home_tab_bar.dart';
import 'movie_tab.dart';
import 'tvshow_tab.dart';

class HomeScene extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  _handleTabPress(routeName) {
    navigatorKey.currentState.pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HomeTabBar(this._handleTabPress),
          Expanded(
            child: Navigator(
              key: navigatorKey,
              initialRoute: '/',
              onGenerateRoute: (RouteSettings settings) {
                WidgetBuilder builder;
                switch (settings.name) {
                  case '/':
                    builder = (BuildContext _) => DiscoverTab();
                    break;
                  case '/tvshow':
                    builder = (BuildContext _) => TvShowTab();
                    break;
                  case '/movie':
                    builder = (BuildContext _) => MovieTab();
                    break;
                  default:
                    throw Exception('Invalid route: ${settings.name}');
                }
                return MaterialPageRoute(builder: builder, settings: settings);
              }
            ),
          ),
        ],
      )
    );
  }
}
