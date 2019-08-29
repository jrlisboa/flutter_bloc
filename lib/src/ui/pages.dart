import 'package:flutter/material.dart';
import '../ui/movie_list.dart';
import '../ui/detail_page.dart';

class Pages extends StatefulWidget {
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
	String _title;
	String _posterPath;
	String _releaseDate;
	String _overview;
	int _id;

	_callDetail(context, title, posterPath, releaseDate, overview, id) {
		Navigator.push(
			context,
			MaterialPageRoute(
				builder: (context) {
					return DetailPage(
						_title,
						_posterPath,
						_releaseDate,
						_overview,
						_id,
					);
				},
			),
		);
		print(title);
		setState(() {
		  _title = title;
			_posterPath = posterPath;
			_releaseDate = releaseDate;
			_overview = overview;
			_id = id;
		});
	}

	Widget build(BuildContext context) {
		return MovieList(_callDetail);
	}
}
