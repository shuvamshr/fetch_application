import 'package:fetch_application/repositories/category_repository.dart';
import 'package:fetch_application/repositories/pet_repository.dart';
import 'package:fetch_application/repositories/medication_repository.dart';
import 'package:fetch_application/repositories/tracker_repository.dart';
import 'package:fetch_application/view_models/tracker_view_model.dart';
import 'package:fetch_application/views/tracker_view/tracker_view.dart';
import 'package:fetch_application/views/tracker_view/widgets/fetch_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  final trackerRepository = TrackerRepository();
  final petRepository = PetRepository();
  final categoryRepository = CategoryRepository();
  final medicationRepository = MedicationRepository();

  runApp(
    ChangeNotifierProvider(
      create: (_) => TrackerViewModel(
        trackerRepository,
        petRepository,
        categoryRepository,
        medicationRepository,
      ),
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
      home: TrackerView(),
    );
  }
}
