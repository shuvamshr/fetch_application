import 'package:fetch_application/constants/icons.dart';
import 'package:fetch_application/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:fetch_application/views/schedule/widgets/app_bar.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({super.key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FetchAppBar(
        children: [
          IconButton(
            icon: leftArrowIcon,
            onPressed: () => {},
          ),
          const Spacer(),
          Text("Schedule", style: appBarTitleStyle),
          const Spacer(),
          IconButton(
            icon: historyIcon,
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
