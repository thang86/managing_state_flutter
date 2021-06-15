import 'package:flutter/material.dart';

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

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home App",
      home: GalleryPage(title: "Image Gallery", urls: urls),
    );
  }
}
