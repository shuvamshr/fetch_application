import 'dart:convert';

import 'package:fetch_application/models/category_model.dart';
import 'package:fetch_application/services/fastapi_service.dart';
import 'package:flutter/services.dart';

class CategoryRepository {
  List<Category> _categories = [];
  final FastapiService _fastapiService = FastapiService();

  Future<List<Category>> fetchCategories() async {
    try {
      if (_categories.isEmpty) {
        _categories = await _fastapiService.fetchCategories();
      }
      return _categories;
    } catch (e) {
      throw Exception("Error loading categories: $e");
    }
  }

  Future<void> addCategory(Category category) async {}

  Future<void> updateCategory(Category category) async {}

  Future<void> deleteCategory(String id) async {}
}
