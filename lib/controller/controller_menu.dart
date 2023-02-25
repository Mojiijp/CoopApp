import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/src/model/menu.dart';
import 'package:get/get.dart';

class ControllerMenu extends GetxController {
  List<Menu> menuList = [];

  Menu? getSelectedMenu(){
    try {
      return menuList.firstWhere((element) => element.isSelected);
    }catch (e){
      return null;
    }
  }
}
