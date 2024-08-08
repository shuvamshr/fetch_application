import 'package:fetch_application/constants/colors.dart';
import 'package:fetch_application/constants/icons.dart';
import 'package:fetch_application/constants/typography.dart';
import 'package:fetch_application/models/tracker_model.dart';
import 'package:fetch_application/view_models/category_view_model.dart';
import 'package:fetch_application/view_models/pet_view_model.dart';
import 'package:fetch_application/view_models/service_view_model.dart';
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
    final petViewModel = Provider.of<PetViewModel>(context);
    final categoryViewModel = Provider.of<CategoryViewModel>(context);
    final serviceViewModel = Provider.of<ServiceViewModel>(context);

    final tailoredServices = serviceViewModel.getTailoredServices(
        tracker.getPet(petViewModel), tracker.getCategory(categoryViewModel));

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
              "${tracker.getCategory(categoryViewModel).title} For ${tracker.getPet(petViewModel).name}",
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
                selection: tracker.getPet(petViewModel).name,
                image: tracker.getPet(petViewModel).image,
                readOnly: true,
              ),
              FormTile(
                type: 'category',
                label: 'Category',
                selection: tracker.getCategory(categoryViewModel).title,
                image: tracker.getCategory(categoryViewModel).image,
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
                selection: tracker.getCategory(categoryViewModel).description,
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
