import 'package:fetch_application/utils/constants/colors.dart';
import 'package:fetch_application/utils/constants/icons.dart';
import 'package:fetch_application/utils/constants/typography.dart';

import 'package:fetch_application/view_models/tracker_view_model.dart';
import 'package:fetch_application/views/tracker_view/routes/category_selector_view.dart';
import 'package:fetch_application/views/tracker_view/routes/pet_selector_view.dart';
import 'package:fetch_application/views/tracker_view/widgets/app_bar.dart';
import 'package:fetch_application/views/tracker_view/widgets/app_body.dart';
import 'package:fetch_application/views/tracker_view/widgets/date_picker.dart';
import 'package:fetch_application/views/tracker_view/widgets/form_section.dart';
import 'package:fetch_application/views/tracker_view/widgets/form_tile.dart';
import 'package:fetch_application/views/tracker_view/widgets/priority_picker.dart';
import 'package:fetch_application/views/tracker_view/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AddTrackerView extends StatelessWidget {
  const AddTrackerView({super.key});

  @override
  Widget build(BuildContext context) {
    final trackerViewModel = context.watch<TrackerViewModel>();

    return Scaffold(
      backgroundColor: appBodyPrimaryBackground,
      appBar: FetchAppBar(
        children: [
          IconButton(
            icon: leftArrowIcon,
            onPressed: () => Navigator.pop(context),
          ),
          Expanded(
            child: Text(
              "Add New Tracker",
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
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => PetSelectorView(
                          pets: trackerViewModel.allPets,
                          selectedPet: trackerViewModel.selectedPet,
                          onOptionSelected: (pet) =>
                              trackerViewModel.selectedPet = pet)),
                ),
                child: FormTile(
                  type: "pets",
                  label: "Pet",
                  selection: trackerViewModel.selectedPet.name,
                  image: trackerViewModel.selectedPet.image,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          FormSection(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => CategorySelectorView(
                          categories: trackerViewModel.allCategories,
                          selectedCategory: trackerViewModel.selectedCategory,
                          onOptionSelected: (category) =>
                              trackerViewModel.selectedCategory = category)),
                ),
                child: FormTile(
                  type: "category",
                  label: "Category",
                  selection: trackerViewModel.selectedCategory.title,
                  image: trackerViewModel.selectedCategory.image,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          FormSection(
            children: [
              DatePicker(
                initialDate: trackerViewModel.selectedDateTime,
                onDateSelected: (date) =>
                    trackerViewModel.selectedDateTime = date,
              ),
              PriorityPicker(
                initialPriority: trackerViewModel.selectedPriority,
                onPrioritySelected: (priority) =>
                    trackerViewModel.selectedPriority = priority,
              ),
            ],
          ),
          const SizedBox(height: 20),
          PrimaryButton(
              title: "Add Tracker",
              onPressed: () => {
                    trackerViewModel.addTracker(),
                    Navigator.pop(context),
                  }),
        ],
      ),
    );
  }
}
