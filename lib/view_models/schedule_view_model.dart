import 'package:fetch_application/models/category_model.dart';
import 'package:fetch_application/models/pet_model.dart';
import 'package:fetch_application/models/tracker_model.dart';
import 'package:flutter/material.dart';

class ScheduleViewModel extends ChangeNotifier {
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
      dateTime: DateTime(2024, 7, 25),
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
    // Tracker(
    //   id: 'T003',
    //   pet: Pet(id: 'P003', name: "Flamingo", image: "default"),
    //   category: Category(
    //       id: 'C003',
    //       title: "Bath & Grooming",
    //       description: "Monthly Grooming",
    //       image: "grooming"),
    //   dateTime: DateTime(2024, 8, 1),
    // ),

    // Dates on August 6, 2024
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
      dateTime: DateTime(2024, 8, 6),
    ),

    // Dates after August 6, 2024
    // Tracker(
    //   id: 'T006',
    //   pet: Pet(id: 'P003', name: "Flamingo", image: "default"),
    //   category: Category(
    //       id: 'C006',
    //       title: "Bath & Grooming",
    //       description: "Quarterly Grooming",
    //       image: "grooming"),
    //   dateTime: DateTime(2024, 8, 10),
    // ),
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

  Pet _activePet = Pet(id: '000', name: 'null', image: 'null');

  void setActivePet(Pet pet) {
    _activePet = pet;
    notifyListeners();
  }

  Pet getActivePet() {
    return _activePet;
  }

  List<Tracker> getAllTrackers() {
    return _trackers;
  }

  List<Tracker> getFilteredTrackersByToday() {
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

  List<Tracker> getFilteredTrackersByUpcoming() {
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

  List<Tracker> getFilteredTrackersByPast() {
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
