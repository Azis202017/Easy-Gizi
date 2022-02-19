import 'package:easygizi/app/theme/color_app.dart';
import 'package:easygizi/app/theme/fonts_app.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:widget_mask/widget_mask.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  final AuthController authController = Get.find(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                height: 250,
                child: WidgetMask(
                  blendMode: BlendMode.hardLight,
                  mask: Image.asset('assets/images/doctor_pict.png',
                      fit: BoxFit.fill),
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/images/background_top.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Image.asset('assets/images/logo2.png', height: 146),
              SizedBox(height: 30),
              SizedBox(
                width: Get.width,
                child: Text(
                  'Now it’s easy and fast to make appointment with your nutritionist',
                  style: reguler.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 0.30,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: Get.width,
                height: 55,
                margin: EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: greyColor3,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    authController.login();
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 69,
                      ),
                      Image.asset(
                        'assets/images/google.png',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Continue  with google',
                        style: interSemiBold.copyWith(color: blackColor2),
                      )
                    ],
                  ),
                ),
              ),
         
            ],
          ),
        ),
      ),
    );
  }
}
