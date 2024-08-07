import 'package:fetch_application/models/pet_model.dart';
import 'package:flutter/material.dart';

class PetViewModel extends ChangeNotifier {
  final List<Pet> _pets = [
    Pet(id: 'P001', name: 'Lumi', image: 'lumi'),
    Pet(id: 'P002', name: 'Yuki', image: 'yuki'),
    Pet(id: 'P003', name: 'Flamingo', image: 'default'),
  ];

  List<Pet> get allPets => _pets;

  String getPetName(String id) {
    if (id == '000') {
      return "All Pets";
    } else {
      var pet = _pets.firstWhere((item) => item.id == id);
      return pet.name;
    }
  }
}
