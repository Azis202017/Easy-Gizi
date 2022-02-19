import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../widget_utils.dart';

const double _defaultIconAngel = math.pi / 4;

class GenderArrow extends AnimatedWidget {
  const GenderArrow({Key? key, required Listenable listenable})
      : super(key: key, listenable: listenable);

  double _arrowLength(BuildContext context) => screenAwareSize(32.0, context);

  double _translationOffset(BuildContext context) =>
      _arrowLength(context) * -0.4;

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable as Animation<dynamic>;
    return Transform.rotate(
        angle: animation.value,
        child: Transform.translate(
          offset: Offset(0.0, _translationOffset(context)),
          child: Transform.rotate(
              angle: -_defaultIconAngel,
              child: Image.asset(
                "assets/images/gender_arrow.png",
                width : 40.76,
              )),
        ));
  }
}
