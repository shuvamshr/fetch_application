import 'package:fetch_application/models/category_model.dart';
import 'package:fetch_application/models/pet_model.dart';
import 'package:fetch_application/models/tracker_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TrackerViewModel extends ChangeNotifier {
  final List<Tracker> _trackers = [
    // Dates before August 6, 2024
    Tracker(
      id: 'T001',
      pet: Pet(id: 'P001', name: "Lumi", image: "lumi"),
      category: Category(
          id: 'C001',
          title: "Vaccination Dose",
          description: "Monthly Vaccination",
          image: "vaccination"),
      dateTime: DateTime.now(),
    ),
    Tracker(
      id: 'T002',
      pet: Pet(id: 'P002', name: "Yuki", image: "yuki"),
      category: Category(
          id: 'C002',
          title: "Tick & Flea Check",
          description: "Weekly Checkup",
          image: "flea"),
      dateTime: DateTime(2024, 7, 30),
    ),
    Tracker(
      id: 'T004',
      pet: Pet(id: 'P001', name: "Lumi", image: "lumi"),
      category: Category(
          id: 'C004',
          title: "Vaccination Dose",
          description: "Annual Vaccination",
          image: "vaccination"),
      dateTime: DateTime(2024, 8, 6),
    ),
    Tracker(
      id: 'T005',
      pet: Pet(id: 'P002', name: "Yuki", image: "yuki"),
      category: Category(
          id: 'C005',
          title: "Tick & Flea Check",
          description: "Monthly Checkup",
          image: "flea"),
      dateTime: DateTime.now(),
    ),
    Tracker(
      id: 'T007',
      pet: Pet(id: 'P001', name: "Lumi", image: "lumi"),
      category: Category(
          id: 'C007',
          title: "Vaccination Dose",
          description: "Quarterly Vaccination",
          image: "vaccination"),
      dateTime: DateTime(2024, 8, 15),
    ),
    Tracker(
      id: 'T008',
      pet: Pet(id: 'P002', name: "Yuki", image: "yuki"),
      category: Category(
          id: 'C008',
          title: "Tick & Flea Check",
          description: "Monthly Checkup",
          image: "flea"),
      dateTime: DateTime(2024, 8, 20),
    ),

    Tracker(
      id: 'T010',
      pet: Pet(id: 'P001', name: "Lumi", image: "lumi"),
      category: Category(
          id: 'C010',
          title: "Vaccination Dose",
          description: "Biannual Vaccination",
          image: "vaccination"),
      dateTime: DateTime(2024, 9, 5),
    ),
  ];

  // Filter Controller

  Pet _activePet = Pet(id: '000', name: 'null', image: 'null');

  Pet get activePet => _activePet;
  set activePet(Pet pet) {
    _activePet = pet;
    notifyListeners();
  }

  // Form Controller

  Pet _selectedPet = Pet(id: '000', name: 'null', image: 'null');
  Category _selectedCategory =
      Category(id: '000', title: 'null', description: 'null', image: 'null');
  DateTime _selectedDateTime = DateTime.now();
  String _selectedFrequency = "One Time";

  Pet get selectedPet => _selectedPet;
  set selectedPet(Pet pet) {
    _selectedPet = pet;
    notifyListeners();
  }

  Category get selectedCategory => _selectedCategory;
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
        pet: selectedPet,
        category: selectedCategory,
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
          : tracker.pet.id == _activePet.id &&
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
          : tracker.pet.id == _activePet.id && trackerDate.isAfter(today);
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
