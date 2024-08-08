import 'package:fetch_application/view_models/category_view_model.dart';
import 'package:fetch_application/view_models/pet_view_model.dart';
import 'package:fetch_application/view_models/service_view_model.dart';
import 'package:fetch_application/view_models/tracker_view_model.dart';
import 'package:fetch_application/views/tracker_view/tracker_view.dart';
import 'package:fetch_application/views/tracker_view/widgets/fetch_loading_indicator.dart';
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

  Future<void> loadData(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 4));
    final petViewModel = context.read<PetViewModel>();
    final trackerViewModel = context.read<TrackerViewModel>();
    final categoryViewModel = context.read<CategoryViewModel>();
    final serviceViewModel = context.read<ServiceViewModel>();

    await Future.wait([
      petViewModel.loadPet(),
      trackerViewModel.loadTracker(),
      categoryViewModel.loadCategory(),
      serviceViewModel.loadService()
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch App',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<void>(
          future: loadData(context),
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
