class Product {
  String id;
  String name;
  String desc;

  String imgUrl;
  double price;

  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.imgUrl,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'imgUrl': imgUrl,
      'price': price
    };
  }

  static Product fromMap(Map<String, dynamic> map) {
    return Product(
        id: map['id'],
        name: map['name'],
        desc: map['desc'],
        imgUrl: map['imgUrl'],
        price: map['price']);
  }
}
