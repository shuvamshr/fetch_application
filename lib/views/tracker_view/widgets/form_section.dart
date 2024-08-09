import 'package:fetch_application/utils/constants/colors.dart';
import 'package:fetch_application/utils/constants/typography.dart';
import 'package:flutter/material.dart';

class FormSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const FormSection({super.key, this.title = '', required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) ...[
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Text(title.toUpperCase(), style: formSectionTitleStyle)),
        ],
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: formPrimaryBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => children[index],
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Divider(
                color: formTertiaryForeground,
              ),
            ),
            itemCount: children.length,
          ),
        ),
      ],
    );
  }
}
