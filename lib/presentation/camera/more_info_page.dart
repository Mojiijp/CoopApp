import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/presentation/camera/recom_menu_info_page.dart';
import 'package:fruits_and_veggies/src/config/route/Routes.dart';
import 'package:fruits_and_veggies/src/theme/theme_color.dart';
import 'package:fruits_and_veggies/src/widgets/elevated_button.dart';
import 'package:get/get.dart';

class MoreInfoPage extends StatefulWidget {
  const MoreInfoPage({Key? key}) : super(key: key);

  @override
  _MoreInfoPageState createState() => _MoreInfoPageState();
}

class _MoreInfoPageState extends State<MoreInfoPage> {
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
                      ),
                  ),
                ),
              ),
            ),
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
              padding: const EdgeInsets.only(top: 20),
              child: MyElevatedButton(
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
              ),
            ),
          ]
        ),
      )
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
          children: const [
            //ประโยชน์
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "ประโยชน์",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                '''
          1. เลือกแอปเปิลที่ผิวเรียบสวย ไม่มีร่องรอย
        ถลอก ขูดขีด เมื่อกดเบาๆ เนื้อต้องแน่นและ
        มีกลิ่นหอมของแอปเปิ้ล
          2. สังเกตที่ขั้วของผลแอปเปิล จะต้องดูสด 
        ไม่เหี่ยวแห้ง''',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            //การจัดเก็บ
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "คำแนะนำการเลือกซื้อ",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                '''
          1. เลือกแอปเปิลที่ผิวเรียบสวย ไม่มีร่องรอย
        ถลอก ขูดขีด เมื่อกดเบาๆ เนื้อต้องแน่นและ
        มีกลิ่นหอมของแอปเปิ้ล
          2. สังเกตที่ขั้วของผลแอปเปิล จะต้องดูสด 
        ไม่เหี่ยวแห้ง''',
                style: TextStyle(
                    fontSize: 16,
                ),
              ),
            ),
            //การเลือกซื้อ
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "คำแนะนำการจัดเก็บ",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                '''
          1. ใส่ถุงพลาสติก แล้วเจาะรูห่างๆ ก่อนนำไป
        แช่ตู้เย็น
          2. ใส่ถุงกระดาษหรือห่อด้วยหนังสือพิมพ์ก่อน จากนั้นนำแช่ตู้เย็น
          ทั้ง 2 วิธี ควรไม่ให้ผิวแอปเปิ้ลแต่ละลูกสัมผัสกัน เพราะจะช่วยให้เก็บให้นานขึ้น''',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
