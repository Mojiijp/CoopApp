import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/src/authenication/authenication_repository.dart';
import 'package:fruits_and_veggies/src/widgets/passwordInput.dart';
import 'package:get/get.dart';

class CreateAccController extends GetxController {
  static CreateAccController get instance => Get.find();

  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  ////Store user data
  Future addUserDetails(String username, String email, String password) async {
    await FirebaseFirestore.instance.collection('users').add({
      'username' : username,
      'email' : email,
      'password' : password
    });
  }

  void createAccUser(String username, String email, String password) {
    ///Get.put(AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password));
    AuthenticationRepository.instance.createUserWithEmailAndPassword(username, email, password);
  }

  void loginAccUser(String email, String password) {
    AuthenticationRepository.instance.loginWithEmailAndPassword(email, password);
  }

}