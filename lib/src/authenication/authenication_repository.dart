import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruits_and_veggies/presentation/main/main_page.dart';
import 'package:fruits_and_veggies/src/widgets/buttom_nav_bar.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 3));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitailScreen);
  }

  ////Check Token
  _setInitailScreen(User? user) {
    user == null ? Get.offAll(() => const MainPage()) : Get.offAll(() => const ButtomNavBar());
  }

  ////Store user data
  Future addUserDetails(String username, String email, String password) async {
    await FirebaseFirestore.instance.collection('users').add({
      'username' : username,
      'email' : email,
      'password' : password
    });
  }

  // Stream<String> get onAuthStateChanged =>
  //     _auth.authStateChanges().map(
  //           (User? user) => user!.uid,
  //     );
  //
  // /////Get UID
  // Future<String> getCurrentUID() async {
  //   return _auth.currentUser!.uid;
  // }
  //
  // // GET CURRENT USER
  // Future getCurrentUser() async {
  //   return _auth.currentUser!;
  // }


  //////Create Account
  Future<void> createUserWithEmailAndPassword(String username, String email, String password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      addUserDetails(username, email, password);
      Fluttertoast.showToast(
          msg: "Create an account successful!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
    //เป็นการเช็คเงื่อนไขว่า firebaseUser มี email ของ user ที่สมัครเข้ามาหรือไม่ ถ้ายังมีค้างอยู่ ไม่ได้กดออกจากระบบ เมื่อเปิดแอปมาใหม่จะให้ไปที่หน้าโฮม ไม่ต้องล็อกอินใหม่
      firebaseUser.value != null ? Get.offAll(() => const ButtomNavBar()) : Get.offAll(() => const MainPage());
    }on FirebaseAuthException catch(e) {
      print(e.code);
      String message;
      if(e.code == 'email-already-in-use'){
        message = 'มีอีเมลนี้ในระบบแล้ว โปรดใช้อีเมลอื่นแทน';
      }
      else{
        message = e.message!;
      }
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
      final ex = LoginWithEmailAndPassword.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    }catch(_) {
       const ex = LoginWithEmailAndPassword();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }


  ////Login
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(
          msg: "log in successful!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
      firebaseUser.value != null ? Get.offAll(() => const ButtomNavBar()) : Get.offAll(() => const MainPage());
    }on FirebaseAuthException catch(e) {
      print(e.message);
      String message;
      if(e.message == 'Given String is empty or null'){
        message = 'โปรดระบุอีเมลหรือรหัสผ่านให้ครบถ้วน';
      }
      if(e.message == 'There is no user record corresponding to this identifier. The user may have been deleted.'){
        message = 'ไม่มีอีเมลหรือรหัสผ่านนี้ โปรดตรวจสอบอีเมลหรือรหัสผ่านให้ตรงกับที่ลงทะเบียนไว้';
      }
      else{
        message = e.message!;
      }
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }catch(_) {
      const ex = LoginWithEmailAndPassword();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> logout() async => await _auth.signOut();
}

class LoginWithEmailAndPassword {
  final String message;

  const LoginWithEmailAndPassword([this.message = "An unknown error occurred."]);

  factory LoginWithEmailAndPassword.code(String code) {
    switch(code){
      case 'weak-password' :
        return const LoginWithEmailAndPassword('Please enter a stronger password');
      default :
        return LoginWithEmailAndPassword();
    }
  }
}
