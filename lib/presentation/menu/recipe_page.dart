import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/src/model/menu.dart';
import 'package:fruits_and_veggies/src/theme/theme_color.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  bool _isSelected = true;

  Menu? menuModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _appbar(),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    height: 280,
                    width: 280,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.pink,
                        image: DecorationImage(
                            //image: AssetImage(menuModel!.image),
                            image : NetworkImage("https://rare-gallery.com/uploads/posts/353026-4k-wallpaper.jpg"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Positioned(
                    left: 220,
                    child:  IconButton(
                      onPressed: () {
                        setState(() {
                          _isSelected =! _isSelected;
                        });
                      },
                      //icon: Icon(Icons.favorite),
                      icon: _isSelected ? Icon(Icons.favorite_border, size: 50) :
                      const Icon(Icons.favorite, size: 50, color: Colors.red),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  //menuModel!.nameEng,
                  "Strawberry & Yogurt Parfait",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ThemeColor.green
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 3),
                    height: 420,
                    width: 420,
                    decoration: const BoxDecoration(
                        color: Color(0xffD9D9D9),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "285 กิโลแคลอรี",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "ส่วนผสม",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Text(
                          '''
        1. สตรอว์เบอร์รี่หั่น 1 ถ้วย
        2. น้ำตาล 1 ช้อนชา
        3. กรีกโยเกิร์ต ไขมัน 0% 1/2 ถ้วย
        4. กราโนล่า 1/4 ถ้วย''',
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "วิธีทำ",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Text(
                        '''
        1. รวมสตรอเบอร์รี่และน้ำตาลลงในชามขนาดเล็ก
      ต้มไว้ประมาณ 5 นาที
        2. ใส่โยเกิร์ตลงในถ้วย ตามด้วยสตรอว์เบอร์รี่
      ท็อปหน้าด้วยกราโนล่า''',
                        style: TextStyle(
                            fontSize: 16
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appbar() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(
                style: BorderStyle.solid,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(13)),
              color: Colors.transparent,//โปร่งใส
            ),
            child: const Icon(
                Icons.arrow_back
            ),
          ),
        ),
        const Text(
          'Menu',
          style: TextStyle(
              fontSize: 32,
              color: ThemeColor.green,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}