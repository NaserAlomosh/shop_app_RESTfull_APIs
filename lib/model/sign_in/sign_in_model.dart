class SignInModel {
  bool? status;
  String? message;
  UserData? data;

  SignInModel.fromJson(Map<String, dynamic> jsonData) {
    status = jsonData['status'];
    message = jsonData['message'];
    data =
        jsonData['data'] != null ? UserData.fromJson(jsonData['data']) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;

  UserData.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    name = jsonData['name'];
    email = jsonData['email'];
    phone = jsonData['phone'];
    image = jsonData['image'];
    token = jsonData['token'];
  }
}
