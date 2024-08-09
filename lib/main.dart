import 'package:fetch_application/repositories/category_repository.dart';
import 'package:fetch_application/repositories/pet_repository.dart';
import 'package:fetch_application/repositories/service_repository.dart';
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
  final serviceRepository = ServiceRepository();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TrackerViewModel(
            trackerRepository,
            petRepository,
            categoryRepository,
            serviceRepository,
          ),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Future<void> simulateLoading(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    final trackerViewModel = context.read<TrackerViewModel>();

    await Future.wait([trackerViewModel.updateData()]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch App',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<void>(
          future: simulateLoading(context),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error loading data: ${snapshot.error}');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: FetchLoadingIndicator());
            } else {
              return const TrackerView();
            }
          }),
    );
  }
}
