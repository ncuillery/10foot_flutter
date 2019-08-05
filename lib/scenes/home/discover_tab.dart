import 'package:auryn/entities/discover_media.dart';
import 'package:auryn/models/tmdb.dart';
import 'package:auryn/scenes/home/discover_tile.dart';
import 'package:auryn/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';

class DiscoverTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<List<DiscoverMedia>> chunks = partition(sl.get<TmdbModel>().discoverMedias, 3).toList();

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: chunks.length,
      itemBuilder: (context, position) {
        List<DiscoverMedia> chunk = chunks[position];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: position % 2 == 0 ? VerticalDirection.down : VerticalDirection.up,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: DiscoverTile(discoverMedia: chunk[0]),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DiscoverTile(discoverMedia: chunk.length > 1 ? chunk[1] : null),
                  DiscoverTile(discoverMedia: chunk.length > 2 ? chunk[2] : null)
                ],
              ),
            )
          ],
        );
      }
    );
  }
}
