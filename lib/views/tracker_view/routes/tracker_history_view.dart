import 'package:fetch_application/utils/constants/colors.dart';
import 'package:fetch_application/utils/constants/icons.dart';
import 'package:fetch_application/utils/constants/typography.dart';

import 'package:fetch_application/view_models/tracker_view_model.dart';
import 'package:fetch_application/views/tracker_view/widgets/app_bar.dart';
import 'package:fetch_application/views/tracker_view/widgets/app_body.dart';
import 'package:fetch_application/views/tracker_view/widgets/tracker_card_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrackerHistoryView extends StatelessWidget {
  const TrackerHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final trackerViewObservable = context.watch<TrackerViewModel>();
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
              "Tracker History",
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
          if (trackerViewObservable.trackersByPast.isNotEmpty)
            TrackerCardListView(
                title: "Past For All Pets",
                trackers: trackerViewObservable.trackersByPast),
          if (trackerViewObservable.trackersByPast.isEmpty)
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 128),
              child: Text(
                "No History Of Trackers",
                style: appBodyNoteStyle,
              ),
            ),
        ],
      ),
    );
  }
}
