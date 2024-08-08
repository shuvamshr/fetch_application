import 'package:fetch_application/models/pet_model.dart';
import 'package:flutter/material.dart';

class PetViewModel extends ChangeNotifier {
  final List<Pet> _pets = [
    Pet(
        id: 'P001',
        name: 'Lumi',
        breed: 'Toy Poodle',
        gender: 'Female',
        dateOfBirth: DateTime(2012, 9, 3, 6, 30),
        deSexed: true,
        from: 'Pet Store',
        image: 'lumi'),
    Pet(
        id: 'P002',
        name: 'Yuki',
        breed: 'Pomeranian',
        gender: 'Female',
        dateOfBirth: DateTime(2017, 10, 30, 6, 30),
        deSexed: true,
        from: 'Pet Store',
        image: 'yuki'),
    Pet(
        id: 'P003',
        name: 'Flamingo',
        breed: 'Labrador',
        gender: 'Male',
        dateOfBirth: DateTime(2019, 12, 3, 6, 30),
        deSexed: false,
        from: 'Pet Store',
        image: 'default'),
  ];

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
