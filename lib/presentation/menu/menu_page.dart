import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/src/config/route/Routes.dart';
import 'package:fruits_and_veggies/src/theme/theme_color.dart';
import 'package:get/get.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 220,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("https://c0.wallpaperflare.com/preview/86/773/70/bananas-blueberries-breakfast-fit.jpg"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Center(
                      child : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Menu",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "Recipe healthy food",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Recommended menu",
                      style: TextStyle(
                          fontSize: 16,
                          color: ThemeColor.green,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
              _recommendMenu(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 5, left: 10),
                    child: Text(
                      "Saved menu",
                      style: TextStyle(
                          fontSize: 16,
                          color: ThemeColor.green,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.saveMenuPage);
                        print('Text Clicked');
                      },
                      child: const Text(
                        "See all",
                        style: TextStyle(
                            fontSize: 16,
                            color: ThemeColor.green,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //_saveMenu(),
              //_noSaveMenu()
              _menuSaveList()
            ],
          ),
        ),
      ),
    );
  }

  Widget _recommendMenu() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          //img1
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.recipePage);
              print("recommended click");
            },
            child: Column(
              children: [
                //img1
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: NetworkImage("https://rare-gallery.com/uploads/posts/353026-4k-wallpaper.jpg"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),

                ),
                const Text("Strawberry & Yogurt Parfait")
              ],
            ),
          ),
          //img2
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.recipePage);
              print("recommended click");
            },
            child: Column(
              children: [
                //img1
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: NetworkImage("https://insanelygoodrecipes.com/wp-content/uploads/2021/03/Avocado-Toast-with-Spinach-and-Fried-Egg.png"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),

                ),
                const Text("Avocado-Toast-with-Spinach\nand-Fried-Egg", textAlign: TextAlign.center,)
              ],
            ),
          ),
          //img3
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.recipePage);
              print("recommended click");
            },
            child: Column(
              children: [
                //img1
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: NetworkImage("https://rare-gallery.com/uploads/posts/353026-4k-wallpaper.jpg"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),

                ),
                const Text("Strawberry & Yogurt Parfait")
              ],
            ),
          ),
          //img4
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.recipePage);
              print("recommended click");
            },
            child: Column(
              children: [
                //img1
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: NetworkImage("https://rare-gallery.com/uploads/posts/353026-4k-wallpaper.jpg"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),

                ),
                const Text("Strawberry & Yogurt Parfait")
              ],
            ),
          ),
          //img5
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.recipePage);
              print("recommended click");
            },
            child: Column(
              children: [
                //img1
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: NetworkImage("https://insanelygoodrecipes.com/wp-content/uploads/2021/03/Avocado-Toast-with-Spinach-and-Fried-Egg.png"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),

                ),
                const Text("Avocado-Toast-with-Spinach\nand-Fried-Egg", textAlign: TextAlign.center,)
              ],
            ),
          ),
          //img6
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.recipePage);
              print("recommended click");
            },
            child: Column(
              children: [
                //img1
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: NetworkImage("https://rare-gallery.com/uploads/posts/353026-4k-wallpaper.jpg"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),

                ),
                const Text("Strawberry & Yogurt Parfait")
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _saveMenu() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          //img1
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.recipePage);
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: NetworkImage("https://rare-gallery.com/uploads/posts/353026-4k-wallpaper.jpg"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
                const Text("Strawberry & Yogurt Parfait")
              ],
            ),
          ),
          //image2
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.recipePage);
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: NetworkImage("https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2019/05/Cucumber-Salad-main-1.jpg"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
                const Text("Cucumber-Salad")
              ],
            ),
          ),
          //img3
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.recipePage);
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: NetworkImage("https://dishingouthealth.com/wp-content/uploads/2020/10/HealthyPumpkinBars_Square.jpg"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
                const Text("Healthy Pumpkin Bars")
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _noSaveMenu() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 500,
        decoration: BoxDecoration(
          color: Color(0xfff5f5f5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  print("Click Icon");
                },
                icon: const Icon(Icons.wysiwyg)
            ),
            const Text(
              "ยังไม่มีเมนูที่เซฟเอาไว้เลยนะ\n ลองค้นหาเมนูที่ชื่นชอบดูสิ",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuSaveList() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: 180,
        height: 180,
        // child: GetBuilder<MenuController>(
        //   builder: (controller) {
        //     if(controller.productList.isNotEmpty){
        //       return GridView(
        //         physics: const BouncingScrollPhysics(),
        //         clipBehavior: Clip.none,
        //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 1,
        //           childAspectRatio: 4 / 3,
        //           mainAxisSpacing: 30,
        //           crossAxisSpacing: 20,
        //         ),
        //         padding: const EdgeInsets.only(left: 20, right: 20),
        //         scrollDirection: Axis.horizontal,
        //         children:
        //       )
        //     ).toList()
        //     );
        //     }
        //
        //     return SizedBox();
        //   },
        // )
    );
  }
}

