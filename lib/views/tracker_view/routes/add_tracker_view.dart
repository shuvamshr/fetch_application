import 'package:fetch_application/constants/colors.dart';
import 'package:fetch_application/constants/icons.dart';
import 'package:fetch_application/constants/typography.dart';
import 'package:fetch_application/view_models/category_view_model.dart';
import 'package:fetch_application/view_models/pet_view_model.dart';
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
    final petViewModel = context.watch<PetViewModel>();
    final categoryViewModel = context.watch<CategoryViewModel>();

    return Scaffold(
      backgroundColor: appBodyPrimaryBackground,
      appBar: FetchAppBar(
        children: [
          IconButton(
            icon: leftArrowIcon,
            onPressed: () => Navigator.pop(context),
          ),
          const Spacer(),
          Text("Add New Tracker", style: appBarTitleStyle),
          const Spacer(),
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
                          pets: petViewModel.allPets,
                          selectedPet: trackerViewModel.selectedPet.id == '000'
                              ? petViewModel.allPets.first
                              : trackerViewModel.selectedPet,
                          onOptionSelected: (pet) =>
                              trackerViewModel.selectedPet = pet)),
                ),
                child: FormTile(
                  type: "pets",
                  label: "Pet",
                  selection: trackerViewModel.selectedPet.id == '000'
                      ? petViewModel.allPets.first.name
                      : trackerViewModel.selectedPet.name,
                  image: trackerViewModel.selectedPet.id == '000'
                      ? petViewModel.allPets.first.image
                      : trackerViewModel.selectedPet.image,
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
                          categories: categoryViewModel.allCategories,
                          selectedCategory:
                              trackerViewModel.selectedCategory.id == '000'
                                  ? categoryViewModel.allCategories.first
                                  : trackerViewModel.selectedCategory,
                          onOptionSelected: (category) =>
                              trackerViewModel.selectedCategory = category)),
                ),
                child: FormTile(
                  type: "category",
                  label: "Category",
                  selection: trackerViewModel.selectedCategory.id == '000'
                      ? categoryViewModel.allCategories.first.title
                      : trackerViewModel.selectedCategory.title,
                  image: trackerViewModel.selectedCategory.id == '000'
                      ? categoryViewModel.allCategories.first.image
                      : trackerViewModel.selectedCategory.image,
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
                    trackerViewModel.addNewTracker(),
                    Navigator.pop(context),
                  }),
        ],
      ),
    );
  }
}
