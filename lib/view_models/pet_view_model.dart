import 'package:fetch_application/models/pet_model.dart';
import 'package:fetch_application/repositories/pet_repository.dart';
import 'package:flutter/material.dart';

class PetViewModel extends ChangeNotifier {
  final PetRepository _petRepository;
  List<Pet> _pets = [];

  PetViewModel(this._petRepository);

  Future<void> updateData() async {
    _pets = await _petRepository.fetchPets();
    notifyListeners();
  }

  void addPet(Pet pet) async {
    await _petRepository.addPet(pet);
    updateData();
  }

  void updatePet(Pet pet) async {
    await _petRepository.updatePet(pet);
    updateData();
  }

  void deletePet(String id) async {
    await _petRepository.deletePet(id);
    updateData();
  }
}
