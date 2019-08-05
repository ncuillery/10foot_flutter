import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

import '../entities/discover_media.dart';

class TmdbModel {
  final Uri _discoverEndPoint = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '3/discover/movie',
      queryParameters: {
        'api_key': DotEnv().env['tmdb_token'],
        'with_original_language': 'en'
      }
  );

  final List<DiscoverMedia> discoverMedias = [];

  Future<List<DiscoverMedia>> fetchDiscoverMedias() async {
    final Response response = await get(_discoverEndPoint);

    if (response.statusCode != 200) {
      throw Exception('Failed to load medias');
    }

    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    final List<dynamic> results = jsonResponse['results'];
    final List<DiscoverMedia> medias = results.map((item) => DiscoverMedia.fromJson(item)).toList();

    this.discoverMedias.addAll(medias);

    return medias;
  }
}
