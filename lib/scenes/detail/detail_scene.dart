import 'package:auryn/entities/discover_media.dart';
import 'package:flutter/material.dart';

class DetailScene extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final DiscoverMedia discoverMedia = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: discoverMedia.id,
            child: Image.network('http://image.tmdb.org/t/p/w1280${discoverMedia.backdrop_path}'),
          ),
          Center(
            child: Text("Detail scene: ${discoverMedia.title}", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
