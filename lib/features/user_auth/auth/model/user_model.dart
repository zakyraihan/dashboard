class UserModel {
  final String id;
  final String uid;
  final String token;
  final String accesToken;
  final String userName;
  final String email;
  final String password;
  final String photoUrl;
  final DateTime createdAt;

  UserModel({
    required this.email,
    required this.id,
    required this.uid,
    required this.token,
    required this.accesToken,
    required this.password,
    required this.userName,
    required this.photoUrl,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      id: json['id'],
      uid: json['uid'],
      accesToken: json['accesToken'],
      token: json['token'],
      password: json['password'],
      userName: json['userName'],
      photoUrl: json['photoUrl'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'id': id,
      'uid': uid,
      'token': token,
      'accesToken': accesToken,
      'password': password,
      'photoUrl': photoUrl,
      'userName': userName,
      'createdAt': createdAt,
    };
  }
}
