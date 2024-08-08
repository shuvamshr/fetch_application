import 'package:fetch_application/constants/colors.dart';
import 'package:fetch_application/constants/icons.dart';
import 'package:flutter/material.dart';

class AddTrackerButton extends StatelessWidget {
  final Function() onPressed;
  const AddTrackerButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: buttonPrimaryBackground,
          borderRadius: BorderRadius.circular(999),
        ),
        child: addIcon,
      ),
    );
  }
}
