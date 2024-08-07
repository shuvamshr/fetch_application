import 'package:fetch_application/constants/colors.dart';
import 'package:fetch_application/constants/icons.dart';
import 'package:fetch_application/constants/typography.dart';
import 'package:fetch_application/models/tracker_model.dart';
import 'package:fetch_application/view_models/service_view_model.dart';
import 'package:fetch_application/views/schedule/widgets/app_bar.dart';
import 'package:fetch_application/views/schedule/widgets/app_body.dart';
import 'package:fetch_application/views/schedule/widgets/form_link_tile.dart';
import 'package:fetch_application/views/schedule/widgets/form_section.dart';
import 'package:fetch_application/views/schedule/widgets/form_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackerDetailView extends StatelessWidget {
  final Tracker tracker;

  TrackerDetailView({super.key, required this.tracker});

  @override
  Widget build(BuildContext context) {
    final serviceViewModel = Provider.of<ServiceViewModel>(context);

    final tailoredServices =
        serviceViewModel.getTailoredServices(tracker.pet, tracker.category);

    return Scaffold(
      backgroundColor: appBodyPrimaryBackground,
      appBar: FetchAppBar(
        children: [
          IconButton(
            icon: leftArrowIcon,
            onPressed: () => Navigator.pop(context),
          ),
          const Spacer(),
          Text("${tracker.category.title} For ${tracker.pet.name}",
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
                selection: tracker.pet.name,
                image: tracker.pet.image,
                readOnly: true,
              ),
              FormTile(
                type: 'category',
                label: 'Category',
                selection: tracker.category.title,
                image: tracker.category.image,
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
                selection: tracker.category.description,
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
