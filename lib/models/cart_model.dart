class CartModel {
  int? id;
  String? name;
  int? price;
  int? stars;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;




  CartModel(
      {this.id,
      this.name,
      this.price,
      this.stars,
      this.img,
      this.quantity,
      this.isExist,
      this.time
  
      });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
   
  }

  
}