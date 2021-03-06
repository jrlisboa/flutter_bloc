import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/movies_bloc.dart';

class MovieList extends StatelessWidget {
	final callDetail;
	MovieList(this.callDetail);

	Widget build(BuildContext context) {
		bloc.fetchAllMovies();
		return Scaffold(
			appBar: AppBar(
				title: Text('Popular Movies'),
			),
			body: StreamBuilder(
				stream: bloc.allMovies,
				builder: (context, AsyncSnapshot<ItemModel> snapshot) {
					if (snapshot.hasData) {
						return buildList(snapshot);
					} else if (snapshot.hasError) {
						return Text(snapshot.error.toString());
					}
					return Center(
						child: CircularProgressIndicator(),
					);
				},
			),
		);
	}

	Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
		return GridView.builder(
			itemCount: snapshot.data.results.length,
			gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
				crossAxisCount: 2,
			),
			itemBuilder: (BuildContext context, int index) {
				return Hero(
					tag: snapshot.data.results[index].id,
					child: Material(
						child: InkWell(
								onTap: () {
								print('tapped');
								callDetail(
									context,
									snapshot.data.results[index].title,
									snapshot.data.results[index].posterPath,
									snapshot.data.results[index].releaseDate,
									snapshot.data.results[index].overview,
									snapshot.data.results[index].id,
								);
							},
							child: Image.network(
								'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
								fit: BoxFit.cover,
							),
						),
					)
				);
			},
		);
	}
}
