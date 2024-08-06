import 'package:fetch_application/models/category_model.dart';
import 'package:fetch_application/models/pet_model.dart';

class Tracker {
  final String id;
  final Pet pet;
  final Category category;
  final DateTime dateTime;

  Tracker({
    required this.id,
    required this.pet,
    required this.category,
    required this.dateTime,
  });
}
