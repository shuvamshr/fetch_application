import 'package:fetch_application/constants/colors.dart';
import 'package:fetch_application/constants/icons.dart';
import 'package:fetch_application/constants/typography.dart';
import 'package:fetch_application/view_models/pet_view_model.dart';
import 'package:fetch_application/view_models/tracker_view_model.dart';
import 'package:fetch_application/views/schedule/navigations/add_tracker_view.dart';
import 'package:fetch_application/views/schedule/navigations/schedule_history_view.dart';
import 'package:fetch_application/views/schedule/widgets/add_tracker_button.dart';
import 'package:fetch_application/views/schedule/widgets/app_body.dart';
import 'package:fetch_application/views/schedule/widgets/filter_tab_list_view.dart';

import 'package:fetch_application/views/schedule/widgets/tracker_card_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fetch_application/views/schedule/widgets/app_bar.dart';
import 'package:provider/provider.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({super.key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  @override
  Widget build(BuildContext context) {
    final petViewModel = Provider.of<PetViewModel>(context);
    final trackerViewModel = Provider.of<TrackerViewModel>(context);

    return Scaffold(
      backgroundColor: appBodyPrimaryBackground,
      appBar: FetchAppBar(
        children: [
          IconButton(
            icon: leftArrowIcon,
            onPressed: () => {},
          ),
          const Spacer(),
          Text("Schedule", style: appBarTitleStyle),
          const Spacer(),
          IconButton(
            icon: historyIcon,
            onPressed: () => Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => ScheduleHistoryView(
                      trackers: trackerViewModel.trackersByPast)),
            ),
          ),
        ],
      ),
      body: FetchAppBody(
        children: [
          FilterTabListView(
            pets: petViewModel.allPets,
            onTabSelected: (pet) => trackerViewModel.activePet = pet,
            activePet: trackerViewModel.activePet,
          ),
          if (trackerViewModel.trackersByToday.isNotEmpty)
            TrackerCardListView(
              title:
                  "For ${petViewModel.getPetName(trackerViewModel.activePet.id)} Today",
              trackers: trackerViewModel.trackersByToday,
            ),
          if (trackerViewModel.trackersByUpcoming.isNotEmpty)
            TrackerCardListView(
              title:
                  "Upcoming For ${petViewModel.getPetName(trackerViewModel.activePet.id)}",
              trackers: trackerViewModel.trackersByUpcoming,
            ),
          if (trackerViewModel.trackersByToday.isEmpty &&
              trackerViewModel.trackersByUpcoming.isEmpty)
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 128),
              child: Text(
                "No Upcoming For ${petViewModel.getPetName(trackerViewModel.activePet.id)}",
                style: appBodyNoteStyle,
              ),
            ),
          const SizedBox(height: 80),
        ],
      ),
      floatingActionButton: AddTrackerButton(
          onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => const AddTrackerView()),
              )),
    );
  }
}
