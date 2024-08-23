import 'package:fetch_application/utils/constants/colors.dart';
import 'package:fetch_application/utils/constants/icons.dart';
import 'package:fetch_application/utils/constants/typography.dart';

import 'package:fetch_application/view_models/tracker_view_model.dart';
import 'package:fetch_application/views/tracker_view/routes/edit_tracker_view.dart';
import 'package:fetch_application/views/tracker_view/widgets/app_bar.dart';
import 'package:fetch_application/views/tracker_view/widgets/app_body.dart';

import 'package:fetch_application/views/tracker_view/widgets/form_section.dart';
import 'package:fetch_application/views/tracker_view/widgets/form_tile.dart';
import 'package:fetch_application/views/tracker_view/widgets/medication_card_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TrackerDetailView extends StatelessWidget {
  final String trackerID;

  const TrackerDetailView({super.key, required this.trackerID});

  @override
  Widget build(BuildContext context) {
    final trackerViewObservable = context.watch<TrackerViewModel>();
    final trackerViewAction = context.read<TrackerViewModel>();

    final tracker = trackerViewObservable.allTrackers
        .firstWhere((item) => item.id == trackerID);

    final recommendedMedications =
        trackerViewObservable.getRecommendedMedications(
            tracker.getPet(trackerViewObservable.allPets),
            tracker.getCategory(trackerViewObservable.allCategories));

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
              tracker.getCategory(trackerViewObservable.allCategories).title,
              style: appBarTitleStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
              icon: editIcon,
              onPressed: () => {
                    trackerViewAction.initializeForEdit(tracker),
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => EditTrackerView(tracker: tracker),
                      ),
                    ),
                  }),
        ],
      ),
      body: FetchAppBody(
        children: [
          FormSection(
            title: 'Tracker Detail',
            children: [
              FormTile(
                type: 'pets',
                label: 'Pet',
                selection: tracker.getPet(trackerViewObservable.allPets).name,
                image: tracker.getPet(trackerViewObservable.allPets).image,
                readOnly: true,
              ),
              FormTile(
                type: 'category',
                label: 'Category',
                selection: tracker
                    .getCategory(trackerViewObservable.allCategories)
                    .title,
                image: tracker
                    .getCategory(trackerViewObservable.allCategories)
                    .image,
                readOnly: true,
              ),
              FormTile(
                type: 'dateTime',
                label: 'Date',
                selection: DateFormat('dd MMM yyyy').format(tracker.dateTime),
                readOnly: true,
              ),
              FormTile(
                type: 'priority',
                label: 'Priority',
                selection: tracker.priority,
                readOnly: true,
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (recommendedMedications.isNotEmpty)
            MedicationCardListView(
                medications: recommendedMedications,
                title: "Recommended Medications")
        ],
      ),
    );
  }
}
