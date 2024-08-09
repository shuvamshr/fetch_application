import 'package:fetch_application/utils/constants/colors.dart';
import 'package:fetch_application/utils/constants/icons.dart';
import 'package:fetch_application/utils/constants/typography.dart';
import 'package:fetch_application/models/tracker_model.dart';

import 'package:fetch_application/view_models/tracker_view_model.dart';
import 'package:fetch_application/views/tracker_view/widgets/app_bar.dart';
import 'package:fetch_application/views/tracker_view/widgets/app_body.dart';
import 'package:fetch_application/views/tracker_view/widgets/form_link_tile.dart';
import 'package:fetch_application/views/tracker_view/widgets/form_section.dart';
import 'package:fetch_application/views/tracker_view/widgets/form_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackerDetailView extends StatelessWidget {
  final Tracker tracker;

  const TrackerDetailView({super.key, required this.tracker});

  @override
  Widget build(BuildContext context) {
    final trackerViewModel = Provider.of<TrackerViewModel>(context);

    final tailoredServices = trackerViewModel.getRecommendedServices(
        tracker.getPet(trackerViewModel.allPets),
        tracker.getCategory(trackerViewModel.allCategories));

    return Scaffold(
      backgroundColor: appBodyPrimaryBackground,
      appBar: FetchAppBar(
        children: [
          IconButton(
            icon: leftArrowIcon,
            onPressed: () => Navigator.pop(context),
          ),
          const Spacer(),
          Text(
              "${tracker.getCategory(trackerViewModel.allCategories).title} For ${tracker.getPet(trackerViewModel.allPets).name}",
              style: appBarTitleStyle),
          const Spacer(),
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
                selection: tracker.getPet(trackerViewModel.allPets).name,
                image: tracker.getPet(trackerViewModel.allPets).image,
                readOnly: true,
              ),
              FormTile(
                type: 'category',
                label: 'Category',
                selection:
                    tracker.getCategory(trackerViewModel.allCategories).title,
                image:
                    tracker.getCategory(trackerViewModel.allCategories).image,
                readOnly: true,
              ),
              FormTile(
                type: 'dateTime',
                label: 'Date',
                selection: DateFormat('dd MMM yyyy').format(tracker.dateTime),
                readOnly: true,
              ),
              FormTile(
                type: 'frequency',
                label: 'Frequency',
                selection: tracker
                    .getCategory(trackerViewModel.allCategories)
                    .description,
                readOnly: true,
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (tailoredServices.isNotEmpty)
            FormSection(
              title: "RECOMMENDED SERVICES",
              children: [
                for (var service in tailoredServices)
                  GestureDetector(
                    onTap: () => _launchURL(service.url),
                    child: FormLinkTile(title: service.title, url: service.url),
                  )
              ],
            ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
