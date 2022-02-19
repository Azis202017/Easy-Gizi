import 'package:easygizi/app/theme/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/fonts_app.dart';
import '../resultpage/result_page.dart';
import '../utils/appbar/bmi_appbar.dart';
import '../utils/fade_rote.dart';
import '../utils/gender/gender.dart';
import '../utils/gender/gender_card.dart';
import '../utils/height/height_card.dart';
import '../utils/inputsummary/input_page.dart';
import '../utils/weight/weight/weight_card.dart';
import '../utils/widget_utils.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State createState() {
    return BmiCalculatorState();
  }
}

class BmiCalculatorState extends State<BmiCalculator> {
  Gender gender = Gender.other;
  int height = 170;
  int weight = 70;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: whiteColor,
          appBar: PreferredSize(
            child: const BmiAppBar(),
            preferredSize: Size.fromHeight(
              appBarHeight(context),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InputSummaryCard(
                gender: gender,
                weight: weight,
                height: height,
              ),
              Expanded(child: _buildCards(context)),
              _buildBottom(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenAwareSize(16.0, context),
        right: screenAwareSize(16.0, context),
        bottom: screenAwareSize(22.0, context),
        top: screenAwareSize(14.0, context),
      ),
      child: SizedBox(
        width: Get.width,
        height: screenAwareSize(52.0, context),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {
            _goToResultPage();
          },
          child: Text(
            'Check The Result',
            style: interSemiBold.copyWith(
              fontSize: 16,
              color: whiteColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCards(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Expanded(
                child: GenderCard(
                  initialGender: gender,
                  onChanged: (val) => setState(() => gender = val),
                ),
              ),
              Expanded(
                child: WeightCard(
                  initialWeight: weight,
                  onChanged: (val) => setState(() => weight = val),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: HeightCard(
            height: height,
            onChanged: (val) => setState(() => height = val),
          ),
        )
      ],
    );
  }

  _goToResultPage() async {
    return Navigator.of(context).push(
      FadeRoute(
        builder: (context) => ResultPage(
          weight: weight,
          height: height,
          gender: gender,
        ),
      ),
    );
  }
}
