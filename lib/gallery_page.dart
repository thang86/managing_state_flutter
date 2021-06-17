import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:managing_state_flutter/photo.dart';
import 'package:managing_state_flutter/photo_state.dart';

import 'main.dart';

class GalleryPage extends StatelessWidget {
  final String title;
  final AppState model;

  GalleryPage({this.title, this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: Builder(
        builder: (BuildContext innerContext) {
          return GridView.count(
              primary: false,
              crossAxisCount: 2,
              children: List.of(model.photoStates
                  .where((element) => element.display ?? true)
                  .map((ps) => Photo(
                        state: ps,
                        model: AppState.of(context),
                      ))));
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: List.of(model.tags.map((e) => ListTile(
                title: Text(e),
                onTap: () {
                  model.selectTag(e);
                  Navigator.of(context).pop();
                },
              ))),
        ),
      ),
    );
  }
}
