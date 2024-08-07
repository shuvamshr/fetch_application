import 'package:fetch_application/models/category_model.dart';
import 'package:fetch_application/models/pet_model.dart';
import 'package:fetch_application/models/tracker_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TrackerViewModel extends ChangeNotifier {
  final List<Tracker> _trackers = [
    Tracker(
      id: 'T001',
      pet: Pet(
          id: 'P001',
          name: 'Lumi',
          breed: 'Toy Poodle',
          gender: 'Female',
          dateOfBirth: DateTime(2012, 9, 3, 6, 30),
          deSexed: true,
          from: 'Pet Store',
          image: 'lumi'),
      category: Category(
          id: 'C001',
          title: "Vet Checkup",
          description: "Yearly health assessment",
          image: "vaccination"),
      dateTime: DateTime(2025, 1, 10, 10, 0),
    ),
    Tracker(
      id: 'T002',
      pet: Pet(
          id: 'P002',
          name: 'Yuki',
          breed: 'Pomeranian',
          gender: 'Female',
          dateOfBirth: DateTime(2015, 10, 30, 6, 30),
          deSexed: true,
          from: 'Pet Store',
          image: 'yuki'),
      category: Category(
          id: 'C002',
          title: "Vaccinations",
          description: "Immunization shots",
          image: "vaccination"),
      dateTime: DateTime(2025, 2, 15, 14, 0),
    ),
    Tracker(
      id: 'T003',
      pet: Pet(
          id: 'P003',
          name: 'Flamingo',
          breed: 'Labrador',
          gender: 'Male',
          dateOfBirth: DateTime(2015, 12, 3, 6, 30),
          deSexed: false,
          from: 'Pet Store',
          image: 'default'),
      category: Category(
          id: 'C003',
          title: "Dental Checkup",
          description: "Oral health maintenance",
          image: "vaccination"),
      dateTime: DateTime(2025, 3, 20, 9, 0),
    ),
    Tracker(
      id: 'T004',
      pet: Pet(
          id: 'P001',
          name: 'Lumi',
          breed: 'Toy Poodle',
          gender: 'Female',
          dateOfBirth: DateTime(2023, 9, 3, 6, 30),
          deSexed: true,
          from: 'Pet Store',
          image: 'lumi'),
      category: Category(
          id: 'C004',
          title: "Parasite Control",
          description: "Prevent fleas and ticks",
          image: "vaccination"),
      dateTime: DateTime(2023, 4, 25, 11, 0),
    ),
    Tracker(
      id: 'T005',
      pet: Pet(
          id: 'P002',
          name: 'Yuki',
          breed: 'Pomeranian',
          gender: 'Female',
          dateOfBirth: DateTime(2022, 10, 30, 6, 30),
          deSexed: true,
          from: 'Pet Store',
          image: 'yuki'),
      category: Category(
          id: 'C005',
          title: "Blood Tests",
          description: "Routine blood analysis",
          image: "vaccination"),
      dateTime: DateTime.now(),
    ),
    Tracker(
      id: 'T006',
      pet: Pet(
          id: 'P003',
          name: 'Flamingo',
          breed: 'Labrador',
          gender: 'Male',
          dateOfBirth: DateTime(2019, 12, 3, 6, 30),
          deSexed: false,
          from: 'Pet Store',
          image: 'default'),
      category: Category(
          id: 'C006',
          title: "Spaying/Neutering",
          description: "Surgical sterilization",
          image: "vaccination"),
      dateTime: DateTime(2023, 6, 5, 15, 0),
    ),
    Tracker(
      id: 'T007',
      pet: Pet(
          id: 'P001',
          name: 'Lumi',
          breed: 'Toy Poodle',
          gender: 'Female',
          dateOfBirth: DateTime(2012, 9, 3, 6, 30),
          deSexed: true,
          from: 'Pet Store',
          image: 'lumi'),
      category: Category(
          id: 'C007',
          title: "Microchipping",
          description: "Permanent ID chip",
          image: "vaccination"),
      dateTime: DateTime.now(),
    ),
    Tracker(
      id: 'T008',
      pet: Pet(
          id: 'P002',
          name: 'Yuki',
          breed: 'Pomeranian',
          gender: 'Female',
          dateOfBirth: DateTime(2017, 10, 30, 6, 30),
          deSexed: true,
          from: 'Pet Store',
          image: 'yuki'),
      category: Category(
          id: 'C008',
          title: "Weight & Nutrition",
          description: "Diet and weight management",
          image: "vaccination"),
      dateTime: DateTime(2025, 8, 15, 14, 0),
    ),
    Tracker(
      id: 'T009',
      pet: Pet(
          id: 'P003',
          name: 'Flamingo',
          breed: 'Labrador',
          gender: 'Male',
          dateOfBirth: DateTime(2019, 12, 3, 6, 30),
          deSexed: false,
          from: 'Pet Store',
          image: 'default'),
      category: Category(
          id: 'C009',
          title: "Senior Dog Care",
          description: "Care for older dogs",
          image: "vaccination"),
      dateTime: DateTime(2025, 9, 20, 9, 0),
    ),
    Tracker(
      id: 'T010',
      pet: Pet(
          id: 'P001',
          name: 'Lumi',
          breed: 'Toy Poodle',
          gender: 'Female',
          dateOfBirth: DateTime(2012, 9, 3, 6, 30),
          deSexed: true,
          from: 'Pet Store',
          image: 'lumi'),
      category: Category(
          id: 'C010',
          title: "Allergy Testing",
          description: "Identify allergies",
          image: "vaccination"),
      dateTime: DateTime.now(),
    ),
  ];

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
