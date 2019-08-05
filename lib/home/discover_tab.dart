import 'package:flutter/material.dart';

import '../entities/discover_media.dart';
import '../models/tmdb.dart';
import '../service_locator.dart';

class DiscoverTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String content = sl.get<TmdbModel>().discoverMedias.map((DiscoverMedia media) => media.title).join(', ');

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Discover scene: $content', style: TextStyle(color: Colors.white)),
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
