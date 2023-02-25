import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/src/authenication/createacc_controller.dart';
import 'package:fruits_and_veggies/src/config/route/Routes.dart';
import 'package:fruits_and_veggies/src/theme/theme_color.dart';
import 'package:fruits_and_veggies/src/widgets/alredy_have_an_account.dart';
import 'package:fruits_and_veggies/src/widgets/elevated_button.dart';
import 'package:fruits_and_veggies/src/widgets/info_input.dart';
import 'package:fruits_and_veggies/src/widgets/passwordInput.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final controller = Get.put(CreateAccController());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.greenBackground,
        body: SafeArea(
          child: Form(
            key: _formkey,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.only(top: 100),
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    children: [
                      const Text(
                        "Log in",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: ThemeColor.green
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 50,),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        // child: infoInput(
                        //   enable: true,
                        //   label: 'Email',
                        //   icon: Icon(Icons.email, color: Colors.black,),
                        //   validator: _validateUsername,
                        // ),
                        child: TextFormField(
                          controller: controller.email,
                          validator: _validateEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            enabled: true,
                            filled: true,
                            fillColor: Color(0xffD9D9D9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                            ),
                            prefixIcon: Icon(Icons.email, color: Colors.black),
                            labelText: "Email",
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: passwordInput(
                          enable: true,
                          label: 'password',
                          validator: _validatePassword,
                          initialValue: '',
                        ),
                      ),
                      //SizedBox(height: 5,),
                      // const Padding(
                      //   padding: EdgeInsets.all(20.0),
                      //   child: infoInput(
                      //     label: 'Password',
                      //     icon: Icon(Icons.lock),
                      //   ),
                      // ),
                      const SizedBox(height: 120,),
                      MyElevatedButton(
                          onPressed: () async {
                            if(_formkey.currentState!.validate()){
                              CreateAccController.instance.loginAccUser(
                                  controller.email.text.trim(),
                                  controller.password.text.trim()
                              );
                              //Get.toNamed(Routes.bottomNavBarPage);
                            }
                          },
                          borderRadius: BorderRadius.circular(70),
                          child: const Text(
                            "Log in",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.white
                            ),
                          )
                      ),
                      const SizedBox(height: 15,),
                      AlredyHaveAnAccountCheck(
                        press: () {
                          Get.toNamed(Routes.createAccountPage);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
    // return FutureBuilder(
    //   future: firebase,
    //   builder: (context, snapshot) {
    //     if(snapshot.hasError){
    //       return Scaffold(
    //         appBar: AppBar(title: Text("Error"),),
    //         body: Center(child: Text("${snapshot.error}"),),
    //       );
    //     }
    //     ///ไม่มีข้อผิดพลาด
    //     if(snapshot.connectionState == ConnectionState.done){
    //       // return Scaffold(
    //       //     backgroundColor: ThemeColor.greenBackground,
    //       //     body: SafeArea(
    //       //       child: Container(
    //       //         width: double.infinity,
    //       //         height: double.infinity,
    //       //         margin: const EdgeInsets.only(top: 100),
    //       //         padding: const EdgeInsets.all(20),
    //       //         decoration: const BoxDecoration(
    //       //           borderRadius: BorderRadius.only(
    //       //             topLeft: Radius.circular(100),
    //       //             topRight: Radius.circular(100),
    //       //           ),
    //       //           color: Colors.white,
    //       //         ),
    //       //         child: SingleChildScrollView(
    //       //           child: Form(
    //       //             child: Column(
    //       //               children: [
    //       //                 const Text(
    //       //                   "Log in",
    //       //                   style: TextStyle(
    //       //                       fontSize: 32,
    //       //                       fontWeight: FontWeight.bold,
    //       //                       color: ThemeColor.green
    //       //                   ),
    //       //                   textAlign: TextAlign.center,
    //       //                 ),
    //       //                 const SizedBox(height: 50,),
    //       //                 Padding(
    //       //                   padding: EdgeInsets.all(20.0),
    //       //                   child: infoInput(
    //       //                     enable: true,
    //       //                     label: 'Email',
    //       //                     icon: Icon(Icons.account_circle_outlined, color: Colors.black,),
    //       //                     validator: _validateUsername,
    //       //                   ),
    //       //                 ),
    //       //                 Padding(
    //       //                   padding: EdgeInsets.all(20.0),
    //       //                   child: passwordInput(
    //       //                     enable: true,
    //       //                     label: 'password',
    //       //                     validator: _validatePassword,
    //       //                   ),
    //       //                 ),
    //       //                 //SizedBox(height: 5,),
    //       //                 // const Padding(
    //       //                 //   padding: EdgeInsets.all(20.0),
    //       //                 //   child: infoInput(
    //       //                 //     label: 'Password',
    //       //                 //     icon: Icon(Icons.lock),
    //       //                 //   ),
    //       //                 // ),
    //       //                 const SizedBox(height: 120,),
    //       //                 MyElevatedButton(
    //       //                     onPressed: () {
    //       //                       Get.toNamed(Routes.bottomNavBarPage);
    //       //                     },
    //       //                     borderRadius: BorderRadius.circular(70),
    //       //                     child: const Text(
    //       //                       "Log in",
    //       //                       textAlign: TextAlign.center,
    //       //                       style: TextStyle(
    //       //                           fontSize: 32,
    //       //                           color: Colors.white
    //       //                       ),
    //       //                     )
    //       //                 ),
    //       //                 const SizedBox(height: 15,),
    //       //                 AlredyHaveAnAccountCheck(
    //       //                   press: () {
    //       //                     Get.toNamed(Routes.createAccountPage);
    //       //                   },
    //       //                 )
    //       //               ],
    //       //             ),
    //       //           ),
    //       //         ),
    //       //       ),
    //       //     )
    //       // );
    //     }
    //     return Scaffold(
    //       body: Center(child: CircularProgressIndicator()),
    //     );
    // });
  }

  String? _validateUsername(String? value) {
    if(value!.isEmpty) {
      return 'Please enter username';
    } else if(value.length < 3){
      return 'Username is too short';
    } else {
      return null;
    }
  }

  String? _validateEmail(String? value) {
    RegExp regex =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if(value!.isEmpty) {
      return 'Please enter email';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid email';
      } else {
        return null;
      }
    }
  }

  String? _validatePassword(String? value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }
}