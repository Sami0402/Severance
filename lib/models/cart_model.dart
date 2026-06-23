class CartModel {
  String? message;
  List<Cart>? cart;

  CartModel({this.message, this.cart});

  CartModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['cart'] != null) {
      cart = <Cart>[];
      json['cart'].forEach((v) {
        cart!.add(new Cart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.cart != null) {
      data['cart'] = this.cart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cart {
  int? id;
  String? name;
  String? image;
  String? category;
  int? price;
  int? quantity;
  String? selectedSize;
  String? sId;

  Cart(
      {this.id,
      this.name,
      this.image,
      this.category,
      this.price,
      this.quantity,
      this.selectedSize,
      this.sId});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    category = json['category'];
    price = json['price'];
    quantity = json['quantity'];
    selectedSize = json['selectedSize'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['category'] = this.category;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['selectedSize'] = this.selectedSize;
    data['_id'] = this.sId;
    return data;
  }
}
