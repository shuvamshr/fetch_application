import 'package:fetch_application/constants/colors.dart';
import 'package:fetch_application/constants/icons.dart';
import 'package:fetch_application/constants/typography.dart';

import 'package:fetch_application/models/tracker_model.dart';
import 'package:fetch_application/views/schedule/widgets/app_bar.dart';
import 'package:fetch_application/views/schedule/widgets/app_body.dart';
import 'package:fetch_application/views/schedule/widgets/tracker_card_list_view.dart';
import 'package:flutter/material.dart';

class ScheduleHistoryView extends StatelessWidget {
  final List<Tracker> trackers;
  const ScheduleHistoryView({super.key, required this.trackers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBodyPrimaryBackground,
      appBar: FetchAppBar(
        children: [
          IconButton(
            icon: leftArrowIcon,
            onPressed: () => Navigator.pop(context),
          ),
          const Spacer(),
          Text("Schedule History", style: appBarTitleStyle),
          const Spacer(),
        ],
      ),
      body: FetchAppBody(children: [
        if (trackers.isNotEmpty)
          TrackerCardListView(title: "Past For All Pets", trackers: trackers),
        if (trackers.isEmpty)
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 128),
            child: Text(
              "No History Of Trackers",
              style: appBodyNoteStyle,
            ),
          )
      ]),
    );
  }
}
