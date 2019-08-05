import 'package:auryn/entities/discover_media.dart';
import 'package:flutter/material.dart';

class DiscoverTile extends StatelessWidget {
  final DiscoverMedia discoverMedia;

  const DiscoverTile({Key key, this.discoverMedia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (discoverMedia == null) {
      return Container();
    }

    final Widget image = this.discoverMedia.backdrop_path != null
      ? Image.network('http://image.tmdb.org/t/p/w1280${this.discoverMedia.backdrop_path}')
      : Container();

    return FlatButton(
      onPressed: () => Navigator.of(context, rootNavigator: true).pushNamed('/detail'),
      padding: EdgeInsets.all(0.0),
      child: AspectRatio(
        aspectRatio: 16/9,
        child: Container(
          child: Stack(
            children: <Widget>[
              image,
              Center(
                child: Text(discoverMedia.title, style: TextStyle(color: Colors.white))
              )
            ],
          ),
        ),
      ),
    );
  }

}
