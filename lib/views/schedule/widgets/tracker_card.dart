import 'package:fetch_application/constants/colors.dart';
import 'package:fetch_application/constants/icons.dart';
import 'package:fetch_application/constants/typography.dart';
import 'package:fetch_application/models/tracker_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrackerCard extends StatelessWidget {
  final Tracker tracker;

  const TrackerCard({super.key, required this.tracker});

  @override
  Widget build(BuildContext context) {
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
                backgroundImage:
                    AssetImage('images/pets/${tracker.pet.image}.png'),
              ),
              CircleAvatar(
                radius: 26 / 2,
                backgroundImage:
                    AssetImage('images/category/${tracker.category.image}.png'),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tracker.category.title, style: cardTitleStyle),
                Text(tracker.category.description, style: cardSubheadingStyle),
                const SizedBox(height: 8),
                Text(DateFormat('dd MMM yyyy').format(tracker.dateTime),
                    style: cardFootnoteStyle),
              ],
            ),
          ),
          const SizedBox(width: 16),
          rightArrowIcon,
        ],
      ),
    );
  }
}
