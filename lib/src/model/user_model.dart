import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String username;
  final String email;
  final String password;

  const UserModel({
    required this.username,
    required this.email,
    required this.password
  });

  toJson() {
    return {
      "username" : username,
      "email" : email,
      "password" : password
    };
  }

  /////Map user fetch from firebase
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel (
      username : data["username"],
      email: data["email"],
      password: data["password"]
    );
  }
}