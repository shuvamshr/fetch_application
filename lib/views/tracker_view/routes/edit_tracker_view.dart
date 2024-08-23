import 'package:fetch_application/models/tracker_model.dart';
import 'package:fetch_application/utils/constants/colors.dart';
import 'package:fetch_application/utils/constants/icons.dart';
import 'package:fetch_application/utils/constants/typography.dart';

import 'package:fetch_application/view_models/tracker_view_model.dart';
import 'package:fetch_application/views/tracker_view/routes/category_selector_view.dart';
import 'package:fetch_application/views/tracker_view/routes/pet_selector_view.dart';
import 'package:fetch_application/views/tracker_view/tracker_view.dart';
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

class EditTrackerView extends StatelessWidget {
  final Tracker tracker;

  const EditTrackerView({super.key, required this.tracker});

  @override
  Widget build(BuildContext context) {
    final trackerViewObservable = context.watch<TrackerViewModel>();
    final trackerViewAction = context.read<TrackerViewModel>();

    return Scaffold(
      backgroundColor: appBodyPrimaryBackground,
      appBar: FetchAppBar(
        children: [
          IconButton(
            icon: leftArrowIcon,
            onPressed: () => {
              Navigator.pop(context),
            },
          ),
          Expanded(
            child: Text(
              "Edit Tracker",
              style: appBarTitleStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: deleteIcon,
            onPressed: () => {
              trackerViewAction.deleteTracker(tracker.id),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TrackerView()),
              ),
            },
          )
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
                          pets: trackerViewObservable.allPets,
                          selectedPet: trackerViewObservable.selectedPet,
                          onOptionSelected: (pet) =>
                              trackerViewAction.selectedPet = pet)),
                ),
                child: FormTile(
                  type: "pets",
                  label: "Pet",
                  selection: trackerViewObservable.selectedPet.name,
                  image: trackerViewObservable.selectedPet.image,
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
                          categories: trackerViewObservable.allCategories,
                          selectedCategory:
                              trackerViewObservable.selectedCategory,
                          onOptionSelected: (category) =>
                              trackerViewAction.selectedCategory = category)),
                ),
                child: FormTile(
                  type: "category",
                  label: "Category",
                  selection: trackerViewObservable.selectedCategory.title,
                  image: trackerViewObservable.selectedCategory.image,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          FormSection(
            children: [
              DatePicker(
                initialDate: trackerViewObservable.selectedDateTime,
                onDateSelected: (date) =>
                    trackerViewAction.selectedDateTime = date,
              ),
              PriorityPicker(
                initialPriority: trackerViewObservable.selectedPriority,
                onPrioritySelected: (priority) =>
                    trackerViewAction.selectedPriority = priority,
              ),
            ],
          ),
          const SizedBox(height: 20),
          PrimaryButton(
            title: "Update Tracker",
            onPressed: () => {
              trackerViewAction.updateTracker(),
              Navigator.pop(context),
            },
          ),
        ],
      ),
    );
  }
}
