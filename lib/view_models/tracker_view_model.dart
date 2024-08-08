import 'dart:convert';

import 'package:fetch_application/models/category_model.dart';
import 'package:fetch_application/models/pet_model.dart';
import 'package:fetch_application/models/tracker_model.dart';
import 'package:fetch_application/view_models/category_view_model.dart';
import 'package:fetch_application/view_models/pet_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

class TrackerViewModel extends ChangeNotifier {
  final PetViewModel petViewModel;
  final CategoryViewModel categoryViewModel;

  TrackerViewModel({
    required this.petViewModel,
    required this.categoryViewModel,
  }) {
    loadTracker();
  }

  Future<void> initialize() async {
    await loadTracker();
  }

  List<Tracker> _trackers = [];

  Future<void> loadTracker() async {
    try {
      final jsonString = await rootBundle.loadString('data/tracker_data.json');
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final List<dynamic> jsonList = jsonMap['trackers'];

      _trackers = jsonList.map((json) => Tracker.fromJson(json)).toList();
    } catch (e) {
      // ignore: avoid_print
      print("Error loading tracker: $e");
    } finally {
      notifyListeners();
    }
  }

  // Filter Controller

  Pet _activePet = Pet(
      id: '000',
      name: 'null',
      breed: 'null',
      gender: 'null',
      dateOfBirth: DateTime.now(),
      deSexed: false,
      from: 'null',
      image: 'null');

  Pet get activePet => _activePet;
  set activePet(Pet pet) {
    _activePet = pet;
    notifyListeners();
  }

  // Form Controller

  Pet _selectedPet = Pet(
      id: '000',
      name: 'null',
      breed: 'null',
      gender: 'null',
      dateOfBirth: DateTime.now(),
      deSexed: false,
      from: 'null',
      image: 'null');
  Category _selectedCategory =
      Category(id: '000', title: 'null', description: 'null', image: 'null');
  DateTime _selectedDateTime = DateTime.now();
  String _selectedFrequency = "One Time";

  Pet get selectedPet =>
      _selectedPet.id != '000' ? _selectedPet : petViewModel.allPets.first;
  set selectedPet(Pet pet) {
    _selectedPet = pet;
    notifyListeners();
  }

  Category get selectedCategory => _selectedCategory.id != '000'
      ? _selectedCategory
      : categoryViewModel.allCategories.first;
  set selectedCategory(Category category) {
    _selectedCategory = category;
    notifyListeners();
  }

  DateTime get selectedDateTime => _selectedDateTime;
  set selectedDateTime(DateTime dateTime) {
    _selectedDateTime = dateTime;
    notifyListeners();
  }

  String get selectedFrequency => _selectedFrequency;
  set selectedFrequency(String frequency) {
    _selectedFrequency = frequency;
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

  // Tracker Controller

  List<Tracker> get allTrackers => _trackers;

  List<Tracker> get trackersByToday {
    final currentDate = DateTime.now();
    return _trackers.where((tracker) {
      return _activePet.id == '000'
          ? tracker.dateTime.year == currentDate.year &&
              tracker.dateTime.month == currentDate.month &&
              tracker.dateTime.day == currentDate.day
          : tracker.getPet(petViewModel).id == _activePet.id &&
              tracker.dateTime.year == currentDate.year &&
              tracker.dateTime.month == currentDate.month &&
              tracker.dateTime.day == currentDate.day;
    }).toList();
  }

  List<Tracker> get trackersByUpcoming {
    final currentDate = DateTime.now();
    final today =
        DateTime(currentDate.year, currentDate.month, currentDate.day);
    return _trackers.where((tracker) {
      final trackerDate = DateTime(
          tracker.dateTime.year, tracker.dateTime.month, tracker.dateTime.day);
      return _activePet.id == '000'
          ? trackerDate.isAfter(today)
          : tracker.getPet(petViewModel).id == _activePet.id &&
              trackerDate.isAfter(today);
    }).toList();
  }

  List<Tracker> get trackersByPast {
    final currentDate = DateTime.now();
    final today =
        DateTime(currentDate.year, currentDate.month, currentDate.day);
    return _trackers.where((tracker) {
      final trackerDate = DateTime(
          tracker.dateTime.year, tracker.dateTime.month, tracker.dateTime.day);
      return trackerDate.isBefore(today);
    }).toList();
  }
}
