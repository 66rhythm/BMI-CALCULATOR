import 'package:flutter/material.dart';
import '../constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.buttontitle, this.ontap});

  final Function ontap;
  final String buttontitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
          child: Text(
            buttontitle,
            style: kCalculateStyle,
          ),
        ),
        color: kbottomContainercolor,
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        height: kbottomContainerHeight,
      ),
    );
  }
}
