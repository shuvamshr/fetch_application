import 'dart:convert';

import 'package:fetch_application/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryViewModel extends ChangeNotifier {
  List<Category> _categories = [];

  Future<void> loadCategory() async {
    try {
      final jsonString = await rootBundle.loadString('data/category_data.json');
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final List<dynamic> jsonList = jsonMap['categories'];

      _categories = jsonList.map((json) => Category.fromJson(json)).toList();
    } catch (e) {
      // ignore: avoid_print
      print("Error loading category: $e");
    } finally {
      notifyListeners();
    }
  }

  List<Category> get allCategories => _categories;

  Category getCategoryByID(String id) {
    return _categories.firstWhere((item) => item.id == id);
  }
}
