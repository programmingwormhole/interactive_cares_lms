class UserModel {
  String? username;
  String? fullName;
  String? email;
  String? password;
  String? role; //

  UserModel({
    this.username,
    this.email,
    this.password,
    this.fullName,
    this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'username': username,
      'email': email,
      'password': password,
      'role': role,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      fullName: json['full_name'],
      email: json['email'],
      role: json['role'],
    );
  }
}
