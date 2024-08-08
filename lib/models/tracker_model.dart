import 'package:fetch_application/models/category_model.dart';
import 'package:fetch_application/models/pet_model.dart';
import 'package:fetch_application/view_models/category_view_model.dart';
import 'package:fetch_application/view_models/pet_view_model.dart';

class Tracker {
  final String id;
  final String petID;
  final String categoryID;
  final DateTime dateTime;

  Tracker({
    required this.id,
    required this.petID,
    required this.categoryID,
    required this.dateTime,
  });

  Pet getPet(PetViewModel petViewModel) {
    return petViewModel.getPetByID(petID);
  }

  Category getCategory(CategoryViewModel categoryViewModel) {
    return categoryViewModel.getCategoryByID(categoryID);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'petID': petID,
        'categoryID': categoryID,
        'dateTime': dateTime.toIso8601String(),
      };

  factory Tracker.fromJson(Map<String, dynamic> json) => Tracker(
        id: json['id'],
        petID: json['petID'],
        categoryID: json['categoryID'],
        dateTime: DateTime.parse(json['dateTime']),
      );
}
