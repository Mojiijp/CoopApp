import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/src/config/route/Routes.dart';
import 'package:fruits_and_veggies/src/widgets/elevated_button.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/imagemenu/background.jpg"),
                  fit: BoxFit.cover
              ),
            ),
            child: _logandcreWidget()
          // width: double.infinity,
          //   decoration: const BoxDecoration(
          //         gradient: LinearGradient(
          //           colors: [
          //             Colors.lightGreen,
          //             Colors.lightGreenAccent
          //           ],
          //           begin: Alignment.topCenter,
          //           end: Alignment.bottomCenter,
          //         )
          //     ),
        ),
    );
  }







  // child: ClipPath(
          //   clipper: CustomClipPath(),
          //   child: Container(
          //     color: Colors.red,
          //     child: Center(child: Text("HIHIHI"),),
          //   ),
          // ),

// class CustomClipPath extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     double w = size.width;
//     double h = size.height;
//
//     final path = Path();
//
//     path.moveTo(0, h);
//     path.lineTo(0, h * 0.55);
//     path.quadraticBezierTo(
//       w * 0.5,
//       h,
//       w,
//       h
//     );
//     path.close();
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     throw UnimplementedError();
//   }
//
// }

  Widget _logandcreWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 300),
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
          SizedBox(height: 20,),
          const Text(
              "Fruits and Veggies",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20,),
          const Text(
            "แอปพลิเคชันให้ข้อมูลผัก ผลไม้",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey
            ),
          ),
          SizedBox(height: 120,),
          MyElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.loginPage);
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
          const SizedBox(height: 10,),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              foregroundColor: Color(0xff7dce13) //color text
            ),
            onPressed: () {
              Get.toNamed(Routes.createAccountPage);
            },
            child: const Text('Create an account'),
          ),
        ],
      ),
    );
  }
}
