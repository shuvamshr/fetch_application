import 'package:fetch_application/utils/constants/colors.dart';
import 'package:fetch_application/utils/constants/icons.dart';
import 'package:fetch_application/utils/constants/typography.dart';

import 'package:fetch_application/view_models/tracker_view_model.dart';
import 'package:fetch_application/views/tracker_view/routes/add_tracker_view.dart';
import 'package:fetch_application/views/tracker_view/routes/tracker_history_view.dart';
import 'package:fetch_application/views/tracker_view/widgets/add_tracker_button.dart';
import 'package:fetch_application/views/tracker_view/widgets/app_body.dart';

import 'package:fetch_application/views/tracker_view/widgets/filter_tab_list_view.dart';

import 'package:fetch_application/views/tracker_view/widgets/tracker_card_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fetch_application/views/tracker_view/widgets/app_bar.dart';
import 'package:provider/provider.dart';

class TrackerView extends StatelessWidget {
  const TrackerView({super.key});

  @override
  Widget build(BuildContext context) {
    final trackerViewAction = context.read<TrackerViewModel>();
    final trackerViewObservable = context.watch<TrackerViewModel>();

    return Scaffold(
      backgroundColor: appBodyPrimaryBackground,
      appBar: FetchAppBar(
        children: [
          IconButton(
            icon: leftArrowIcon,
            onPressed: () => {},
          ),
          Expanded(
            child: Text(
              "Schedule Tracker",
              style: appBarTitleStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: historyIcon,
            onPressed: () => Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => const TrackerHistoryView()),
            ),
          ),
        ],
      ),
      body: FetchAppBody(
        children: [
          FilterTabListView(
            pets: trackerViewObservable.allPets,
            onTabSelected: (pet) => {trackerViewAction.activePet = pet},
            activePet: trackerViewObservable.activePet,
          ),
          if (trackerViewObservable.trackersByToday.isNotEmpty)
            TrackerCardListView(
              title: "For ${trackerViewObservable.activePet.name} Today",
              trackers: trackerViewObservable.trackersByToday,
            ),
          if (trackerViewObservable.trackersByUpcoming.isNotEmpty)
            TrackerCardListView(
              title: "Upcoming For ${trackerViewObservable.activePet.name}",
              trackers: trackerViewObservable.trackersByUpcoming,
            ),
          if (trackerViewObservable.trackersByToday.isEmpty &&
              trackerViewObservable.trackersByUpcoming.isEmpty)
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 128),
              child: Text(
                "No Upcoming For ${trackerViewObservable.activePet.name}",
                style: appBodyNoteStyle,
              ),
            ),
          const SizedBox(height: 80),
        ],
      ),
      floatingActionButton: AddTrackerButton(
        onPressed: () => {
          trackerViewAction.initializeForAdd(),
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => const AddTrackerView()),
          ),
        },
      ),
    );
  }
}
