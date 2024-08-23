import 'package:fetch_application/models/category_model.dart';
import 'package:fetch_application/models/pet_model.dart';
import 'package:fetch_application/models/medication_model.dart';
import 'package:fetch_application/models/tracker_model.dart';
import 'package:fetch_application/repositories/category_repository.dart';
import 'package:fetch_application/repositories/pet_repository.dart';
import 'package:fetch_application/repositories/medication_repository.dart';
import 'package:fetch_application/repositories/tracker_repository.dart';

import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

class TrackerViewModel extends ChangeNotifier {
  final TrackerRepository _trackerRepository;
  final PetRepository _petRepository;
  final CategoryRepository _categoryRepository;
  final MedicationRepository _medicationRepository;

  TrackerViewModel(
    this._trackerRepository,
    this._petRepository,
    this._categoryRepository,
    this._medicationRepository,
  );

  List<Tracker> _trackers = [];
  List<Pet> _pets = [];
  List<Category> _categories = [];
  List<Medication> _medications = [];

  List<Tracker> get allTrackers => _trackers;
  List<Pet> get allPets => _pets;
  List<Category> get allCategories => _categories;
  List<Medication> get allMedications => _medications;

  Future<void> updateData() async {
    _trackers = await _trackerRepository.fetchTrackers();
    _pets = await _petRepository.fetchPets();
    _categories = await _categoryRepository.fetchCategories();
    _medications = await _medicationRepository.fetchMedications();
    notifyListeners();
  }

  void addTracker() async {
    final tracker = Tracker(
      id: const Uuid().toString(),
      petID: selectedPet.id,
      categoryID: selectedCategory.id,
      dateTime: selectedDateTime,
      priority: selectedPriority,
    );

    await _trackerRepository.addTracker(tracker);
    updateData();
  }

  void updateTracker() async {
    final tracker = Tracker(
      id: selectedTrackerID,
      petID: selectedPet.id,
      categoryID: selectedCategory.id,
      dateTime: selectedDateTime,
      priority: selectedPriority,
    );
    await _trackerRepository.updateTracker(tracker);
    updateData();
  }

  void deleteTracker(String id) async {
    await _trackerRepository.deleteTracker(id);
    updateData();
  }

  // TrackerView Logic

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

  // AddTrackerView Logic

  Pet? _selectedPet;
  Category? _selectedCategory;
  DateTime? _selectedDateTime;
  String? _selectedPriority;

  void initializeForAdd() {
    _selectedPet = Pet.nullValue();
    _selectedCategory = Category.nullValue();
    _selectedDateTime = DateTime.now();
    _selectedPriority = "Medium";
    notifyListeners();
  }

  Pet get selectedPet =>
      _selectedPet!.id != 'null' ? _selectedPet! : _pets.first;
  set selectedPet(Pet pet) {
    _selectedPet = pet;
    notifyListeners();
  }

  Category get selectedCategory =>
      _selectedCategory!.id != 'null' ? _selectedCategory! : _categories.first;
  set selectedCategory(Category category) {
    _selectedCategory = category;
    notifyListeners();
  }

  DateTime get selectedDateTime => _selectedDateTime!;
  set selectedDateTime(DateTime dateTime) {
    _selectedDateTime = dateTime;
    notifyListeners();
  }

  String get selectedPriority => _selectedPriority!;
  set selectedPriority(String priority) {
    _selectedPriority = priority;
    notifyListeners();
  }

  // EditTrackerView Logic

  String? _selectedTrackerID;

  String get selectedTrackerID => _selectedTrackerID!;

  void initializeForEdit(Tracker tracker) {
    _selectedTrackerID = tracker.id;
    _selectedPet = tracker.getPet(_pets);
    _selectedCategory = tracker.getCategory(_categories);
    _selectedDateTime = tracker.dateTime;
    _selectedPriority = tracker.priority;
    notifyListeners();
  }

  // TrackerDetailView Logic

  List<Medication> getRecommendedMedications(Pet pet, Category category) {
    final petAge =
        (DateTime.now().difference(pet.dateOfBirth).inDays / 365).ceil();

    return _medications.where((medication) {
      final matchesCategory = medication.categoryID == category.id;
      final matchesBreed = medication.forBreed.contains(pet.breed);
      final matchesGender = medication.forGender.contains(pet.gender);
      final matchesDesexed = medication.forDesexed.contains(pet.deSexed);
      final matchesAge = medication.forAge.contains(petAge);

      return matchesCategory &&
          matchesBreed &&
          matchesGender &&
          matchesDesexed &&
          matchesAge;
    }).toList();
  }
}
