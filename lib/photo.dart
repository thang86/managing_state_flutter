import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:managing_state_flutter/main.dart';
import 'package:managing_state_flutter/photo_state.dart';

class Photo extends StatelessWidget {
  final PhotoState state;
  final AppState model;

  Photo({this.state, this.model});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      GestureDetector(
          child: Image.network(state.url),
          onLongPress: () => model.toggleTagging(state.url))
    ];

    if (model.isTagging) {
      children.add(Positioned(
          left: 20,
          top: 0,
          child: Theme(
              data: Theme.of(context)
                  .copyWith(unselectedWidgetColor: Colors.grey[200]),
              child: Checkbox(
                onChanged: (value) {
                  model.onPhotoSelect(state.url, value);
                },
                value: state.selected,
                activeColor: Colors.white,
                checkColor: Colors.black,
              ))));
    }

    return Container(
        padding: EdgeInsets.only(top: 10),
        child: Stack(alignment: Alignment.center, children: children));
  }
}
