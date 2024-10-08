import 'package:fetch_application/models/tracker_model.dart';
import 'package:fetch_application/services/fastapi_service.dart';

class TrackerRepository {
  List<Tracker> _trackers = [];
  final FastapiService _fastapiService = FastapiService();

  Future<List<Tracker>> fetchTrackers() async {
    try {
      if (_trackers.isEmpty) {
        _trackers = await _fastapiService.fetchTrackers();
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
