import 'package:fetch_application/constants/colors.dart';
import 'package:flutter/material.dart';

class FormSection extends StatelessWidget {
  final List<Widget> children;
  const FormSection({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: formSecondaryForeground,
                ),
              ),
          itemCount: children.length),
    );
  }
}
