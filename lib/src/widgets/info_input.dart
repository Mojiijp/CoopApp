import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/src/authenication/createacc_controller.dart';
import 'package:get/get.dart';

class infoInput extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final String? initialValue;
  final Icon icon;
  final bool enable;
  const infoInput({
    Key? key,
    required this.label,
    required this.icon,
    required this.enable,
    required this.validator,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateAccController());

    return Container(
      child: TextFormField(
        initialValue: initialValue,
        validator: validator,
        decoration: InputDecoration(
          enabled: enable,
          filled: true,
          fillColor: const Color(0xffD9D9D9),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          prefixIcon: icon,
          labelText: label,
        ),
      ),
    );
  }
}