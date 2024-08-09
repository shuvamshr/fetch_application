import 'dart:convert';
import 'package:fetch_application/models/tracker_model.dart';
import 'package:flutter/services.dart';

class TrackerRepository {
  List<Tracker> _trackers = [];

  Future<List<Tracker>> fetchTrackers() async {
    try {
      if (_trackers.isEmpty) {
        final jsonString =
            await rootBundle.loadString('data/tracker_data.json');
        final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
        final List<dynamic> jsonList = jsonMap['trackers'];

        _trackers = jsonList.map((json) => Tracker.fromJson(json)).toList();
      }
      return _trackers;
    } catch (e) {
      throw Exception("Error loading trackers: $e");
    }
  }

  Future<void> addTracker(Tracker tracker) async {
    _trackers.add(tracker);
  }

  Future<void> updateTracker(Tracker tracker) async {
    final index = _trackers.indexWhere((t) => t.id == tracker.id);
    if (index != -1) {
      _trackers[index] = tracker;
    } else {
      throw Exception("Tracker not found");
    }
  }

  Future<void> deleteTracker(String id) async {
    _trackers.removeWhere((t) => t.id == id);
  }
}
