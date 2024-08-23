import 'dart:convert';

import 'package:fetch_application/models/category_model.dart';
import 'package:flutter/services.dart';

class CategoryRepository {
  Future<List<Category>> fetchCategories() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/data/category_data.json');
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final List<dynamic> jsonList = jsonMap['categories'];

      List<Category> categories =
          jsonList.map((json) => Category.fromJson(json)).toList();
      return categories;
    } catch (e) {
      throw Exception("Error loading categories: $e");
    }
  }

  Future<void> addCategory(Category category) async {}

  Future<void> updateCategory(Category category) async {}

  Future<void> deleteCategory(String id) async {}
}
