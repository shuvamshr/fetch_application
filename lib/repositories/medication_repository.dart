import 'dart:convert';

import 'package:fetch_application/models/medication_model.dart';
import 'package:flutter/services.dart';

class MedicationRepository {
  Future<List<Medication>> fetchMedications() async {
    try {
      final jsonString =
          await rootBundle.loadString('data/medication_data.json');
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final List<dynamic> jsonList = jsonMap['medications'];

      List<Medication> medications =
          jsonList.map((json) => Medication.fromJson(json)).toList();
      return medications;
    } catch (e) {
      throw Exception("Error loading medications: $e");
    }
  }

  Future<void> addMedication(Medication medication) async {}

  Future<void> updateMedication(Medication medication) async {}

  Future<void> deleteMedication(String id) async {}
}
