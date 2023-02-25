import 'package:fruits_and_veggies/presentation/camera/camera_page.dart';
import 'package:fruits_and_veggies/presentation/camera/information_page.dart';
import 'package:fruits_and_veggies/presentation/camera/more_info_page.dart';
import 'package:fruits_and_veggies/presentation/camera/recom_menu_info_page.dart';
import 'package:fruits_and_veggies/presentation/create/create_account_page.dart';
import 'package:fruits_and_veggies/presentation/home/home_page.dart';
import 'package:fruits_and_veggies/presentation/login/login_page.dart';
import 'package:fruits_and_veggies/presentation/main/main_page.dart';
import 'package:fruits_and_veggies/presentation/memo/memo_page.dart';
import 'package:fruits_and_veggies/presentation/menu/menu_page.dart';
import 'package:fruits_and_veggies/presentation/menu/recipe_page.dart';
import 'package:fruits_and_veggies/presentation/menu/save_menu_page.dart';
import 'package:fruits_and_veggies/presentation/profile/profile_page.dart';
import 'package:fruits_and_veggies/src/widgets/buttom_nav_bar.dart';
import 'package:get/get.dart';

class Routes {
  static const mainPage = "/main";
  static const loginPage = "/login";
  static const createAccountPage = "/create";
  static const homePage = "/home";
  static const menuPage = "/menu";
  static const saveMenuPage = "/menu-save";
  static const recipePage = "/recipe";
  static const cameraPage = "/camera";
  static const infoPage = "/info";
  static const moreInfoPage = "/more-info";
  static const recomInfoPage = "/recom-info";
  static const memoPage = "/memo";
  static const profilePage = "/profile";
  static const bottomNavBarPage = "/buttomnavbar";

  static List<GetPage> getPageRoutes() {
    return [
      GetPage(
        name: mainPage,
        page: () => MainPage(),
      ),
      GetPage(
        name: loginPage,
        page: () => LoginPage(),
      ),
      GetPage(
        name: createAccountPage,
        page: () => CreateAccountPage(),
      ),
      GetPage(
        name: homePage,
        page: () => HomePage(),
      ),
      GetPage(
        name: menuPage,
        page: () => MenuPage(),
      ),
      GetPage(
        name: saveMenuPage,
        page: () => SaveMenuPage(),
      ),
      GetPage(
        name: recipePage,
        page: () => RecipePage(),
      ),
      GetPage(
        name: cameraPage,
        page: () => CameraPage(),
      ),
      GetPage(
        name: infoPage,
        page: () => InformationPage(),
      ),
      GetPage(
        name: recomInfoPage,
        page: () => RecomMenuInfoPage(),
      ),
      GetPage(
        name: moreInfoPage,
        page: () => MoreInfoPage(),
      ),
      GetPage(
        name: memoPage,
        page: () => MemoPage(),
      ),
      GetPage(
        name: profilePage,
        page: () => ProfilePage(),
      ),
      GetPage(
        name: bottomNavBarPage,
        page: () => ButtomNavBar(),
      ),
    ];
  }
}