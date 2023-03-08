// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

Product productModelFromJson(String str) => Product.fromJson(json.decode(str));

String productModelToJson(Product data) => json.encode(data.toJson());

class Product {
    Product({
       required totalSize,
        required typeId,
        required offset,
        required products,
    }){
      this._totalSize=totalSize;
      this._typeId=typeId;
      this._offset=offset;
      this._products=products;
    }

    int? _totalSize;
    int? _typeId;
    int? _offset;
  late  List<ProductsModel> _products;
  List<ProductsModel> get products =>_products;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        totalSize: json["total_size"],
        typeId: json["type_id"],
        offset: json["offset"],
        products: List<ProductsModel>.from(json["products"].map((x) => ProductsModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total_size": _totalSize,
        "type_id": _typeId,
        "offset": _offset,
        "products": List<dynamic>.from(_products.map((x) => x.toJson())),
    };
}

class ProductsModel {
    ProductsModel({
        this.id,
        this.name,
        this.description,
        this.price,
        this.stars,
        this.img,
        this.location,
        this.createdAt,
        this.updatedAt,
        this.typeId,
    });

    int? id;
    String? name;
    String? description;
    int? price;
    int? stars;
    String? img;
    String? location;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? typeId;

    factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stars: json["stars"],
        img: json["img"],
        location: json["location"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        typeId: json["type_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stars": stars,
        "img": img,
        "location": location,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "type_id": typeId,
    };
}
