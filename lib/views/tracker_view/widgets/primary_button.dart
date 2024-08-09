import 'package:fetch_application/utils/constants/colors.dart';
import 'package:fetch_application/utils/constants/typography.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const PrimaryButton(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 52,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: buttonPrimaryBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            title,
            style: buttonTitleStyle,
          ),
        ));
  }
}
