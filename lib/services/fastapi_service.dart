import 'dart:convert';
import 'package:fetch_application/models/category_model.dart';
import 'package:fetch_application/models/medication_model.dart';
import 'package:fetch_application/models/pet_model.dart';
import 'package:http/http.dart' as http;
import 'package:fetch_application/models/tracker_model.dart';

class FastapiService {
  Future<List<Tracker>> fetchTrackers() async {
    final response =
        await http.get(Uri.parse('https://fetch-api-gilt.vercel.app/trackers'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = jsonDecode(response.body);
      final List<dynamic> jsonList = jsonMap['trackers'];

      return jsonList.map((json) => Tracker.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load trackers');
    }
  }

  Future<List<Pet>> fetchPets() async {
    final response =
        await http.get(Uri.parse('https://fetch-api-gilt.vercel.app/pets'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = jsonDecode(response.body);
      final List<dynamic> jsonList = jsonMap['pets'];

      return jsonList.map((json) => Pet.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load pets');
    }
  }

  Future<List<Category>> fetchCategories() async {
    final response = await http
        .get(Uri.parse('https://fetch-api-gilt.vercel.app/categories'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = jsonDecode(response.body);
      final List<dynamic> jsonList = jsonMap['categories'];

      return jsonList.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<Medication>> fetchMedications() async {
    final response = await http
        .get(Uri.parse('https://fetch-api-gilt.vercel.app/medications'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = jsonDecode(response.body);
      final List<dynamic> jsonList = jsonMap['medications'];

      return jsonList.map((json) => Medication.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load medications');
    }
  }
}
