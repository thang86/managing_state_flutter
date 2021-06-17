import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'gallery_page.dart';
import 'photo_state.dart';

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
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppState>(
        model: AppState(),
        child: MaterialApp(
          title: 'Photo Viewer',
          home: ScopedModelDescendant<AppState>(
            builder: (context, child, model) {
              return GalleryPage(
                  title: "Image Gallery",
                  model: model
              );
            },
          ),
        )
    );
  }
}

class AppState extends Model {
  bool isTagging = false;
  List<PhotoState> photoStates = List.of(urls.map((url) => PhotoState(url)));

  Set<String> tags = {'all', 'nature', 'cat'};

  static AppState of(BuildContext context) {
   return ScopedModel.of<AppState>(context);
  }

  void selectTag(String tag) {
    if (isTagging) {
      if (tag != "all") {
        photoStates.forEach((element) {
          if (element.selected) {
            element.tags.add(tag);
          }
        });
      }
      toggleTagging(null);
    } else {
      photoStates.forEach((element) {
        element.display = tag == "all" ? true : element.tags.contains(tag);
      });
    }
    notifyListeners();
  }

  void toggleTagging(String url) {
    isTagging = !isTagging;
    photoStates.forEach((element) {
      if (isTagging && element.url == url) {
        element.selected = true;
      } else {
        element.selected = false;
      }
    });
    notifyListeners();
  }

  void onPhotoSelect(String url, bool selected) {
    photoStates.forEach((element) {
      if (element.url == url) {
        element.selected = selected;
      }
    });
    notifyListeners();
  }

}
