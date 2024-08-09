import 'dart:convert';

import 'package:fetch_application/models/tracker_model.dart';
import 'package:flutter/services.dart';

class TrackerRepository {
  Future<List<Tracker>> fetchTrackers() async {
    try {
      final jsonString = await rootBundle.loadString('data/tracker_data.json');
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final List<dynamic> jsonList = jsonMap['trackers'];

      List<Tracker> trackers =
          jsonList.map((json) => Tracker.fromJson(json)).toList();
      return trackers;
    } catch (e) {
      throw Exception("Error loading trackers: $e");
    }
  }

  Future<void> addTracker(Tracker pet) async {}

  Future<void> updateTracker(Tracker pet) async {}

  Future<void> deleteTracker(String id) async {}
}
