import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/src/authenication/authenication_repository.dart';
import 'package:fruits_and_veggies/src/config/route/Routes.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //       apiKey: "AIzaSyC0ZijL9OXRZdeXivtSm3D323Yf6P6tdng",
  //       appId: "1:745887772213:android:0e68ad65ed2ad0a4f8cb7c",
  //       messagingSenderId: "745887772213",
  //       projectId: "fruitsandveggiesapp",
  //     ),
  // ).then((value) => Get.put(AuthenticationRepository()));

  await Firebase.initializeApp().then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: Routes.getPageRoutes(),
      initialRoute: "/main",
    );
  }
}
