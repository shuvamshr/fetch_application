import 'package:fetch_application/models/category_model.dart';
import 'package:fetch_application/models/pet_model.dart';
import 'package:fetch_application/models/service_model.dart';
import 'package:fetch_application/models/tracker_model.dart';
import 'package:fetch_application/repositories/category_repository.dart';
import 'package:fetch_application/repositories/pet_repository.dart';
import 'package:fetch_application/repositories/service_repository.dart';
import 'package:fetch_application/repositories/tracker_repository.dart';

import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

class TrackerViewModel extends ChangeNotifier {
  final TrackerRepository _trackerRepository;
  final PetRepository _petRepository;
  final CategoryRepository _categoryRepository;
  final ServiceRepository _serviceRepository;

  TrackerViewModel(
    this._trackerRepository,
    this._petRepository,
    this._categoryRepository,
    this._serviceRepository,
  );

  List<Tracker> _trackers = [];
  List<Pet> _pets = [];
  List<Category> _categories = [];
  List<Service> _services = [];

  Future<void> updateData() async {
    _trackers = await _trackerRepository.fetchTrackers();
    _pets = await _petRepository.fetchPets();
    _categories = await _categoryRepository.fetchCategories();
    _services = await _serviceRepository.fetchServices();
    notifyListeners();
  }

  List<Tracker> get allTrackers => _trackers;
  List<Pet> get allPets => _pets;
  List<Category> get allCategories => _categories;
  List<Service> get allServices => _services;

  // TrackerView

  Pet _activePet = Pet.nullValue();

  Pet get activePet => _activePet;
  set activePet(Pet pet) {
    _activePet = pet;
    notifyListeners();
  }

  List<Tracker> get trackersByToday {
    final currentDate = DateTime.now();
    return _trackers.where((tracker) {
      return _activePet.id == 'null'
          ? tracker.dateTime.year == currentDate.year &&
              tracker.dateTime.month == currentDate.month &&
              tracker.dateTime.day == currentDate.day
          : tracker.getPet(_pets).id == _activePet.id &&
              tracker.dateTime.year == currentDate.year &&
              tracker.dateTime.month == currentDate.month &&
              tracker.dateTime.day == currentDate.day;
    }).toList();
  }

  List<Tracker> get trackersByUpcoming {
    final currentDate = DateTime.now();
    final today =
        DateTime(currentDate.year, currentDate.month, currentDate.day);

    final upcomingTrackers = _trackers.where((tracker) {
      final trackerDate = DateTime(
          tracker.dateTime.year, tracker.dateTime.month, tracker.dateTime.day);
      return _activePet.id == 'null'
          ? trackerDate.isAfter(today)
          : tracker.getPet(_pets).id == _activePet.id &&
              trackerDate.isAfter(today);
    }).toList();

    upcomingTrackers.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return upcomingTrackers;
  }

  List<Tracker> get trackersByPast {
    final currentDate = DateTime.now();
    final today =
        DateTime(currentDate.year, currentDate.month, currentDate.day);

    final pastTrackers = _trackers.where((tracker) {
      final trackerDate = DateTime(
          tracker.dateTime.year, tracker.dateTime.month, tracker.dateTime.day);
      return trackerDate.isBefore(today);
    }).toList();

    pastTrackers.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return pastTrackers;
  }

  // AddTrackerView Controller

  Pet _selectedPet = Pet.nullValue();
  Category _selectedCategory = Category.nullValue();
  DateTime _selectedDateTime = DateTime.now();
  String _selectedPriority = "Medium";

  Pet get selectedPet => _selectedPet.id != 'null' ? _selectedPet : _pets.first;
  set selectedPet(Pet pet) {
    _selectedPet = pet;
    notifyListeners();
  }

  Category get selectedCategory =>
      _selectedCategory.id != 'null' ? _selectedCategory : _categories.first;
  set selectedCategory(Category category) {
    _selectedCategory = category;
    notifyListeners();
  }

  DateTime get selectedDateTime => _selectedDateTime;
  set selectedDateTime(DateTime dateTime) {
    _selectedDateTime = dateTime;
    notifyListeners();
  }

  String get selectedPriority => _selectedPriority;
  set selectedPriority(String priority) {
    _selectedPriority = priority;
    notifyListeners();
  }

  void addNewTracker() {
    final newTracker = Tracker(
        id: const Uuid().toString(),
        petID: selectedPet.id,
        categoryID: selectedCategory.id,
        dateTime: selectedDateTime);
    _trackers.add(newTracker);
    notifyListeners();
  }

  // TrackerDetailView

  List<Service> getRecommendedServices(Pet pet, Category category) {
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
