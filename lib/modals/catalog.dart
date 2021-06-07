class CatalogItem {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  CatalogItem({
    this.id,
    this.name,
    this.desc,
    this.price,
    this.color,
    this.image,
  });

  factory CatalogItem.fromMap(Map<String, dynamic> map) {
    return CatalogItem(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}

class CatalogModel {
  static final catModel = CatalogModel._internal();
  CatalogModel._internal();
  factory CatalogModel() => catModel;

  static List<CatalogItem> items;
  //  = [
  //   CatalogItem(
  //     id: 1,
  //     name: "Iphone 12Pro",
  //     desc: "Apple iphone 12th generation",
  //     price: 999,
  //     color: "#35505A",
  //     image: "assets/images/watch.jpg",
  //   ),
  // ];

  //Get Item By Id
  CatalogItem getById(int id) =>
      items.firstWhere((el) => el.id == id, orElse: null);
}
