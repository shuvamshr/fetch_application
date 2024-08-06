import 'package:fetch_application/constants/typography.dart';
import 'package:fetch_application/models/tracker_model.dart';
import 'package:fetch_application/views/schedule/widgets/tracker_card.dart';
import 'package:flutter/material.dart';

class TrackerCardListView extends StatelessWidget {
  final String title;
  final List<Tracker> trackers;

  const TrackerCardListView({
    super.key,
    required this.title,
    required this.trackers,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(title, style: cardListTitleStyle)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  TrackerCard(tracker: trackers[index]),
              separatorBuilder: (context, _) => const SizedBox(height: 12),
              itemCount: trackers.length,
            ),
          ),
        ],
      ),
    );
  }
}
