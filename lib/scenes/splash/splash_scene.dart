import 'package:auryn/models/tmdb.dart';
import 'package:auryn/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SplashScene extends StatefulWidget {
  @override
  _SplashSceneState createState() => _SplashSceneState();
}

class _SplashSceneState extends State<SplashScene> {
  String currentAnimation = 'In';

  void _handleComplete (String animationName) async {
    if (animationName == 'In') {
      // Do time-consuming tasks
      await DotEnv().load();
      sl.registerSingleton<TmdbModel>(TmdbModel());
      await sl.get<TmdbModel>().fetchDiscoverMedias();
      setState(() => currentAnimation = 'Out');
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
