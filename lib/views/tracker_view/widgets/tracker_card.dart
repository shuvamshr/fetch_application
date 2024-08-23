import 'package:fetch_application/utils/constants/colors.dart';
import 'package:fetch_application/utils/constants/icons.dart';
import 'package:fetch_application/utils/constants/typography.dart';
import 'package:fetch_application/models/tracker_model.dart';
import 'package:fetch_application/view_models/tracker_view_model.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TrackerCard extends StatelessWidget {
  final Tracker tracker;

  const TrackerCard({super.key, required this.tracker});

  @override
  Widget build(BuildContext context) {
    final trackerViewObservable = context.watch<TrackerViewModel>();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardPrimaryBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 52 / 2,
                backgroundImage: AssetImage(
                    'assets/images/pets/${tracker.getPet(trackerViewObservable.allPets).image}.png'),
              ),
              CircleAvatar(
                radius: 26 / 2,
                backgroundImage: AssetImage(
                    'assets/images/category/${tracker.getCategory(trackerViewObservable.allCategories).image}.png'),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tracker
                      .getCategory(trackerViewObservable.allCategories)
                      .title,
                  style: cardTitleStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  tracker
                      .getCategory(trackerViewObservable.allCategories)
                      .description,
                  style: cardSubheadingStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 8),
                Text(
                  DateFormat('dd MMM yyyy').format(tracker.dateTime),
                  style: cardFootnoteStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          rightArrowIcon,
        ],
      ),
    );
  }
}
