
import 'package:flutter/cupertino.dart';

class Photo extends StatelessWidget {
  String url;

  Photo({this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10), child: Image.network(url));
  }
}