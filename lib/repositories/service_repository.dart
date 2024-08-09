import 'dart:convert';

import 'package:fetch_application/models/service_model.dart';
import 'package:flutter/services.dart';

class ServiceRepository {
  Future<List<Service>> fetchServices() async {
    try {
      final jsonString = await rootBundle.loadString('data/service_data.json');
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final List<dynamic> jsonList = jsonMap['services'];

      List<Service> services =
          jsonList.map((json) => Service.fromJson(json)).toList();
      return services;
    } catch (e) {
      throw Exception("Error loading services: $e");
    }
  }

  Future<void> addService(Service pet) async {}

  Future<void> updateService(Service pet) async {}

  Future<void> deleteService(String id) async {}
}
