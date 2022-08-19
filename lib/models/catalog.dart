class CatalogModel {
  static List<Item> items = [];

  Item getById(int id) => items.firstWhere((element) => element.id == id);
}

class Item {
  final int id;
  final String name;
  final String model;
  final num price;
  final String desc;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.model,
      required this.price,
      required this.desc,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        model: map["model"],
        price: map["price"],
        desc: map["desc"],
        image: map["image"]);
  }
  toMap() => {
        "id": id,
        "name": name,
        "model": model,
        "price": price,
        "desc": desc,
        "image": image,
      };
}
