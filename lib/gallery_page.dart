import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:managing_state_flutter/photo.dart';
import 'package:managing_state_flutter/photo_state.dart';

class GalleryPage extends StatelessWidget {
  final String title;
  final List<PhotoState> photoStates;
  final bool tagging;

  final Function toggleTagging;
  final Function onPhotoSelect;

  GalleryPage(
      {this.title,
      this.photoStates,
      this.tagging,
      this.toggleTagging,
      this.onPhotoSelect});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: GridView.count(
        primary: true,
        crossAxisCount: 2,
        children: List.of(photoStates.map((e) => Photo(
              state: e,
              isSelected: tagging,
              onLongPress: toggleTagging,
              onSelect: onPhotoSelect,
            ))),
      ),
    );
  }
}
