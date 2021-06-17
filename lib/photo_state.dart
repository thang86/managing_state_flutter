class PhotoState {
  String url;
  bool selected;
  bool display ;
  Set<String> tags ={};

  PhotoState(this.url, {selected = false,this.display= false,tags});
}