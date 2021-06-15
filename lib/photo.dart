import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:managing_state_flutter/main.dart';
import 'package:managing_state_flutter/photo_state.dart';

class Photo extends StatelessWidget {
  PhotoState state;
  bool isSelected = false;

  final Function onLongPress;
  final Function onSelect;

  Photo({this.state, this.isSelected, this.onLongPress, this.onSelect});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      GestureDetector(
        child: Image.network(state.url),
        onLongPress: () => onLongPress(state.url),
      )
    ];
    if (isSelected) {
      children.add(Positioned(
          top: 20,
          left: 20,
          child: Theme(
            data: Theme.of(context)
                .copyWith(unselectedWidgetColor: Colors.redAccent),
            child: Checkbox(
              onChanged: (value) => {onSelect(state.url, value)},
              value: state.isSelected,
              activeColor: Colors.white,
              checkColor: Colors.blue,
            ),
          )));
    }
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: Stack(
          alignment: Alignment.center,
          children: children,
        ));
  }

// @override
// _PhotoState createState() => _PhotoState(url: url);

}

// class _PhotoState extends State<Photo> {
//   String url;
//   int index = 0;
//
//   _PhotoState({this.url});
//
//   _onTab() {
//     setState(() => {index >= urls.length - 1 ? index = 0 : index++});
//     url = urls[index];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(8.0),
//       child: GestureDetector(
//         child: Image.network(url),
//         onTap: _onTab,
//       ),
//     );
//   }
// }
