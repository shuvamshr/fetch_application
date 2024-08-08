import 'package:fetch_application/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier {
  final List<Category> _categories = [
    Category(
        id: 'C001',
        title: "Vet Checkup",
        description: "Yearly health assessment",
        image: "vaccination"),
    Category(
        id: 'C002',
        title: "Vaccinations",
        description: "Immunization shots",
        image: "vaccination"),
    Category(
        id: 'C003',
        title: "Dental Checkup",
        description: "Oral health maintenance",
        image: "vaccination"),
    Category(
        id: 'C004',
        title: "Parasite Control",
        description: "Prevent fleas and ticks",
        image: "vaccination"),
    Category(
        id: 'C005',
        title: "Blood Tests",
        description: "Routine blood analysis",
        image: "vaccination"),
    Category(
        id: 'C006',
        title: "Spaying/Neutering",
        description: "Surgical sterilization",
        image: "vaccination"),
    Category(
        id: 'C007',
        title: "Microchipping",
        description: "Permanent ID chip",
        image: "vaccination"),
    Category(
        id: 'C008',
        title: "Weight & Nutrition",
        description: "Diet and weight management",
        image: "vaccination"),
    Category(
        id: 'C009',
        title: "Senior Dog Care",
        description: "Care for older dogs",
        image: "vaccination"),
    Category(
        id: 'C010',
        title: "Allergy Testing",
        description: "Identify allergies",
        image: "vaccination"),
  ];

  List<Category> get allCategories => _categories;

  Category getCategoryByID(String id) {
    return _categories.firstWhere((item) => item.id == id);
  }
}
