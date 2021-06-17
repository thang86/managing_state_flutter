import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:managing_state_flutter/photo.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class GalleryPage extends StatelessWidget {
  final String title;

  GalleryPage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: Consumer<AppState>(
        builder: (context, appState, child) {
          return GridView.count(
              primary: false,
              crossAxisCount: 2,
              children: List.of(appState.photoStates
                  .where((ps) => ps.display ?? true)
                  .map((ps) => Photo(state: ps))));
        },
      ),
      drawer: Drawer(child: Consumer<AppState>(
        builder: (context, appState, child) {
          return ListView(
            children:
                List.of(context.watch<AppState>().tags.map((t) => ListTile(
                      title: Text(t),
                      onTap: () {
                        appState.selectTag(t);
                        Navigator.of(context).pop();
                      },
                    ))),
          );
        },
      )),
    );
  }
}
