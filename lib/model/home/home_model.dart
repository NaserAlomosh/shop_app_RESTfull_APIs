class HomeModel {
  bool? status;
  HomeDataModel? data;
  HomeModel.fromJson(Map<String, dynamic> jsonData) {
    status = jsonData['status'];
    data = HomeDataModel.fromJson(jsonData['data']);
  }
}

class HomeDataModel {
  List<dynamic> banners = [];
  List<dynamic> products = [];
  HomeDataModel.fromJson(Map<String, dynamic> jsonData) {
    jsonData['banners'].forEach((element) {
      banners.add(BannersModel.fromJson(element));
    });
    jsonData['products'].forEach((element) {
      products.add(ProductsModel.fromJson(element));
    });
  }
}

class BannersModel {
  int? id;
  String? image;
  BannersModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    image = jsonData['image'];
  }
}

class ProductsModel {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  bool? inFavorites;
  bool? inCart;

  ProductsModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    price = jsonData['price'];
    oldPrice = jsonData['old_price'];
    discount = jsonData['discount'];
    name = jsonData['name'];
    image = jsonData['image'];
    description = jsonData['description'];
    inFavorites = jsonData['in_favorites'];
    inCart = jsonData['in_cart'];
  }
}
