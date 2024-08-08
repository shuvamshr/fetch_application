import 'package:fetch_application/view_models/category_view_model.dart';
import 'package:fetch_application/view_models/pet_view_model.dart';
import 'package:fetch_application/view_models/service_view_model.dart';
import 'package:fetch_application/view_models/tracker_view_model.dart';
import 'package:fetch_application/views/schedule/schedule_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PetViewModel()),
        ChangeNotifierProvider(create: (_) => CategoryViewModel()),
        ChangeNotifierProvider(create: (_) => ServiceViewModel()),
        ChangeNotifierProvider(
          create: (context) => TrackerViewModel(
            petViewModel: Provider.of<PetViewModel>(context, listen: false),
            categoryViewModel:
                Provider.of<CategoryViewModel>(context, listen: false),
          ),
        ),
      ],
      child: const MainApp(),
    ),
  );
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
