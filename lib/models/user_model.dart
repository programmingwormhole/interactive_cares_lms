class UserModel {
  String? username;
  String? fullName;
  String? email;
  String? password;

  UserModel({
    this.username,
    this.email,
    this.password,
    this.fullName,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name' : fullName,
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
