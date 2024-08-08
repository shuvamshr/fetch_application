import 'dart:convert';

import 'package:fetch_application/models/pet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PetViewModel extends ChangeNotifier {
  List<Pet> _pets = [];

  PetViewModel() {
    loadPet();
  }

  Future<void> loadPet() async {
    try {
      final jsonString = await rootBundle.loadString('data/pet_data.json');
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final List<dynamic> jsonList = jsonMap['pets'];

      _pets = jsonList.map((json) => Pet.fromJson(json)).toList();
    } catch (e) {
      // ignore: avoid_print
      print("Error loading pet: $e");
    } finally {
      notifyListeners();
    }
  }

  List<Pet> get allPets => _pets;

  Pet getPetByID(String id) {
    return _pets.firstWhere((item) => item.id == id);
  }

  String getPetName(String id) {
    if (id == '000') {
      return "All Pets";
    } else {
      var pet = _pets.firstWhere((item) => item.id == id);
      return pet.name;
    }
  }
}
