
import 'package:flutter/material.dart';
import 'package:managing_state_flutter/photo_state.dart';

import 'gallery_page.dart';

void main() {
  runApp(App());
}

const List<String> urls = [
  "https://live.staticflickr.com/65535/50489498856_67fbe52703_b.jpg",
  "https://live.staticflickr.com/65535/50488789068_de551f0ba7_b.jpg",
  "https://live.staticflickr.com/65535/50488789118_247cc6c20a.jpg",
  "https://live.staticflickr.com/65535/50488789168_ff9f1f8809.jpg"
];

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool isTagging = false;
  List<PhotoState> photoStates = List.of(urls.map((item) => PhotoState(item)));

  void toggleTagging(url) {
    setState(() {
      isTagging = !isTagging;
      photoStates.forEach((element) {
        if (isTagging && element.url == url) {
          element.isSelected = true;
        } else {
          element.isSelected = false;
        }
      });
    });
  }

  void onSelectPhoto(String url, bool selected) {
    setState(() {
      photoStates.forEach((element) {
        if (element.url == url) {
          element.isSelected = selected;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home App",
      home: GalleryPage(
          title: "Image Gallery",
          photoStates: photoStates,
          tagging: isTagging,
          toggleTagging: toggleTagging,
          onPhotoSelect: onSelectPhoto
      )
    );
  }
}
