import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/presentation/profile/profile_controller.dart';
import 'package:fruits_and_veggies/src/model/ScanlistModel.dart';
import 'package:fruits_and_veggies/src/model/user_model.dart';
import 'package:fruits_and_veggies/src/theme/theme_color.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'homepage_controller.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///////ดึงข้อมูลมาจาก Firebase Authenticate
  final auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;



  int activeIndex = 0;

  final urlImage = [
    "https://homgroon.com/sites/default/files/2019-10/%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B9%82%E0%B8%A2%E0%B8%8A%E0%B8%99%E0%B9%8C%E0%B8%82%E0%B8%AD%E0%B8%87%E0%B8%9C%E0%B8%B1%E0%B8%81%E0%B8%9C%E0%B8%A5%E0%B9%84%E0%B8%A1%E0%B9%89%205%20%E0%B8%AA%E0%B8%B5.jpg",
    "https://image.makewebeasy.net/makeweb/0/1r5G0moSP/DefaultData/%E0%B9%81%E0%B8%95%E0%B8%87%E0%B8%81%E0%B8%A7%E0%B8%B2_01.jpg",
    "https://www.thailandpostmart.com/files/news_event_editor/20211228100020.png",
    "https://f.btwcdn.com/store-45801/product/a4693feb-c527-1dba-63c7-6033647aa4c0.jpg",
    "https://www.prd.go.th/th/file/get/file/20220819d41d8cd98f00b204e9800998ecf8427e135014.jpg"
  ];



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomepageController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey
                  ),
                ),
              ),
              FutureBuilder(
                future: controller.getUserData(),
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    UserModel userData = snapshot.data as UserModel;
                    return Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        userData.username,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()),);
                  } else {
                    return const Center(child: Text('Something went wrong'));
                  }
                }
              ),
              _buildCarous(),
              Expanded(
                  child: TwoContent()
              )
            ],
        ),
      ),
    );
  }

  //////Picture Scroll
  Widget _buildCarous() {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: urlImage.length,
          options: CarouselOptions(
            height: 350,
            //viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),

          ),
          itemBuilder: (context, index, realIndex) {
            final urlImages = urlImage[index];

            return _buildImage(urlImages, index);
          },
        ),
        // SizedBox(height: 32,),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildImage(String urlImages, int index) {
    return Container(
      margin: const EdgeInsets.only(left: 12, top: 15, bottom: 15, right: 12),
      color: Colors.grey,
      child: Image.network(
        urlImages,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: urlImage.length,
      effect: const SlideEffect(
        activeDotColor: ThemeColor.green,
        dotColor: Colors.grey,
        dotHeight: 13,
        dotWidth: 13
      ),
    );
  }
}

class TwoContent extends StatelessWidget{
  TwoContent({super.key});


  // List<String> listOfUrls = [];
  // List<Widget> listOfPics = [];

  // final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  //
  // ///Scanlist from firebase
  // Future<firebase_storage.ListResult> listFiles() async {
  //   firebase_storage.ListResult results = await storage.ref('file/').listAll();
  //
  //   results.items.forEach((firebase_storage.Reference ref) {
  //     print("Found file : $ref");
  //   });
  //   return results;
  // }


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Latest",
                  style: TextStyle(
                      fontSize: 20,
                      color: ThemeColor.green,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
            _scanList(context),
            //_noScanList(),
          ],
        ),
    );
  }

  Widget _scanList(BuildContext context) {
    final controller = Get.put(HomepageController());
    return FutureBuilder(
      future: controller.getUserData(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          if(snapshot.hasData) {
            ScanlistModel scanlistData = snapshot.data as ScanlistModel;
            return Container(
              child: Text(scanlistData.crateAt),

            );
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

          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()),);
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },

    );
    //   StreamBuilder(
    //   stream: FirebaseFirestore.instance.collection('file').snapshots(),
    //   builder: (context, snapshot) {
    //     ///ยังไม่ได้เรียกใช้ data
    //     if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
    //       return Container(
    //         width: 300,
    //         height: 250,
    //         child: Text("Has data but dont show!!!!!!")
    //       );
    //     }
    //     if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //     ///เลยหลุดมาทำที่ state นี้
    //     //return CircularProgressIndicator();
    //     return Dialog(
    //
    //     );
    //   }
    // );

  }

  Widget _noScanList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 500,
        decoration: BoxDecoration(
            color: const Color(0xfff5f5f5),
            borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  print("Click Icon");
                },
                icon: const Icon(Icons.camera_alt)
            ),
            const Text(
              "ยินดีต้อนรับผู้ที่มาเยือนใหม่ ยังไม่เคยแสกนเลยสิน้า\n ลองมาแสกนกันเถอะ!",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
