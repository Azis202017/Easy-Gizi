import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../theme/color_app.dart';
import '../../../theme/fonts_app.dart';
import '../controllers/appointment_controller.dart';

class AppointmentView extends GetView<AppointmentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
                children: [
                  SizedBox(height: 31), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Appointment',
                              style: interSemiBold.copyWith(
                                fontSize: 24,
                                color: whiteColor,
                                letterSpacing: 0.03,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Your have 5 appointments',
                              style: reguler.copyWith(
                                fontSize: 14,
                                color: whiteColorOpacity,
                                letterSpacing: 0.03,
                              ),
                            )
                          ],
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
                    width: double.infinity,
                    height : 220,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    margin: EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 30,
                      bottom: 15,
                    ),
                     padding: EdgeInsets.only(
                      
                      top: 15,
                  
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading:
                              Image.asset('assets/images/doctor_photo.png'),
                          title: Text(
                            'Dr Anastasya Salma',
                            style: interSemiBold.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            'Nutritionist Doctor',
                            style: reguler.copyWith(
                              fontSize: 14,
                              color: greyColor,
                            ),
                          ),
                          trailing: Image.asset(
                            'assets/images/video_icon_bold.png',
                            height: 24,
                            width: 24,
                          ),
                        ),
                        Container(
                          width: Get.width,
                          height: 55,
                          margin:
                              EdgeInsets.only(left: 15, right: 15, bottom: 15),
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
                                    SizedBox(width: 27),
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
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Image.asset(
                                        'assets/images/time.png',
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 27),
                                      child: Obx(
                                        () => Text(
                                          "${controller.selectedTime.value.hour} : ${controller.selectedTime.value.minute} ${controller.stringMessage}",
                                          style: reguler,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: 15,
                                right: 10,
                              ),
                              width: 150,
                              height: 45,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: whiteColor,
                                  elevation: 0,
                                  side: BorderSide(
                                    color: Color(0xffCDCDCD),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Cancel',
                                  style: reguler.copyWith(
                                    color: greyColor,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 45,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: primaryColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Reschedule',
                                  style: reguler.copyWith(
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
  
    );
  }
}
