import 'package:easygizi/app/routes/app_pages.dart';
import 'package:easygizi/app/theme/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget_utils.dart';

class BmiAppBar extends StatelessWidget {
  final bool isInputPage;
  static const String wavingHandEmoji = "\uD83D\uDC4B";
  static const String whiteSkinTone = "\uD83C\uDFFB";

  const BmiAppBar({Key? key, this.isInputPage = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      child: Container(
        height: appBarHeight(context),
        color: primaryColor,
        child: Padding(
          padding: EdgeInsets.all(screenAwareSize(16.0, context)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                 isInputPage ? Get.toNamed(Routes.HOME) : Get.toNamed(Routes.BMI_CALCULATOR);
                },
                child: Image.asset(
                  'assets/images/back_button.png',
                  width: 44,
                  height: 44,
                ),
              ),
              SizedBox(width: 15),

              _buildLabel(context),
            ],
          ),
        ),
      ),
    );
  }

  RichText _buildLabel(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style.copyWith(fontSize: 34.0),
        children: [
          TextSpan(
            text: isInputPage ? "BMI Calculator " : "Your BMI",
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
         
        ],
      ),
    );
  }

  String getEmoji(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? wavingHandEmoji
        : wavingHandEmoji + whiteSkinTone;
  }
}
