class LoginModel {
  bool status;
  String message;
  UserDate date;

  LoginModel({this.status, this.message, this.date});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    date = json['date'] != null ? UserDate.fromJson(json['date']) : null;
  }
}

class UserDate {
  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  int token;
  //
  // UserDate(
  //     {this.id,
  //     this.name,
  //     this.email,
  //     this.phone,
  //     this.image,
  //     this.points,
  //     this.token});

  UserDate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    points = json['points'];
    token = json['token'];
  }
}
