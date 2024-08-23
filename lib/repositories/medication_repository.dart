import 'dart:convert';

import 'package:fetch_application/models/medication_model.dart';
import 'package:fetch_application/services/fastapi_service.dart';
import 'package:flutter/services.dart';

class MedicationRepository {
  List<Medication> _medications = [];
  final FastapiService _fastapiService = FastapiService();

  Future<List<Medication>> fetchMedications() async {
    try {
      if (_medications.isEmpty) {
        _medications = await _fastapiService.fetchMedications();
      }
      return _medications;
    } catch (e) {
      throw Exception("Error loading medications: $e");
    }
  }

  Future<void> addMedication(Medication medication) async {}

  Future<void> updateMedication(Medication medication) async {}

  Future<void> deleteMedication(String id) async {}
}
