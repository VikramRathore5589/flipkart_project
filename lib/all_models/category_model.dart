class CategoryItem {
  String name;
  String? imgUrl;

  CategoryItem({
    required this.name,
   this.imgUrl
  });

  Map<String, dynamic> toMapList() {
    return {'name': name, 'ImgUrl': imgUrl};
  }

  static CategoryItem fromMapList(
    Map<String, dynamic> map,
  ) {
    return CategoryItem(
      name: map['name'],
      imgUrl: 'ImgUrl',
    );
  }
}
