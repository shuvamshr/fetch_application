import 'package:fetch_application/constants/icons.dart';
import 'package:fetch_application/constants/typography.dart';
import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final String title;
  final String type;
  final String image;
  final bool isSelected;

  const OptionTile(
      {super.key,
      required this.title,
      required this.type,
      required this.image,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (type == 'pets' || type == 'category') ...[
          CircleAvatar(
            backgroundImage: AssetImage('images/$type/$image.png'),
            radius: 24 / 2,
          ),
          const SizedBox(width: 8),
        ],
        const SizedBox(width: 8),
        Expanded(
          child: Text(title, style: formSelectionStyle),
        ),
        if (isSelected) ...[
          const SizedBox(width: 8),
          checkmarkIcon,
        ]
      ],
    );
  }
}
