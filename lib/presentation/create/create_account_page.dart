import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruits_and_veggies/src/authenication/authenication_repository.dart';
import 'package:fruits_and_veggies/src/authenication/createacc_controller.dart';
import 'package:fruits_and_veggies/src/config/route/Routes.dart';
import 'package:fruits_and_veggies/src/theme/theme_color.dart';
import 'package:fruits_and_veggies/src/widgets/alredy_have_an_account.dart';
import 'package:fruits_and_veggies/src/widgets/elevated_button.dart';
import 'package:fruits_and_veggies/src/widgets/passwordInput.dart';
import 'package:get/get.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  //GlobalKey<FormState> _key = new GlobalKey();
  
  final controller = Get.put(CreateAccController());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.greenBackground,
        body: SafeArea(
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
            child: Column(
              children: [
                const Text(
                  "Create an account",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: ThemeColor.green
                  ),
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          const SizedBox(height: 50,),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            // child: infoInput(
                            //   label: 'Username',
                            //   icon: Icon(Icons.account_circle_outlined, color: Colors.black),
                            //   enable: true,
                            //   validator: _validateUsername,
                            // ),
                            child: TextFormField(
                              controller: controller.username,
                              validator: _validateUsername,
                              decoration: const InputDecoration(
                                enabled: true,
                                filled: true,
                                fillColor: Color(0xffD9D9D9),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                ),
                                prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.black),
                                labelText: "Username",
                              ),
                            ),
                          ),
                          //SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            // child: infoInput(
                            //   enable: true,
                            //   label: 'Email',
                            //   icon: Icon(Icons.mail_outline, color: Colors.black,),
                            //   validator: _validateEmail,
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
                            padding: const EdgeInsets.all(20.0),
                            child: passwordInput(
                              enable: true,
                              label: 'Password',
                              validator: _validatePassword,
                              initialValue: '',
                            ),
                          ),
                          const SizedBox(height: 50,),
                          MyElevatedButton(
                              onPressed: () {
                                if(_formkey.currentState!.validate()){
                                  CreateAccController.instance.createAccUser(
                                      controller.username.text.trim(),
                                      controller.email.text.trim(),
                                      controller.password.text.trim()
                                  );
                                }
                              },
                              borderRadius: BorderRadius.circular(70),
                              child: const Text(
                                "Crate an account",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                ),
                              )
                          ),
                          const SizedBox(height: 15,),
                          AlredyHaveAnAccountCheck(
                            login: false,
                            press: () {
                              Get.toNamed(Routes.loginPage);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
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
      return 'Please enter password A-Z, a-z, !@#\$&*~, 0-9';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password A-Z, a-z, !@#\$&*~, 0-9';
      } else {
        return null;
      }
    }
  }
}