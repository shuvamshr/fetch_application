import 'dart:convert';

import 'package:fetch_application/models/pet_model.dart';
import 'package:flutter/services.dart';

class PetRepository {
  Future<List<Pet>> fetchPets() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/data/pet_data.json');
      final Map<String, dynamic> jsonMap = await jsonDecode(jsonString);
      final List<dynamic> jsonList = await jsonMap['pets'];

      List<Pet> pets = jsonList.map((json) => Pet.fromJson(json)).toList();
      return pets;
    } catch (e) {
      throw Exception("Error loading pets: $e");
    }
  }

  Future<void> addPet(Pet pet) async {}

  Future<void> updatePet(Pet pet) async {}

  Future<void> deletePet(String id) async {}
}
