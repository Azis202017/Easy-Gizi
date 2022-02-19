import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widget_utils.dart';
import 'gender.dart';
import 'gender_line.dart';

double _circleSize(BuildContext context) {
  return screenAwareSize(80.0, context);
}

const double _defaultIconAngel = math.pi / 4;

const Map<Gender, double> genderAngels = {
  Gender.female: -_defaultIconAngel,
  Gender.other: 0,
  Gender.male: _defaultIconAngel
};

class GenderIconTranslated extends StatelessWidget {
  static final Map<Gender, String> genderImages = {
    Gender.male: "assets/images/man.svg",
    Gender.other: "assets/images/other.svg",
    Gender.female: "assets/images/woman.svg"
  };

  bool get _isOtherGender => gender == Gender.other;

  String? get _assertName => genderImages[gender!];


  double _genderLeftPadding(BuildContext context) {
    return screenAwareSize(_isOtherGender ? 8.0 : 0.0, context);
  }

  final Gender? gender;

  const GenderIconTranslated({Key? key, this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget icon = Padding(
      padding: EdgeInsets.only(left: _genderLeftPadding(context)),
      child: SvgPicture.asset(
        _assertName!,
        width:16.94,
        height: 24,
      ),
    );

    Widget rotateIcon = Transform.rotate(
      angle: genderAngels[gender!]!,
      child: icon,
    );

    Widget iconWithAline = Padding(
      padding: EdgeInsets.only(bottom: _circleSize(context) / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[rotateIcon, const GenderLine()],
      ),
    );

    Widget rotatedIconWithALine = Transform.rotate(
      alignment: Alignment.bottomCenter,
      angle: genderAngels[gender!]!,
      child: iconWithAline,
    );

    Widget centeredIconWithALine = Padding(
      padding: EdgeInsets.only(bottom: _circleSize(context) / 2),
      child: rotatedIconWithALine,
    );

    return centeredIconWithALine;
  }
}
