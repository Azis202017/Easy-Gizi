import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/color_app.dart';
import '../../../theme/fonts_app.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
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
              Padding(
                padding: EdgeInsets.only(
                  left: 30,
                  top: 75,
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      'assets/images/back_button.png',
                      width: 55,
                      height: 55,
                    ),
                  ),
                  title: Text(
                    'Payment Method',
                    style: interSemiBold.copyWith(
                      fontSize: 16,
                      color: whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  trailing: SizedBox(
                    width: 50,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 122),
                  Container(
                    width: double.infinity,
                    height: 220,
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
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      'Payment Options',
                      style: interSemiBold.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 25,
                    ),
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 15,
                      top: 34,
                      bottom: 34,
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset(
                            'assets/images/transfer_bank.png',
                            width: 24,
                            height: 24,
                          ),
                          title: Text('Bank Indonesia'),
                          trailing: Obx(
                            () => Radio(
                              activeColor: primaryColor,
                              value: controller.listOfPayment[0],
                              groupValue: controller.payment.value,
                              onChanged: (value) {
                                controller.changeValue(value.toString());
                              },
                            ),
                          ),
                        ),
                        Divider(),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset(
                            'assets/images/gopay.png',
                            width: 24,
                            height: 24,
                          ),
                          title: Text('Gopay'),
                          trailing: Obx(
                            () => Radio(
                              activeColor: primaryColor,
                              value: controller.listOfPayment[1],
                              groupValue: controller.payment.value,
                              onChanged: (value) {
                                controller.changeValue(value.toString());
                              },
                            ),
                          ),
                        ),
                        Divider(),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset(
                            'assets/images/shopee_pay.png',
                            width: 24,
                            height: 24,
                          ),
                          title: Text('Shopeepay'),
                          trailing: Obx(
                            () => Radio(
                              activeColor: primaryColor,
                              value: controller.listOfPayment[2],
                              groupValue: controller.payment.value,
                              onChanged: (value) {
                                controller.changeValue(value.toString());
                              },
                            ),
                          ),
                        ),
                        Divider(),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset(
                            'assets/images/ovo.png',
                            width: 24,
                            height: 24,
                          ),
                          title: Text('Ovo'),
                          trailing: Obx(
                            () => Radio(
                              activeColor: primaryColor,
                              value: controller.listOfPayment[3],
                              groupValue: controller.payment.value,
                              onChanged: (value) {
                                controller.changeValue(value.toString());
                              },
                            ),
                          ),
                        ),
                        Divider(),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset(
                            'assets/images/dana.png',
                            width: 24,
                            height: 24,
                          ),
                          title: Text('Dana'),
                          trailing: Obx(
                            () => Radio(
                              activeColor: primaryColor,
                              value: controller.listOfPayment[4],
                              groupValue: controller.payment.value,
                              onChanged: (value) {
                                controller.changeValue(value.toString());
                              },
                            ),
                          ),
                        ),
                        Divider(),
                      ],
                    ),
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
                              Get.toNamed(Routes.PAYMENT_SUCCESS);
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
