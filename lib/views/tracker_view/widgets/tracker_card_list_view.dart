import 'package:fetch_application/utils/constants/typography.dart';
import 'package:fetch_application/models/tracker_model.dart';
import 'package:fetch_application/views/tracker_view/routes/tracker_detail_view.dart';
import 'package:fetch_application/views/tracker_view/widgets/tracker_card.dart';
import 'package:flutter/cupertino.dart';

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
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(title, style: cardListTitleStyle)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => TrackerDetailView(
                            tracker: trackers[index],
                          )),
                ),
                child: TrackerCard(tracker: trackers[index]),
              ),
              separatorBuilder: (context, _) => const SizedBox(height: 12),
              itemCount: trackers.length,
            ),
          ),
        ],
      ),
    );
  }
}
