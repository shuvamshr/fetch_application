import 'package:fetch_application/constants/colors.dart';
import 'package:fetch_application/constants/icons.dart';
import 'package:fetch_application/constants/typography.dart';
import 'package:fetch_application/models/category_model.dart';

import 'package:fetch_application/views/schedule/widgets/app_bar.dart';
import 'package:fetch_application/views/schedule/widgets/app_body.dart';
import 'package:fetch_application/views/schedule/widgets/form_section.dart';
import 'package:fetch_application/views/schedule/widgets/option_tile.dart';
import 'package:flutter/material.dart';

class CategorySelectorView extends StatelessWidget {
  final List<Category> categories;
  final Category selectedCategory;
  final Function(Category) onOptionSelected;

  const CategorySelectorView({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBodyPrimaryBackground,
        appBar: FetchAppBar(
          children: [
            IconButton(
                onPressed: () => Navigator.pop(context), icon: leftArrowIcon),
            const Spacer(),
            Text("Select Category", style: appBarTitleStyle),
            const Spacer(),
          ],
        ),
        body: FetchAppBody(
          children: [
            FormSection(
              children: [
                for (var category in categories) ...[
                  GestureDetector(
                    onTap: () => {
                      onOptionSelected(category),
                      Navigator.pop(context),
                    },
                    child: OptionTile(
                      title: category.title,
                      type: 'category',
                      image: category.image,
                      isSelected: selectedCategory == category,
                    ),
                  )
                ],
              ],
            ),
          ],
        ));
  }
}
