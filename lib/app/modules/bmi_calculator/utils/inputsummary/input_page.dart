import 'package:flutter/material.dart';

import '../gender/gender.dart';
import '../widget_utils.dart';

class InputSummaryCard extends StatelessWidget {
  final Gender? gender;

  final int? height;
  final int? weight;

  const InputSummaryCard({Key? key, this.gender, this.weight, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(screenAwareSize(16.0, context)),
      child: SizedBox(
        height: screenAwareSize(32.0, context),
        child: Row(
          children: <Widget>[
            Expanded(child: _genderText()),
            _divider(),
            Expanded(child: _text("${weight}kg")),
            _divider(),
            Expanded(child: _text("${height}cm")),
            _divider(),

          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      width: 2.0,
    );
  }

  Widget _text(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF00154F),
        fontSize: 15.0,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _genderText() {
    String genderText = gender == Gender.other
        ? '-'
        : (gender == Gender.male ? 'Male' : 'Female');
    return _text(genderText);
  }
}
