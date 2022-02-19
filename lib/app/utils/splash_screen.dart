import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/color_app.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: Get.height,
        width: Get.width,
        color : primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width : 231, height:226,),
            SizedBox(height : 24,),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
