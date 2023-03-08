// To parse this JSON data, do
//
//     final checkProductModel = checkProductModelFromJson(jsonString);

import 'dart:convert';

CheckProductModel checkProductModelFromJson(String str) => CheckProductModel.fromJson(json.decode(str));

String checkProductModelToJson(CheckProductModel data) => json.encode(data.toJson());

class CheckProductModel {
    CheckProductModel({
        this.totalSize,
        this.typeId,
        this.offset,
        this.products,
    });

    int? totalSize;
    int? typeId;
    int? offset;
    List<Product>? products;

    factory CheckProductModel.fromJson(Map<String, dynamic> json) => CheckProductModel(
        totalSize: json["total_size"],
        typeId: json["type_id"],
        offset: json["offset"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total_size": totalSize,
        "type_id": typeId,
        "offset": offset,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
    };
}

class Product {
    Product({
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

    factory Product.fromJson(Map<String, dynamic> json) => Product(
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
