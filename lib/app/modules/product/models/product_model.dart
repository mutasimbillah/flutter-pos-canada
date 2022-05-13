class Product {
  int? id;
  String? name;
  String? price;
  String? stock;
  String? details;

  Product({this.id, this.name, this.price, this.stock, this.details});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    stock = json['stock'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['stock'] = stock;
    data['details'] = details;
    return data;
  }
}
