import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../models/profile/edit_profile/json_item_model.dart';



class LocalJsonService {
  /// Load local JSON file and parse into Degree list
  Future<List<LocalJsonItemModel>> loadDegrees() async {
    try {
      final String response = await rootBundle.loadString('assets/json/degree.json');
      final data = json.decode(response);
      return LocalJsonItemModel.listFromJson(data);
    } catch (e) {
      print('Error loading degrees: $e');
      return [];
    }
  }
  /// Load local JSON file and parse into Institute list
  Future<List<LocalJsonItemModel>> loadInstitutes() async {
    try {
      final String response = await rootBundle.loadString('assets/json/institute.json');
      final data = json.decode(response);
      return LocalJsonItemModel.listFromJson(data);
    } catch (e) {
      print('Error loading institutes: $e');
      return [];
    }
  }
  /// Load local JSON file and parse into position list
  Future<List<LocalJsonItemModel>> loadPositions() async {
    try {
      final String response = await rootBundle.loadString('assets/json/position.json');
      final data = json.decode(response);
      return LocalJsonItemModel.listFromJson(data);
    } catch (e) {
      print('Error loadPositions: $e');
      return [];
    }
  }
}
