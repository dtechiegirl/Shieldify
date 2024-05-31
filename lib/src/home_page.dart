
import 'package:flutter/material.dart';
// import 'package:flutter_current_location/src/controllers/location_controller.dart';
import 'package:get/get.dart';
import 'package:shieldify/src/auth/sign_up.dart';
import 'package:shieldify/src/location_controller.dart';
import 'package:shieldify/widgets/locator.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return locator();
    return SignupPage();
  }
}

