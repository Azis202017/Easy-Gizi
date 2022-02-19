import 'package:easygizi/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/color_app.dart';
import '../../../theme/fonts_app.dart';
import '../controllers/payment_success_controller.dart';

class PaymentSuccessView extends GetView<PaymentSuccessController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SizedBox(
        width: Get.width,
        child: Container(
          margin: EdgeInsets.only(left: 55, right: 55),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/payment_success.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 75,
              ),
              Text(
                'Payment Success',
                style: interSemiBold.copyWith(
                  fontSize: 24,
                  color: whiteColor,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Thank you for trusting our service. I hope you are satisfied and consultation again.',
                style: reguler.copyWith(
                  fontSize: 14,
                  color: whiteColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: Get.width,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: whiteColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
                  },
                  child: Text(
                    'Back To Home',
                    style: interSemiBold.copyWith(color: blackColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
