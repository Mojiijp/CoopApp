import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/src/config/route/Routes.dart';
import 'package:fruits_and_veggies/src/theme/theme_color.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class SaveMenuPage extends StatefulWidget {
  const SaveMenuPage({Key? key}) : super(key: key);

  @override
  _SaveMenuPageState createState() => _SaveMenuPageState();
}

class _SaveMenuPageState extends State<SaveMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const Text(
                "เมนูที่บันทึกไว้",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: double.infinity,
                  height: 650,
                  color: const Color(0xffF5F5F5),
                  child: _ListTile(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  width: 150,
                  height: 45,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [ThemeColor.greenAccent, ThemeColor.green]),
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
                    ),
                    child: const Text(
                      "All menu",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _ListTile() {
    return ListView(
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
                      image: NetworkImage("https://herbsandflour.com/wp-content/uploads/2021/12/Pork-Tenderloin-with-Apples-Onions.jpg"),
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
                      image: NetworkImage("https://www.momontimeout.com/wp-content/uploads/2021/08/snickers-apple-salad-square.jpeg"),
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
                      image: NetworkImage("https://www.ambitiouskitchen.com/wp-content/uploads/2019/09/applepancakes-6.jpg"),
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
                      image: NetworkImage("https://herbsandflour.com/wp-content/uploads/2021/12/Pork-Tenderloin-with-Apples-Onions.jpg"),
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
                      image: NetworkImage("https://herbsandflour.com/wp-content/uploads/2021/12/Pork-Tenderloin-with-Apples-Onions.jpg"),
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
                      image: NetworkImage("https://herbsandflour.com/wp-content/uploads/2021/12/Pork-Tenderloin-with-Apples-Onions.jpg"),
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
                      image: NetworkImage("https://herbsandflour.com/wp-content/uploads/2021/12/Pork-Tenderloin-with-Apples-Onions.jpg"),
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
                      image: NetworkImage("https://herbsandflour.com/wp-content/uploads/2021/12/Pork-Tenderloin-with-Apples-Onions.jpg"),
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
                      image: NetworkImage("https://herbsandflour.com/wp-content/uploads/2021/12/Pork-Tenderloin-with-Apples-Onions.jpg"),
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
                      image: NetworkImage("https://herbsandflour.com/wp-content/uploads/2021/12/Pork-Tenderloin-with-Apples-Onions.jpg"),
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
                      image: NetworkImage("https://herbsandflour.com/wp-content/uploads/2021/12/Pork-Tenderloin-with-Apples-Onions.jpg"),
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
