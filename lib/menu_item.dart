import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/src/config/route/Routes.dart';
import 'package:fruits_and_veggies/src/model/menu.dart';
import 'package:fruits_and_veggies/src/theme/theme_color.dart';
import 'package:fruits_and_veggies/src/widgets/type.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.menu,
    this.onSelected
  }) : super(key: key);

  final Menu menu;

  final OnSelected? onSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 90,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(menu.image),
                //NetworkImage(
                    //"https://www.momontimeout.com/wp-content/uploads/2021/08/snickers-apple-salad-square.jpeg"),
                fit: BoxFit.cover
            )
        ),
      ),
      //Image.network("https://www.marketofchoice.com/wp-content/uploads/2020/12/Seared-Pork-Tenderloin-1200X925.jpg"),
      title: Text(
        menu.nameEng,
        //"Apple salad",
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),
      ),
      subtitle: Text(
        "${menu.nameTH}\n\n${menu.calories}"
          //"(สลัดแอปเปิ้ล)\n\n172 กิโลแคลรี"
      ),
      isThreeLine: true,
      trailing: IconButton(
        icon: Icon(
          menu.isliked ? Icons.save : Icons.save_outlined,
          color: menu.isliked ? Colors.red : Color(0xffa8a09b),
        ),
        onPressed: () {  },
      ),
      onTap: () {
        Get.toNamed(Routes.recipePage);
      },
    );
  }
}
