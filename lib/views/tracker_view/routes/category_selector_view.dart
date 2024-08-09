import 'package:fetch_application/utils/constants/colors.dart';
import 'package:fetch_application/utils/constants/icons.dart';
import 'package:fetch_application/utils/constants/typography.dart';
import 'package:fetch_application/models/category_model.dart';

import 'package:fetch_application/views/tracker_view/widgets/app_bar.dart';
import 'package:fetch_application/views/tracker_view/widgets/app_body.dart';
import 'package:fetch_application/views/tracker_view/widgets/form_section.dart';
import 'package:fetch_application/views/tracker_view/widgets/option_tile.dart';
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
            Expanded(
              child: Text(
                "Select Category",
                style: appBarTitleStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 24),
          ],
        ),
        body: FetchAppBody(
          children: [
            FormSection(
              title: "External Treatment",
              children: [
                for (var category
                    in categories.where((item) => item.type == 'External')) ...[
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
            const SizedBox(height: 12),
            FormSection(
              title: "Internal Treatment",
              children: [
                for (var category
                    in categories.where((item) => item.type == 'Internal')) ...[
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
            const SizedBox(height: 80),
          ],
        ));
  }
}
