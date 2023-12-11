class UserModel {
  final String id;
  final String userName;
  final String email;
  final String password;

  UserModel({
    required this.email,
    required this.id,
    required this.password,
    required this.userName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      id: json['id'],
      password: json['password'],
      userName: json['userName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'id': id,
      'password': password,
      'userName': userName,
    };
  }
}
