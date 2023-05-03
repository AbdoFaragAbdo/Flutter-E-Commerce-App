class UserModel {
  String? userId, email, name, pic;
  UserModel({this.userId, this.email, this.name, this.pic});
  UserModel.fromjson(Map<dynamic, dynamic> map) {
    if (Map == null) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
  }
  tojson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
    };
  }
}
