import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/presentation/profile/profile_controller.dart';
import 'package:fruits_and_veggies/src/authenication/authenication_repository.dart';
import 'package:fruits_and_veggies/src/model/user_model.dart';
import 'package:fruits_and_veggies/src/theme/theme_color.dart';
import 'package:fruits_and_veggies/src/widgets/info_input.dart';
import 'package:fruits_and_veggies/src/widgets/passwordInput.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  ///firebase
  final auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
        backgroundColor: ThemeColor.greenBackground,
        body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.only(top: 80),
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
                color: Colors.white,
              ),
              // child: Column(
              //   children: [
              //     SizedBox(height: 7),
              //     Stack(
              //       children: [
              //         const CircleAvatar(
              //           backgroundImage: NetworkImage("https://highlandcanine.com/wp-content/uploads/2021/03/pomeranian-running-and-happy.jpg"),
              //           radius: 100,
              //         ),
              //         Positioned(
              //           //left: 180,
              //           child: IconButton(
              //             onPressed: () {},
              //             icon: Icon(Icons.edit_outlined), iconSize: 30,),
              //         ),
              //       ],
              //     ),
              //     SizedBox(height: 10,),
              //     Padding(
              //       padding: EdgeInsets.all(10.0),
              //       child: infoInput(
              //         //initialValue: userData.username,
              //         enable: false,
              //         label: user.displayName!,
              //         icon: Icon(Icons.account_circle_outlined),
              //         validator: _validateUsername,
              //       ),
              //     ),
              //     Padding(
              //       padding: EdgeInsets.all(10.0),
              //       child: infoInput(
              //         //initialValue: userData.email,
              //         enable: false,
              //         label: user.email!,
              //         //label: user.email!,
              //         icon: Icon(Icons.email_outlined),
              //         validator: _validateEmail,
              //       ),
              //     ),
              //     Padding(
              //       padding: EdgeInsets.only(top: 10),
              //       child: passwordInput(
              //         enable: false,
              //         label: 'password',
              //         validator: _validatePassword,
              //         //initialValue: userData.password!,
              //       ),
              //     ),
              //     TextButton(
              //         onPressed: () {},
              //         child: const Text(
              //           "Reset password",
              //           style: TextStyle(
              //               color: ThemeColor.green
              //           ),
              //         )
              //     ),
              //     ButtonLogout(
              //         onPressed: () {
              //           Get.find<AuthenticationRepository>().logout();
              //           AuthenticationRepository.instance.logout();
              //           //Get.toNamed(Routes.mainPage);
              //         },
              //         borderRadius: BorderRadius.circular(70),
              //         child: const Text(
              //           "Log out",
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //               fontSize: 32,
              //               color: Colors.white
              //           ),
              //         )
              //     ),
              //   ],
              // ),
              child: FutureBuilder(
                future: controller.getUserData(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done) {
                    if(snapshot.hasData) {
                      UserModel userData = snapshot.data as UserModel;
                      return Form(
                        child: Column(
                          children: [
                            SizedBox(height: 7),
                            Stack(
                              children: [
                                const CircleAvatar(
                                  backgroundImage: NetworkImage("https://highlandcanine.com/wp-content/uploads/2021/03/pomeranian-running-and-happy.jpg"),
                                  radius: 100,
                                ),
                                Positioned(
                                  //left: 180,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.edit_outlined), iconSize: 30,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: infoInput(
                                initialValue: userData.username,
                                enable: false,
                                //label: userData.username!,
                                label: 'username',
                                icon: Icon(Icons.account_circle_outlined),
                                validator: _validateUsername,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: infoInput(
                                initialValue: userData.email,
                                enable: false,
                                label: 'email',
                                //label: userData.email!,
                                //label: user.email!,
                                icon: Icon(Icons.email_outlined),
                                validator: _validateEmail,
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(top: 10),
                            //   child: passwordInput(
                            //     enable: false,
                            //     label: userData.password,
                            //     validator: _validatePassword,
                            //     initialValue: userData.password,
                            //   ),
                            // ),
                            // TextButton(
                            //     onPressed: () {},
                            //     child: const Text(
                            //       "Reset password",
                            //       style: TextStyle(
                            //           color: ThemeColor.green
                            //       ),
                            //     )
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: ButtonLogout(
                                  onPressed: () {
                                    Get.find<AuthenticationRepository>().logout();
                                    AuthenticationRepository.instance.logout();
                                    //Get.toNamed(Routes.mainPage);
                                  },
                                  borderRadius: BorderRadius.circular(70),
                                  child: const Text(
                                    "Log out",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 32,
                                        color: Colors.white
                                    ),
                                  )
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()),);
                    } else {
                      return const Center(child: Text('Something went wrong'));
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                },

              ),
            )
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
    if(value!.isEmpty) {
      return 'Please enter email';
    }
  }

  String? _validatePassword(String? value) {
    if(value!.isEmpty) {
      return 'Please enter password more than 6 character';
    } else if(value.length < 6){
      return 'Password is too short';
    } else {
      return null;
    }
  }
}

class ButtonLogout extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const ButtonLogout({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width = 205,
    this.height = 70.0,
    this.gradient = const LinearGradient(colors: [Color(0xffff6e6e), Color(0xffff0000)]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}
