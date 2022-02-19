import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';
import '../controllers/profile_doctor_controller.dart';
import '../../../theme/fonts_app.dart';
import '../../../theme/color_app.dart';

class ProfileDoctorView extends GetView<ProfileDoctorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: Get.width,
                height: 250,
                child: Image.asset(
                  'assets/images/background_top.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 30,
                  top: 75,
                  right: 30,
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: GestureDetector(
                    onTap : () {
                      Get.back();
                    },
                    child: Image.asset(
                      'assets/images/back_button.png',
                      width: 55,
                      height: 55,
                    ),
                  ),
                  title: Text(
                    'Book Appointment',
                    style: interSemiBold.copyWith(
                      fontSize: 16,
                      color: whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                     Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
                    },
                    child: Image.asset(
                      'assets/images/chat_icon.png',
                      width: 55,
                      height: 55,
                    ),
                  ),
                ),
              ),
            
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Center(
                    child: Container(
                      width: 125,
                      height: 125,
                      child: Image.asset('assets/images/doctor_photo.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Text(
                      'Dr. Anastasya Salma',
                      style: interSemiBold.copyWith(
                        letterSpacing: 0.03,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Text(
                      'Nutritionist in Gizi Center ID',
                      style: reguler.copyWith(
                        letterSpacing: 0.03,
                        fontSize: 14,
                        color: greyColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 30,
                        ),
                        width: 105,
                        height: 75,
                        decoration: BoxDecoration(
                          color: greyColorOpacity2,
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 11,
                            ),
                            Center(
                              child: Text(
                                'Patients',
                                style: reguler.copyWith(
                                  fontSize: 12,
                                  color: blackColor2,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            Row(
                              children: [
                                SizedBox(width: 21),
                                Image.asset(
                                  'assets/images/patient.png',
                                  width: 22,
                                  height: 16,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '500+',
                                  style: reguler.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: blackColor2,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                        ),
                        width: 105,
                        height: 75,
                        decoration: BoxDecoration(
                          color: greyColorOpacity2,
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 11,
                            ),
                            Center(
                              child: Text(
                                'Experience',
                                style: reguler.copyWith(
                                  fontSize: 12,
                                  color: blackColor2,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            Row(
                              children: [
                                SizedBox(width: 21),
                                Image.asset(
                                  'assets/images/bag_2.png',
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '500+',
                                  style: reguler.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: blackColor2,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                        ),
                        width: 105,
                        height: 75,
                        decoration: BoxDecoration(
                          color: greyColorOpacity2,
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 11,
                            ),
                            Center(
                              child: Text(
                                'Reviews',
                                style: reguler.copyWith(
                                  fontSize: 12,
                                  color: blackColor2,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            Row(
                              children: [
                                SizedBox(width: 21),
                                Image.asset(
                                  'assets/images/Star.png',
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '500+',
                                  style: reguler.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: blackColor2,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text('About',
                        style: interSemiBold.copyWith(color: blackColor2)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      top: 25,
                      right: 41,
                    ),
                    child: Text(
                      '''Dr. Anastasya Salma is an experienced specialist who is constaltly working on improving her skills.''',
                      style: reguler.copyWith(
                        color: greyColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      top: 30,
                    ),
                    child: Text('Working Time',
                        style: interSemiBold.copyWith(color: blackColor2)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      top: 25,
                      right: 41,
                    ),
                    child: Text(
                      '''Mon - Fri, Morning 8 am - Night 8 pm''',
                      style: reguler.copyWith(
                        color: greyColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      top: 30,
                    ),
                    child: Text(
                      'Schedule',
                      style: interSemiBold.copyWith(
                        color: blackColor2,
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: 55,
                    margin: EdgeInsets.only(),
                    decoration: BoxDecoration(
                      color: greyColor3,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.chooseDate();
                          },
                          child: Row(
                            children: [
                              SizedBox(width: 40),
                              Image.asset(
                                'assets/images/calendar.png',
                                width: 24,
                                height: 24,
                              ),
                              SizedBox(width: 10),
                              Obx(
                                () => Text(
                                  DateFormat.yMMMEd().format(
                                    controller.selectedDate.value,
                                  ),
                                  style: reguler,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.chooseTime();
                          },
                          child: Row(
                            children: [
                              SizedBox(width: 40),
                              Image.asset(
                                'assets/images/time.png',
                                width: 24,
                                height: 24,
                              ),
                              SizedBox(width: 10),
                              Obx(
                                () => Text(
                                  "${controller.selectedTime.value.hour} : ${controller.selectedTime.value.minute} ${controller.stringMessage}",
                                  style: reguler,
                                ),
                              ),
                              SizedBox(width: 40),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 20,
                      bottom: 18,
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
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total', style: reguler),
                            Text(
                              '\$23.49,00',
                              style: interSemiBold.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Container(
                          width: Get.width,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              Get.toNamed(Routes.PAYMENT);
                            },
                            child: Text(
                              'Get Appointment',
                              style: interSemiBold.copyWith(
                                color: whiteColor,
                              ),
                            ),
                          ),
                        )
                      ],
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
