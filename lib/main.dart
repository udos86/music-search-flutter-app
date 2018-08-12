import 'package:flutter/material.dart';
import 'package:music_search_flutter_app/view/home-page.dart';

void main() => runApp(AppRoot());

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Music Search',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(title: 'Flutter Music Search'),
    );
  }
}
