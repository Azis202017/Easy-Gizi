import 'package:flutter/material.dart';

import '../widget/card_title.dart';
import '../widget_utils.dart';
import 'height_picker.dart';


class HeightCard extends StatefulWidget {
  final int? height;
  final ValueChanged<int>? onChanged;

  const HeightCard({Key? key, this.height, this.onChanged}) : super(key: key);

  @override
  _HeightCardState createState() {
    return _HeightCardState();
  }
}

class _HeightCardState extends State<HeightCard> {
  int? height;

  @override
  void initState() {
    super.initState();
    height = widget.height ?? 170;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(top: screenAwareSize(8.0, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CardTitle(
              title : "Height",
              subTitle: "(cm)",
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(bottom: screenAwareSize(8.0, context)),
              child: LayoutBuilder(builder: (context, constraints) {
                return HeightPicker(
                  widgetHeight: constraints.maxHeight,
                  height: height,
                  onChange: _onChanged,
                );
              }),
            ))
          ],
        ),
      ),
    );
  }

  _onChanged(int val) {
   
    height = val;
    widget.onChanged!(val);
  }
}
