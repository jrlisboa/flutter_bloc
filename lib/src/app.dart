import 'package:flutter/material.dart';
import 'ui/pages.dart';

class App extends StatelessWidget {
	Widget build(BuildContext context) {
		return MaterialApp(
			theme: ThemeData.dark(),
			home: Scaffold(
				body: Pages()
			),
		);
	}
}
