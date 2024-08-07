import 'package:fetch_application/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier {
  final List<Category> _categories = [
    Category(
        id: 'C001',
        title: "Vaccination Dose",
        description: "Quarterly Vaccination",
        image: "vaccination"),
    Category(
        id: 'C002',
        title: "Tick & Flea Check",
        description: "Monthly Checkup",
        image: "flea"),
    Category(
        id: 'C003',
        title: "Bath & Grooming",
        description: "Monthly Grooming",
        image: "grooming"),
  ];

  List<Category> get allCategories => _categories;
}
