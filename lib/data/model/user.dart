class Data {
  final User user;

  Data(this.user);

  Data.fromJson(Map<String, dynamic> json) : user = User.fromJson(json['data']);
}

class User {
  String username;
  String? email;
  String phone;
  User(this.username, this.email, this.phone);
  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        email = json['email'],
        phone = json['phone'];
}
