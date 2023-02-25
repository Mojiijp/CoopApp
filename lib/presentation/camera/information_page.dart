import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/presentation/camera/more_info_page.dart';
import 'package:fruits_and_veggies/presentation/camera/recom_menu_info_page.dart';
import 'package:fruits_and_veggies/src/config/route/Routes.dart';
import 'package:fruits_and_veggies/src/theme/theme_color.dart';
import 'package:fruits_and_veggies/src/widgets/elevated_button.dart';
import 'package:get/get.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  Map<int, File> imageFileMap = {};
  File? imageFile;

  dynamic argumentData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  width: 320,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.greenAccent,
                    image: DecorationImage(
                      image: Get.arguments["image"],
                      //NetworkImage("https://i.guim.co.uk/img/media/d8c01173e11f0142e35509512402bc975f107fb7/0_375_5000_3000/master/5000.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=f0bfd5038698f3fce2e1443e3be92f3a"),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              ),
            ),
            // Center(
            //   // child: Padding(
            //   //   padding: const EdgeInsets.only(top: 40),
            //   //   child: Container(
            //   //     width: 320,
            //   //     height: 250,
            //   //     decoration: BoxDecoration(
            //   //       borderRadius: BorderRadius.circular(20),
            //   //       color: Colors.greenAccent,
            //   //       image: const DecorationImage(
            //   //         image: NetworkImage("https://i.guim.co.uk/img/media/d8c01173e11f0142e35509512402bc975f107fb7/0_375_5000_3000/master/5000.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=f0bfd5038698f3fce2e1443e3be92f3a"),
            //   //         fit: BoxFit.cover
            //   //       )
            //   //     ),
            //   //   ),
            //   // ),
            // ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                Get.arguments["name"],
                //"Orange",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ThemeColor.green
                ),
              ),
            ),
            _infoScroll(),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: InkWell(
                  child: const Text(
                    "อ่านข้อมูลเพิ่มเติม",
                    style: TextStyle(
                      fontSize: 16,
                      color: ThemeColor.green
                    ),
                  ),
                  onTap: () {
                    Get.to(
                      () => MoreInfoPage(),
                      arguments: Get.arguments,
                    );
                    //Get.toNamed(Routes.moreInfoPage);
                  },
                ),
              ),
            ),
            MyElevatedButton(
              onPressed: () {
                Get.to(
                      () => RecomMenuInfoPage(),
                  arguments: Get.arguments,
                );
                //Get.toNamed(Routes.recomInfoPage);
              },
              borderRadius: BorderRadius.circular(70),
              child: const Text(
                "เมนูแนะนำ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _infoScroll() {
    return Container(
      width: 350,
      height: 340,
      color: const Color(0xffF5F5F5),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Center(
                child: Text(
                  "คุณค่าทางโภชนาการต่อ 100 กรัม",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "47 กิโลแคลอรี",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "คาร์โบไฮเดรต",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "11.75 กรัม",
                    style: TextStyle(
                        fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "น้ำตาล",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "9.35 กรัม",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "ไขมัน",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "0.12 กรัม",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "โปรตีน",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "0.94 กรัม",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "วิตามิน",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "Vitamin A",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "11 ไมโครกรัม",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "Vitamin B6",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "0.06 มิลลิกรัม",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "Vitamin C",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "53.2 มิลลิกรัม",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "Vitamin E",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "0.18 มิลลิกรัม",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "Vitamin A",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "11 ไมโครกรัม",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "Vitamin B6",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "0.06 มิลลิกรัม",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "Vitamin C",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "53.2 มิลลิกรัม",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "Vitamin E",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "0.18 มิลลิกรัม",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

