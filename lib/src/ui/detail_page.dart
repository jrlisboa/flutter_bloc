import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
	final title;
	final posterPath;
	final releaseDate;
	final id;
	final back;
	DetailPage(this.title, this.posterPath, this.releaseDate, this.id, this.back);
	Widget build(BuildContext context) {
		print('o id e $id lancado em $releaseDate');
		if (title == null) {
			return Container();
		}
		return Scaffold(
			appBar: AppBar(
				actions: <Widget>[
					IconButton(
						icon: Icon(Icons.arrow_back),
						onPressed: () {
							back();
						},
					)
				],
				title: Text(title),
			),
			body: Center(
				child: Hero(
					tag: id,
					child: Image.network(
						'https://image.tmdb.org/t/p/w185${posterPath}',
						fit: BoxFit.cover,
					),
				),
			),
		);
	}
}
