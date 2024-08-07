import 'package:fetch_application/constants/icons.dart';
import 'package:fetch_application/constants/typography.dart';
import 'package:flutter/cupertino.dart';

class FormLinkTile extends StatelessWidget {
  final String title;
  final String url;

  const FormLinkTile({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(title, style: formSelectionStyle),
        ),
        rightArrowIcon
      ],
    );
  }
}
