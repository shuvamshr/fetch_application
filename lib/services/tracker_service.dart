import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fetch_application/models/tracker_model.dart';

class TrackerService {
  final String _baseUrl = 'https://fetch-api-gilt.vercel.app';

  Future<List<Tracker>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://fetch-api-gilt.vercel.app/trackers'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = jsonDecode(response.body);
      final List<dynamic> jsonList = jsonMap['trackers'];

      return jsonList.map((json) => Tracker.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
