import 'package:easygizi/app/modules/bmi_calculator/utils/weight/weight/weight_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widget/card_title.dart';
import '../../widget_utils.dart';

class WeightCard extends StatefulWidget {
  final int? initialWeight;
  final ValueChanged<int>? onChanged;

  const WeightCard({Key? key, this.initialWeight, this.onChanged})
      : super(key: key);

  @override
  _WeightCardState createState() {
    return _WeightCardState();
  }
}

class _WeightCardState extends State<WeightCard> {
  late int weight;

  @override
  void initState() {
    weight = widget.initialWeight ?? 70;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: screenAwareSize(8.0, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const CardTitle(
                title : "Weight",
                subTitle: " (kg)",
              ),
              Padding(
                padding: EdgeInsets.only(top: screenAwareSize(4.0, context)),
                child: _drawWeightSlider(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawWeightSlider(BuildContext context) {
    return WeightBackground(
      child: LayoutBuilder(builder: (context, constraints) {
        return constraints.isTight
            ? Container()
            : WeightSlider(
                minValue: 30,
                maxValue: 110,
                value: weight,
                onChanged: _onChanged,
                width: constraints.maxWidth,
              );
      }),
    );
  }

  _onChanged(int val) {
    weight = val;
    widget.onChanged!(val);
  }
}

class WeightBackground extends StatelessWidget {
  final Widget? child;

  const WeightBackground({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: screenAwareSize(100.0, context),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(screenAwareSize(50.0, context)),
          ),
          child: child,
        ),
        SvgPicture.asset(
          "assets/images/weight_arrow.svg",
          height: screenAwareSize(10.0, context),
          width: screenAwareSize(18.0, context),
        )
      ],
    );
  }
}
