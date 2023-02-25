import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/src/authenication/createacc_controller.dart';
import 'package:get/get.dart';

class passwordInput extends StatefulWidget {
  final String label;
  final String initialValue;
  final bool enable;
  final String? Function(String?)? validator;

  const passwordInput({
    super.key,
    required this.label,
    required this.enable,
    required this.validator,
    required this.initialValue
  });

  @override
  State<passwordInput> createState() => _passwordInputState();
}

class _passwordInputState extends State<passwordInput> {

  final controller = Get.put(CreateAccController());

  //final passwordController = TextEditingController();

  final passwordFocusNode = FocusNode();

  var _isObscured;


  @override
  void initState() {
    _isObscured = true;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        obscureText: _isObscured,
        validator: widget.validator,
        keyboardType: TextInputType.visiblePassword,
        focusNode: passwordFocusNode,
        controller: controller.password,
        decoration: InputDecoration(
          enabled: widget.enable,
          filled: true,
          fillColor: const Color(0xffD9D9D9),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          prefixIcon: Icon(Icons.lock, color: Colors.black),
          suffixIcon: IconButton(
            icon : _isObscured ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
            color: Colors.black,
            onPressed: () {
              setState(() {
                _isObscured =! _isObscured;
              });
            },
          ),
          labelText: widget.label,
        ),
      ),
    );
  }
}