import 'package:fetch_application/models/category_model.dart';
import 'package:fetch_application/repositories/category_repository.dart';
import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier {
  final CategoryRepository _categoryRepository;
  List<Category> _categories = [];

  CategoryViewModel(this._categoryRepository);

  Future<void> updateData() async {
    _categories = await _categoryRepository.fetchCategories();
    notifyListeners();
  }

  void addPet(Category pet) async {
    await _categoryRepository.addCategory(pet);
    updateData();
  }

  void updatePet(Category pet) async {
    await _categoryRepository.updateCategory(pet);
    updateData();
  }

  void deletePet(String id) async {
    await _categoryRepository.deleteCategory(id);
    updateData();
  }
}
