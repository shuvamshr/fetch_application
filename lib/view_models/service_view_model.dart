import 'dart:convert';

import 'package:fetch_application/models/category_model.dart';
import 'package:fetch_application/models/pet_model.dart';
import 'package:fetch_application/models/service_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ServiceViewModel extends ChangeNotifier {
  List<Service> _services = [];

  Future<void> loadService() async {
    try {
      final jsonString = await rootBundle.loadString('data/service_data.json');
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final List<dynamic> jsonList = jsonMap['services'];

      _services = jsonList.map((json) => Service.fromJson(json)).toList();
    } catch (e) {
      // ignore: avoid_print
      print("Error loading service: $e");
    } finally {
      notifyListeners();
    }
  }

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
