import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../ui/movie_list.dart';
import '../ui/detail_page.dart';

class Pages extends StatefulWidget {
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
	String _title;
	String _posterPath;
	String _releaseDate;
	int _id;
	PageController _controller = PageController(initialPage: 0, keepPage: false);

	_callDetail(title, posterPath, releaseDate, id) {
		_controller.animateToPage(
			1,
			duration: Duration(
				milliseconds: 300,
			),
			curve: Curves.easeInOut,
		);
		print(title);
		setState(() {
		  _title = title;
			_posterPath = posterPath;
			_releaseDate = releaseDate;
			_id = id;
		});
	}

	_backToHome() {
		_controller.animateToPage(
			0,
			duration: Duration(
				milliseconds: 300,
			),
			curve: Curves.easeInOut,
		);
	}

	Widget build(BuildContext context) {
		return PageView(
			controller: _controller,
			physics: NeverScrollableScrollPhysics(),
			children: <Widget>[
				MovieList(_callDetail),
				DetailPage(
					_title,
					_posterPath,
					_releaseDate,
					_id,
					_backToHome,
				),
			],
		);
	}
}
