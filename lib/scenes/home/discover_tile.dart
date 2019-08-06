import 'package:auryn/entities/discover_media.dart';
import 'package:auryn/widgets/focusable.dart';
import 'package:flutter/material.dart';

class _DiscoverTileButton extends StatelessWidget {
  final DiscoverMedia discoverMedia;

  _DiscoverTileButton({Key key, this.discoverMedia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (discoverMedia == null) {
      return Container();
    }

    final Widget image = discoverMedia.backdrop_path != null
      ? Image.network('http://image.tmdb.org/t/p/w1280${discoverMedia.backdrop_path}')
      : Container();

    return FlatButton(
      focusNode: Focusable.of(context).focusNode,
      onPressed: () => Navigator.of(context, rootNavigator: true).pushNamed('/detail'),
      padding: EdgeInsets.all(0.0),
      child: AspectRatio(
        aspectRatio: 16/9,
        child: Container(
          child: Stack(
            children: <Widget>[
              image,
              Container(
                decoration: Focusable.of(context).focusNode.hasFocus ? BoxDecoration(
                  border: Border.all(color: Colors.red, width: 2.0)
                ) : null,
              ),
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

class DiscoverTile extends StatelessWidget {
  final DiscoverMedia discoverMedia;

  const DiscoverTile({Key key, this.discoverMedia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Focusable(
      child: _DiscoverTileButton(discoverMedia: discoverMedia)
    );
  }
}
