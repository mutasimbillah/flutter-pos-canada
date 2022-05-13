import 'dart:convert';

class Product {
  bool? success;
  String? message;
  Data? data;

  Product({this.success, this.message, this.data});

  Product.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data?.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (data != null) {
      data['data'] = jsonEncode(data);
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? price;
  String? stock;
  String? details;

  Data({this.id, this.name, this.price, this.stock, this.details});

  Data.fromJson(Map<String, dynamic> json) {
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
