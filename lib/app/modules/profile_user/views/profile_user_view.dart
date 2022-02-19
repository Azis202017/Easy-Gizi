import 'package:easygizi/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/color_app.dart';
import '../../../theme/fonts_app.dart';
import '../controllers/profile_user_controller.dart';

class ProfileUserView extends GetView<ProfileUserController> {
  final AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Profile',
                        style: interSemiBold.copyWith(
                          fontSize: 24,
                          color: whiteColor,
                          letterSpacing: 0.03,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Fill in the account information',
                        style: reguler.copyWith(
                          fontSize: 14,
                          color: whiteColorOpacity,
                          letterSpacing: 0.03,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 30,
                      top: 2,
                    ),
                    child: Image.asset(
                      'assets/images/setting_icon.png',
                      width: 55,
                      height: 55,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 170,
                ),
                Center(
                  child: Container(
                    width: 125,
                    height: 125,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.network(
                        '${authController.user.photoUrl}',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  '${authController.user.name}',
                  style: interSemiBold.copyWith(
                    color: blackColor2,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '${authController.user.email}',
                  style: interSemiBold.copyWith(
                    color: greyColor2,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30,
                    top: 50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Gender'),
                      Row(
                        children: [
                          Text(
                            '${authController.user.gender}',
                            style: reguler.copyWith(
                              color: greyColor4,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            'assets/images/next_button_icon_profile.png',
                            width: 24,
                            height: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30,
                  ),
                  child: Divider(
                    thickness: 1,
                    color: greyColorOpacity2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30,
                    top: 25,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Age'),
                      Row(
                        children: [
                          Text(
                            '${authController.user.age}',
                            style: reguler.copyWith(
                              color: greyColor4,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            'assets/images/next_button_icon_profile.png',
                            width: 24,
                            height: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30,
                  ),
                  child: Divider(
                    thickness: 1,
                    color: greyColorOpacity2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30,
                    top: 25,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Weight'),
                      Row(
                        children: [
                          Text(
                            '55 kg',
                            style: reguler.copyWith(
                              color: greyColor4,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            'assets/images/next_button_icon_profile.png',
                            width: 24,
                            height: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30,
                  ),
                  child: Divider(
                    thickness: 1,
                    color: greyColorOpacity2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30,
                    top: 25,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Height'),
                      Row(
                        children: [
                          Text(
                            '155 cm',
                            style: reguler.copyWith(
                              color: greyColor4,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            'assets/images/next_button_icon_profile.png',
                            width: 24,
                            height: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30,
                  ),
                  child: Divider(
                    thickness: 1,
                    color: greyColorOpacity2,
                  ),
                ),
                Container(
                  width: Get.width,
                  height: 55,
                  margin: EdgeInsets.only(
                    left: 30,
                    top: 30,
                    right: 30,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      authController.logout();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Logout.png',
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Logout',
                          style: interSemiBold.copyWith(
                            color: whiteColor,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
