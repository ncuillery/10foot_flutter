import 'package:flutter/material.dart';

import 'discover_tab.dart';
import 'home_page_route.dart';
import 'home_tab_bar.dart';
import 'movie_tab.dart';
import 'tvshow_tab.dart';

class HomeScene extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  String lastRoute;

  _handleTabPress(routeName) {
    navigatorKey.currentState.pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // If the nested navigator can pop, go, otherwise delegate to the root one
        if (navigatorKey.currentState.canPop()) {
          navigatorKey.currentState.pop();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            HomeTabBar(this._handleTabPress),
            Expanded(
              child: Navigator(
                key: navigatorKey,
                initialRoute: '/',
                onGenerateRoute: (RouteSettings settings) {
                  Widget widget;

                  switch (settings.name) {
                    case '/':
                      widget = DiscoverTab();
                      break;
                    case '/tvshow':
                      widget = TvShowTab();
                      break;
                    case '/movie':
                      widget = MovieTab();
                      break;
                    default:
                      throw Exception('Invalid route: ${settings.name}');
                  }

                  HomePageRoute route = HomePageRoute(lastRoute, settings.name, widget);
                  lastRoute = settings.name;

                  return route;
                }
              ),
            ),
          ],
        )
      ),
    );
  }
}
