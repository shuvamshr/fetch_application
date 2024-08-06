import 'package:fetch_application/views/schedule/schedule_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Fetch App',
      debugShowCheckedModeBanner: false,
      home: ScheduleView(),
    );
  }
}
