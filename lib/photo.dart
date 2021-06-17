import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:managing_state_flutter/main.dart';
import 'package:managing_state_flutter/photo_state.dart';
import 'package:provider/provider.dart';

class Photo extends StatelessWidget {
  final PhotoState state;

  Photo({this.state});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      GestureDetector(
          child: Image.network(state.url),
          onLongPress: () => context.read<AppState>().toggleTagging(state.url))
    ];

    if (context.watch<AppState>().isTagging) {
      children.add(Positioned(
          left: 20,
          top: 0,
          child: Theme(
              data: Theme.of(context)
                  .copyWith(unselectedWidgetColor: Colors.grey[200]),
              child: Checkbox(
                onChanged: (value) {
                  context.read<AppState>().onPhotoSelect(state.url, value);
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
