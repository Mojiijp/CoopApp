import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/controller/controller_menu.dart';
import 'package:fruits_and_veggies/menu_item.dart';
import 'package:fruits_and_veggies/presentation/menu/recipe_page.dart';
import 'package:fruits_and_veggies/src/config/route/Routes.dart';
import 'package:fruits_and_veggies/src/model/menu.dart';
import 'package:fruits_and_veggies/src/theme/theme_color.dart';
import 'package:get/get.dart';

class RecomMenuInfoPage extends StatelessWidget {
  RecomMenuInfoPage({Key? key}) : super(key: key);

  bool _isSelected = true;
  List menu_list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "เมนูแนะนำที่ตรงกันกับ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                  ),
                ),
                Text(
                  Get.arguments["name"],
                  //"แอปเปิ้ล",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: ThemeColor.green
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: double.infinity,
                height: 650,
                color: const Color(0xffF5F5F5),
                child: _ListTile(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Container(
                  //   width: 150,
                  //   height: 45,
                  //   decoration: BoxDecoration(
                  //     gradient: const LinearGradient(
                  //         colors: [ThemeColor.greenAccent, ThemeColor.green]),
                  //     borderRadius: BorderRadius.circular(70),
                  //   ),
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Colors.transparent,
                  //       shadowColor: Colors.transparent,
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(70)),
                  //     ),
                  //     child: const Text(
                  //       "All menu",
                  //       style: TextStyle(
                  //           fontSize: 24,
                  //           fontWeight: FontWeight.bold
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    width: 170,
                    height: 45,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [ThemeColor.greenAccent, ThemeColor.green]),
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.bottomNavBarPage);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(70)),
                      ),
                      child: const Text(
                        "กลับหน้าหลัก",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _ListTile() {
    return
    //   Container(
    //   padding: const EdgeInsets.only(left: 5, right: 5),
    //   child: (
    //     GetBuilder<ControllerMenu>(
    //         builder: (controller) {
    //           if(controller.menuList.isNotEmpty) {
    //             return ListView(
    //               children: controller.menuList
    //                   .where((element) => controller.getSelectedMenu()?.nameEng == element.category)
    //                   .map((menu) => MenuItem(
    //                   menu: menu
    //                 )
    //               )
    //             );
    //           }
    //           return SizedBox();
    //         }
    //     )
    //   )
    // );
      ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 5, right: 5),
      children: [
        Card(
          color: Colors.white,
          child: ListTile(
            leading: Container(
              width: 90,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://herbsandflour.com/wp-content/uploads/2021/12/Pork-Tenderloin-with-Apples-Onions.jpg"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            title: const Text(
              "Pan-Seared Pork Tenderloin With Apples",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: const Text(
                "(สันในหมูผัดแอปเปิ้ล)\n172 กิโลแคลรี"
            ),
            isThreeLine: true,
            trailing: IconButton(
              //icon: Icon(Icons.favorite),
              icon: _isSelected ? const Icon(Icons.save_outlined) :
              const Icon(Icons.save, color: Colors.red),
              onPressed: () {  },
            ),
            //Icon(Icons.favorite, color: Colors.red,),
            onTap: () {
              Get.toNamed(Routes.recipePage);
            },
          ),

        ),
        Card(
          color: Colors.white,
          child: ListTile(
            leading: Container(
              width: 90,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://www.momontimeout.com/wp-content/uploads/2021/08/snickers-apple-salad-square.jpeg"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            //Image.network("https://www.marketofchoice.com/wp-content/uploads/2020/12/Seared-Pork-Tenderloin-1200X925.jpg"),
            title: const Text(
              "Apple salad",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: const Text(
                "(สลัดแอปเปิ้ล)\n\n172 กิโลแคลรี"
            ),
            isThreeLine: true,
            trailing: const Icon(Icons.favorite, color: Colors.red,),
            onTap: () {
              Get.toNamed(Routes.recipePage);
            },
          ),

        ),
        Card(
          color: Colors.white,
          child: ListTile(
            leading: Container(
              width: 90,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://www.ambitiouskitchen.com/wp-content/uploads/2019/09/applepancakes-6.jpg"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            //Image.network("https://www.marketofchoice.com/wp-content/uploads/2020/12/Seared-Pork-Tenderloin-1200X925.jpg"),
            title: const Text(
              "Apple pancakes",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: const Text(
                "(แพนเค้กแอปเปิ้ล)\n\n172 กิโลแคลรี"
            ),
            isThreeLine: true,
            trailing: const Icon(Icons.favorite, color: Colors.red,),
            onTap: () {
              Get.toNamed(Routes.recipePage);
            },
          ),

        ),
        Card(
          color: Colors.white,
          child: ListTile(
            leading: Container(
              width: 90,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://herbsandflour.com/wp-content/uploads/2021/12/Pork-Tenderloin-with-Apples-Onions.jpg"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            //Image.network("https://www.marketofchoice.com/wp-content/uploads/2020/12/Seared-Pork-Tenderloin-1200X925.jpg"),
            title: const Text(
              "Pan-Seared Pork Tenderloin With Apples",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: const Text(
                "(สันในหมูผัดแอปเปิ้ล)\n172 กิโลแคลรี"
            ),
            isThreeLine: true,
            trailing: const Icon(Icons.save, color: Colors.red,),
            onTap: () {
              Get.toNamed(Routes.recipePage);
            },
          ),

        ),
        Card(
          color: Colors.white,
          child: ListTile(
            leading: Container(
              width: 90,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://herbsandflour.com/wp-content/uploads/2021/12/Pork-Tenderloin-with-Apples-Onions.jpg"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            //Image.network("https://www.marketofchoice.com/wp-content/uploads/2020/12/Seared-Pork-Tenderloin-1200X925.jpg"),
            title: const Text(
              "Pan-Seared Pork Tenderloin With Apples",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: const Text(
                "(สันในหมูผัดแอปเปิ้ล)\n172 กิโลแคลรี"
            ),
            isThreeLine: true,
            trailing: const Icon(Icons.favorite, color: Colors.red,),
            onTap: () {
              Get.toNamed(Routes.recipePage);
            },
          ),

        ),
        Card(
          color: Colors.white,
          child: ListTile(
            leading: Container(
              width: 90,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://herbsandflour.com/wp-content/uploads/2021/12/Pork-Tenderloin-with-Apples-Onions.jpg"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            //Image.network("https://www.marketofchoice.com/wp-content/uploads/2020/12/Seared-Pork-Tenderloin-1200X925.jpg"),
            title: const Text(
              "Pan-Seared Pork Tenderloin With Apples",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: const Text(
                "(สันในหมูผัดแอปเปิ้ล)\n172 กิโลแคลรี"
            ),
            isThreeLine: true,
            trailing: const Icon(Icons.favorite, color: Colors.red,),
            onTap: () {
              Get.toNamed(Routes.recipePage);
            },
          ),

        ),
        Card(
          color: Colors.white,
          child: ListTile(
            leading: Container(
              width: 90,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://herbsandflour.com/wp-content/uploads/2021/12/Pork-Tenderloin-with-Apples-Onions.jpg"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            //Image.network("https://www.marketofchoice.com/wp-content/uploads/2020/12/Seared-Pork-Tenderloin-1200X925.jpg"),
            title: const Text(
              "Pan-Seared Pork Tenderloin With Apples",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: const Text(
                "(สันในหมูผัดแอปเปิ้ล)\n172 กิโลแคลรี"
            ),
            isThreeLine: true,
            trailing: const Icon(Icons.favorite, color: Colors.red,),
            onTap: () {
              Get.toNamed(Routes.recipePage);
            },
          ),

        ),
        Card(
          color: Colors.white,
          child: ListTile(
            leading: Container(
              width: 90,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://herbsandflour.com/wp-content/uploads/2021/12/Pork-Tenderloin-with-Apples-Onions.jpg"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            //Image.network("https://www.marketofchoice.com/wp-content/uploads/2020/12/Seared-Pork-Tenderloin-1200X925.jpg"),
            title: const Text(
              "Pan-Seared Pork Tenderloin With Apples",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: const Text(
                "(สันในหมูผัดแอปเปิ้ล)\n172 กิโลแคลรี"
            ),
            isThreeLine: true,
            trailing: const Icon(Icons.favorite, color: Colors.red,),
            onTap: () {
              Get.toNamed(Routes.recipePage);
            },
          ),

        ),
        Card(
          color: Colors.white,
          child: ListTile(
            leading: Container(
              width: 90,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://herbsandflour.com/wp-content/uploads/2021/12/Pork-Tenderloin-with-Apples-Onions.jpg"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            //Image.network("https://www.marketofchoice.com/wp-content/uploads/2020/12/Seared-Pork-Tenderloin-1200X925.jpg"),
            title: const Text(
              "Pan-Seared Pork Tenderloin With Apples",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: const Text(
                "(สันในหมูผัดแอปเปิ้ล)\n172 กิโลแคลรี"
            ),
            isThreeLine: true,
            trailing: const Icon(Icons.favorite, color: Colors.red,),
            onTap: () {
              Get.toNamed(Routes.recipePage);
            },
          ),

        ),
        Card(
          color: Colors.white,
          child: ListTile(
            leading: Container(
              width: 90,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://herbsandflour.com/wp-content/uploads/2021/12/Pork-Tenderloin-with-Apples-Onions.jpg"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            //Image.network("https://www.marketofchoice.com/wp-content/uploads/2020/12/Seared-Pork-Tenderloin-1200X925.jpg"),
            title: const Text(
              "Pan-Seared Pork Tenderloin With Apples",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: const Text(
                "(สันในหมูผัดแอปเปิ้ล)\n172 กิโลแคลรี"
            ),
            isThreeLine: true,
            trailing: const Icon(Icons.favorite, color: Colors.red,),
            onTap: () {
              Get.toNamed(Routes.recipePage);
            },
          ),

        ),
        Card(
          color: Colors.white,
          child: ListTile(
            leading: Container(
              width: 90,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://herbsandflour.com/wp-content/uploads/2021/12/Pork-Tenderloin-with-Apples-Onions.jpg"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            //Image.network("https://www.marketofchoice.com/wp-content/uploads/2020/12/Seared-Pork-Tenderloin-1200X925.jpg"),
            title: const Text(
              "Pan-Seared Pork Tenderloin With Apples",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: const Text(
                "(สันในหมูผัดแอปเปิ้ล)\n172 กิโลแคลรี"
            ),
            isThreeLine: true,
            trailing: const Icon(Icons.favorite, color: Colors.red,),
            onTap: () {
              Get.toNamed(Routes.recipePage);
            },
          ),

        ),
      ],
    );
  }
}

