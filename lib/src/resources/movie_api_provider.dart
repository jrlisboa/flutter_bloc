import 'dart:async';
import 'package:http/http.dart';
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
	Client client = Client();
	final apiKey = 'a0791f8a1f524d5f78230d1153e145e8';

	Future<ItemModel> fetchMoviesList() async {
		final response = await client.get('http://api.themoviedb.org/3/movie/popular?api_key=$apiKey');

		if (response.statusCode == 200) {
			return ItemModel.fromJson(json.decode(response.body));
		} else {
			throw Exception('Failed to load posts!');
		}
	}
}
