import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:managing_state_flutter/photo.dart';

class GalleryPage extends StatelessWidget {
  final String title;
  final List<String> urls;

  GalleryPage({this.title, this.urls});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: GridView.count(
        primary: true,
        crossAxisCount: 2,
        children: List.of(urls.map((e) => Photo(url: e))),
      ),
    );
  }
}