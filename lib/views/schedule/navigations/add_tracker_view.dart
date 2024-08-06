import 'package:fetch_application/constants/colors.dart';
import 'package:fetch_application/constants/icons.dart';
import 'package:fetch_application/constants/typography.dart';
import 'package:fetch_application/views/schedule/widgets/app_bar.dart';
import 'package:fetch_application/views/schedule/widgets/app_body.dart';
import 'package:fetch_application/views/schedule/widgets/form_section.dart';
import 'package:fetch_application/views/schedule/widgets/form_tile.dart';
import 'package:fetch_application/views/schedule/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class AddTrackerView extends StatelessWidget {
  const AddTrackerView({super.key});

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
          Text("Add New Tracker", style: appBarTitleStyle),
          const Spacer(),
        ],
      ),
      body: FetchAppBody(
        children: [
          const FormSection(
            children: [
              FormTile(
                type: "pets",
                label: "Pet",
                selection: "Lumi",
                image: "lumi",
              ),
            ],
          ),
          const SizedBox(height: 20),
          const FormSection(
            children: [
              FormTile(
                type: "category",
                label: "Category",
                selection: "Vaccination",
                image: "vaccination",
              ),
            ],
          ),
          const SizedBox(height: 20),
          const FormSection(
            children: [
              FormTile(
                type: "dateTime",
                label: "Date",
                selection: "Jan 11 2024",
              ),
              FormTile(
                type: "frequency",
                label: "Frequency",
                selection: "Monthly",
              ),
            ],
          ),
          const SizedBox(height: 20),
          PrimaryButton(
              title: "Add Tracker", onPressed: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
