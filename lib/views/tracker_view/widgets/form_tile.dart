import 'package:fetch_application/utils/constants/icons.dart';
import 'package:fetch_application/utils/constants/typography.dart';
import 'package:flutter/material.dart';

class FormTile extends StatelessWidget {
  final String type;
  final String label;
  final String selection;
  final String? image;
  final bool readOnly;

  const FormTile(
      {super.key,
      required this.type,
      required this.label,
      required this.selection,
      this.readOnly = false,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(label, style: formLabelStyle),
        ),
        const SizedBox(width: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (type == 'pets' || type == 'category') ...[
              CircleAvatar(
                backgroundImage: AssetImage('images/$type/$image.png'),
                radius: 24 / 2,
              ),
              const SizedBox(width: 8),
            ],
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 2),
              child: Text(
                selection,
                style: formSelectionStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (!readOnly) ...[
              const SizedBox(width: 8),
              rightArrowIcon,
            ],
          ],
        ),
      ],
    );
  }
}
