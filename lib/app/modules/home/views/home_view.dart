import 'package:easygizi/app/controllers/auth_controller.dart';
import 'package:easygizi/app/theme/color_app.dart';
import 'package:easygizi/app/theme/fonts_app.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: Get.width,
                height: 300,
                child: Image.asset(
                  'assets/images/background_top.png',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 31),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi, ${authController.user.value.name} 👋',
                                style: interSemiBold.copyWith(
                                  fontSize: 24,
                                  color: whiteColor,
                                  letterSpacing: 0.03,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                'How are you feeling today?',
                                style: reguler.copyWith(
                                  fontSize: 14,
                                  color: whiteColorOpacity,
                                  letterSpacing: 0.03,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: 30,
                        ),
                        child: Image.asset(
                          'assets/images/notification_icon.png',
                          width: 55,
                          height: 55,
                        ),
                      ),
                    ],
                  ),
                
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 30,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 0,
                            color: whiteColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 0,
                            color: whiteColor,
                          ),
                        ),
                        prefixIcon: Icon(Icons.search, color: blackColor),
                        filled: true,
                        fillColor: whiteColor,
                        border: InputBorder.none,
                        hintText: 'Search Nutritionist',
                        hintStyle: reguler.copyWith(
                          fontSize: 14,
                          color: blackColorOpacity,
                        ),
                      ),
                    ),
                  ),
                
                  Container(
                    margin: EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 30,
                    ),
                    width: Get.width,
                    child: Stack(
                      children: [
                        Image.asset('assets/images/banner.png'),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            top: 23,
                            right: 123,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Take care of your nutrition during the pandemic',
                                style: interSemiBold.copyWith(),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: 120,
                                height: 35,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: primaryColor,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Join Now',
                                    style: interSemiBold.copyWith(
                                      fontSize: 12,
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  right: 19,
                                ),
                                width: 75,
                                height: 75,
                                child: Image.asset(
                                  'assets/images/consultation.png',
                                  width: 36,
                                  height: 36,
                                ),
                                decoration: BoxDecoration(
                                  color: greyColor3,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Consultation',
                                style: reguler.copyWith(
                                  fontSize: 12,
                                  color: blackColor2,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.EVENT);
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  right: 19,
                                ),
                                width: 75,
                                height: 75,
                                child: Image.asset(
                                  'assets/images/event.png',
                                  width: 36,
                                  height: 36,
                                ),
                                decoration: BoxDecoration(
                                  color: greyColor3,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Event',
                                style: reguler.copyWith(
                                  fontSize: 12,
                                  color: blackColor2,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.NUTRITION);
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  right: 19,
                                ),
                                width: 75,
                                height: 75,
                                child: Image.asset(
                                  'assets/images/nutrition.png',
                                  width: 36,
                                  height: 36,
                                ),
                                decoration: BoxDecoration(
                                  color: greyColor3,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Nutrition',
                                style: reguler.copyWith(
                                  fontSize: 12,
                                  color: blackColor2,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.BMI_CALCULATOR);
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  right: 19,
                                ),
                                width: 75,
                                height: 75,
                                child: Image.asset(
                                  'assets/images/bmi_calculator.png',
                                  width: 36,
                                  height: 36,
                                ),
                                decoration: BoxDecoration(
                                  color: greyColor3,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'BMI Calculator',
                                style: reguler.copyWith(
                                  fontSize: 12,
                                  color: blackColor2,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 45,
                      left: 30,
                      right: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Available Nutritionist',
                          style: interSemiBold.copyWith(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'See All',
                          style: interSemiBold.copyWith(
                            fontSize: 14,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                
                  Container(
                    margin: EdgeInsets.only(
                      top: 25,
                      left: 30,
                      right: 30,
                      bottom: 30,
                    ),
                    padding: const EdgeInsets.only(
                      bottom: 14,
                      top: 16,
                      left: 15,
                      right: 15,
                    ),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(
                            148,
                            148,
                            148,
                            0.5,
                          ),
                          blurRadius: 14,
                          offset: Offset(0, -1),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/doctor_photo.png',
                      ),
                      title: Text(
                        'Dr. Anastasya Salma',
                        style: interSemiBold.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            'Nutritionist doctor',
                            style: reguler.copyWith(
                              color: greyColor,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/start2.png',
                                width: 24,
                                height: 24,
                              ),
                              Text(
                                '4.8 (124 reviews)',
                                style: reguler.copyWith(
                                  color: greyColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.PROFILE_DOCTOR);
                        },
                        child: Image.asset(
                          'assets/images/button_next.png',
                          width: 36,
                          height: 36,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
