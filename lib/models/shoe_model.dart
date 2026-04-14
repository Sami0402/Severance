class ShoeModel {
  bool? success;
  List<Data>? data;

  ShoeModel({this.success, this.data});

  ShoeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  int? id;
  String? name;
  String? category;
  String? brand;
  int? price;
  String? image;
  String? title;
  String? description;
  List<Sizes>? sizes;
  int? iV;

  Data(
      {this.sId,
      this.id,
      this.name,
      this.category,
      this.brand,
      this.price,
      this.image,
      this.title,
      this.description,
      this.sizes,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    name = json['name'];
    category = json['category'];
    brand = json['brand'];
    price = json['price'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(new Sizes.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['brand'] = this.brand;
    data['price'] = this.price;
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.sizes != null) {
      data['sizes'] = this.sizes!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Sizes {
  String? size;
  bool? isSelected;
  String? sId;

  Sizes({this.size, this.isSelected, this.sId});

  Sizes.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    isSelected = json['isSelected'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    data['isSelected'] = this.isSelected;
    data['_id'] = this.sId;
    return data;
  }
}
