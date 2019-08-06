import 'package:auryn/entities/discover_media.dart';
import 'package:auryn/widgets/focusable.dart';
import 'package:flutter/material.dart';

class DiscoverTile extends StatefulWidget {
  final DiscoverMedia discoverMedia;

  const DiscoverTile({Key key, this.discoverMedia}) : super(key: key);

  @override
  _DiscoverTileState createState() => _DiscoverTileState();
}

class _DiscoverTileState extends State<DiscoverTile> {
  bool hasFocus = false;

  _handleFocus() {
    setState(() => hasFocus = true);
  }

  _handleBlur() {
    setState(() => hasFocus = false);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.discoverMedia == null) {
      return Container();
    }

    final Widget image = this.widget.discoverMedia.backdrop_path != null
      ? Image.network('http://image.tmdb.org/t/p/w1280${this.widget.discoverMedia.backdrop_path}')
      : Container();

    return Focusable(
      debugLabel: widget.discoverMedia.title,
      onFocus: _handleFocus,
      onBlur: _handleBlur,
      child: FlatButton(
        onPressed: () => Navigator.of(context, rootNavigator: true).pushNamed('/detail'),
        padding: EdgeInsets.all(0.0),
        child: AspectRatio(
          aspectRatio: 16/9,
          child: Container(
            child: Stack(
              children: <Widget>[
                image,
                Container(
                  decoration: hasFocus ? BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2.0)
                  ) : null,
                ),
                Center(
                  child: Text(widget.discoverMedia.title, style: TextStyle(color: Colors.white))
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
