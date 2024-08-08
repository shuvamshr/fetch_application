import 'package:fetch_application/models/category_model.dart';
import 'package:fetch_application/models/pet_model.dart';
import 'package:fetch_application/models/service_model.dart';
import 'package:flutter/cupertino.dart';

class ServiceViewModel extends ChangeNotifier {
  final List<Service> _services = [
    Service(
      id: 'S001',
      title: 'H1N1 Vaccination',
      url: "http://www.google.com",
      categoryID: 'C002',
      forBreed: ['Toy Poodle', 'Pomeranian'],
      forGender: ['Female', 'Male'],
      forDesexed: [false, true],
      forAge: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17],
    ),
    Service(
      id: 'S002',
      title: 'Annual Checkup',
      url: "http://www.google.com",
      categoryID: 'C001',
      forBreed: ['Toy Poodle', 'Pomeranian', 'Labrador'],
      forGender: ['Female'],
      forDesexed: [true],
      forAge: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
    ),
    Service(
      id: 'S003',
      title: 'Teeth Cleaning',
      url: "http://www.google.com",
      categoryID: 'C003',
      forBreed: ['Toy Poodle', 'Pomeranian', 'Labrador'],
      forGender: ['Female', 'Male'],
      forDesexed: [false, true],
      forAge: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    ),
    Service(
      id: 'S004',
      title: 'Parasite Control',
      url: "http://www.google.com",
      categoryID: 'C004',
      forBreed: ['Toy Poodle', 'Pomeranian', 'Labrador'],
      forGender: ['Female', 'Male'],
      forDesexed: [false, true],
      forAge: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    ),
    Service(
      id: 'S005',
      title: 'Routine Blood Tests',
      url: "http://www.google.com",
      categoryID: 'C005',
      forBreed: ['Toy Poodle', 'Pomeranian', 'Labrador'],
      forGender: ['Female', 'Male'],
      forDesexed: [false, true],
      forAge: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    ),
  ];

  List<Service> getTailoredServices(Pet pet, Category category) {
    final petAge =
        (DateTime.now().difference(pet.dateOfBirth).inDays / 365).ceil();

    return _services.where((service) {
      final matchesCategory = service.categoryID == category.id;
      final matchesBreed = service.forBreed.contains(pet.breed);
      final matchesGender = service.forGender.contains(pet.gender);
      final matchesDesexed = service.forDesexed.contains(pet.deSexed);
      final matchesAge = service.forAge.contains(petAge);

      return matchesCategory &&
          matchesBreed &&
          matchesGender &&
          matchesDesexed &&
          matchesAge;
    }).toList();
  }
}
