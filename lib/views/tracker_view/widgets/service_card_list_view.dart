import 'package:fetch_application/models/service_model.dart';
import 'package:fetch_application/utils/constants/typography.dart';
import 'package:fetch_application/views/tracker_view/widgets/service_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceCardListView extends StatelessWidget {
  final String title;
  final List<Service> services;

  const ServiceCardListView({
    super.key,
    required this.services,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Text(title.toUpperCase(), style: formSectionTitleStyle)),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => _launchURL(services[index].url),
            child: ServiceCard(service: services[index]),
          ),
          separatorBuilder: (context, _) => const SizedBox(height: 12),
          itemCount: services.length,
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}

void _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
