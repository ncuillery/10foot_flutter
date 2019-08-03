import 'package:flutter/material.dart';
import 'package:flutter/src/material/page_transitions_theme.dart';

import 'detail/detail_scene.dart';
import 'home/home_scene.dart';
import 'splash/splash_scene.dart';

void main() => runApp(MyApp());

class FadeTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(PageRoute<T> route, BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return new FadeTransition(opacity: animation, child: child);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auryn',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScene(),
        '/home': (context) => HomeScene(),
        '/detail': (context) => DetailScene(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(0x11, 0x1E, 0x6C, 1),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeTransitionsBuilder(),
          TargetPlatform.android: FadeTransitionsBuilder(),
        }),
      ),
    );
  }
}
