import 'package:fetch_application/models/medication_model.dart';
import 'package:fetch_application/repositories/medication_repository.dart';
import 'package:flutter/cupertino.dart';

class MedicationViewModel extends ChangeNotifier {
  final MedicationRepository _medicationRepository;
  List<Medication> _medications = [];

  MedicationViewModel(this._medicationRepository);

  Future<void> updateData() async {
    _medications = await _medicationRepository.fetchMedications();
    notifyListeners();
  }

  void addMedication(Medication medication) async {
    await _medicationRepository.addMedication(medication);
    updateData();
  }

  void updateMedication(Medication medication) async {
    await _medicationRepository.updateMedication(medication);
    updateData();
  }

  void deleteMedication(String id) async {
    await _medicationRepository.deleteMedication(id);
    updateData();
  }
}
