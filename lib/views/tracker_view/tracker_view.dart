import 'package:fetch_application/utils/constants/colors.dart';
import 'package:fetch_application/utils/constants/icons.dart';
import 'package:fetch_application/utils/constants/typography.dart';
import 'package:fetch_application/view_models/category_view_model.dart';
import 'package:fetch_application/view_models/pet_view_model.dart';
import 'package:fetch_application/view_models/service_view_model.dart';
import 'package:fetch_application/view_models/tracker_view_model.dart';
import 'package:fetch_application/views/tracker_view/routes/add_tracker_view.dart';
import 'package:fetch_application/views/tracker_view/routes/schedule_history_view.dart';
import 'package:fetch_application/views/tracker_view/widgets/add_tracker_button.dart';
import 'package:fetch_application/views/tracker_view/widgets/app_body.dart';
import 'package:fetch_application/views/tracker_view/widgets/fetch_loading_indicator.dart';
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
    final petViewModel = context.watch<PetViewModel>();
    final trackerViewModel = context.watch<TrackerViewModel>();
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
