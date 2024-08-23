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
      create: (context) => TrackerViewModel(
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
    final trackerViewModel = context.read<TrackerViewModel>();
    return MaterialApp(
      title: 'Fetch App',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<void>(
        future: trackerViewModel.updateData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error loading data: ${snapshot.error}');
            } else {
              return const TrackerView();
            }
          } else {
            return const Center(child: FetchLoadingIndicator());
          }
        },
      ),
    );
  }
}
