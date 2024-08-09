import 'dart:convert';

import 'package:fetch_application/models/category_model.dart';
import 'package:fetch_application/models/pet_model.dart';
import 'package:fetch_application/models/service_model.dart';
import 'package:fetch_application/repositories/service_repository.dart';
import 'package:flutter/cupertino.dart';

class ServiceViewModel extends ChangeNotifier {
  final ServiceRepository _serviceRepository;
  List<Service> _services = [];

  ServiceViewModel(this._serviceRepository);

  Future<void> updateData() async {
    _services = await _serviceRepository.fetchServices();
    notifyListeners();
  }

  void addService(Service service) async {
    await _serviceRepository.addService(service);
    updateData();
  }

  void updateService(Service service) async {
    await _serviceRepository.updateService(service);
    updateData();
  }

  void deleteService(String id) async {
    await _serviceRepository.deleteService(id);
    updateData();
  }
}
