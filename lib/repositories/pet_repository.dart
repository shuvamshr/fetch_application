import 'dart:convert';

import 'package:fetch_application/models/pet_model.dart';
import 'package:fetch_application/services/fastapi_service.dart';
import 'package:flutter/services.dart';

class PetRepository {
  List<Pet> _pets = [];
  final FastapiService _fastapiService = FastapiService();

  Future<List<Pet>> fetchPets() async {
    try {
      if (_pets.isEmpty) {
        _pets = await _fastapiService.fetchPets();
      }
      return _pets;
    } catch (e) {
      throw Exception("Error loading pets: $e");
    }
  }

  Future<void> addPet(Pet pet) async {}

  Future<void> updatePet(Pet pet) async {}

  Future<void> deletePet(String id) async {}
}
