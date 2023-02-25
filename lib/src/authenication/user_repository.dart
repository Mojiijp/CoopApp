import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_and_veggies/src/model/user_model.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final _user = FirebaseFirestore.instance;

  crateUser(UserModel user) async {
    await _user.collection('users').add(user.toJson()).whenComplete(() {
      Get.snackbar(
        "Success",
        "You account has been create."
      );
    }).catchError((error, stackTrace) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try again."
      );
      print("Error - $error");
    });
  }

  ////Fetch all User or User details
  Future<UserModel> getUserDetails(String email) async {
    final snapshot = await _user.collection("users").where("email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUser(String email) async {
    final snapshot = await _user.collection("users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

}