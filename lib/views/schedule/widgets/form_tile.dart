import 'package:fetch_application/constants/icons.dart';
import 'package:fetch_application/constants/typography.dart';
import 'package:flutter/material.dart';

class FormTile extends StatelessWidget {
  final String type;
  final String label;
  final String selection;
  final String? image;

  const FormTile(
      {super.key,
      required this.type,
      required this.label,
      required this.selection,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(label, style: formLabelStyle),
        ),
        const SizedBox(width: 8),
        if (type == 'pets' || type == 'category') ...[
          CircleAvatar(
            backgroundImage: AssetImage('images/$type/$image.png'),
            radius: 24 / 2,
          ),
          const SizedBox(width: 8),
        ],
        Text(selection, style: formSelectionStyle),
        const SizedBox(width: 8),
        rightArrowIcon,
      ],
    );
  }
}
