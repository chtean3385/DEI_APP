import 'package:flutter/material.dart';

class CategoryModel {
  final int id;
  final IconData icon;
  final String title;
  final String count;
  final Color color;

  CategoryModel({
    required this.id,
    required this.icon,
    required this.title,
    required this.count,
    required this.color,
  });

  // Optional: factory to create from a map if needed
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int,
      icon: map['icon'] as IconData,
      title: map['title'] as String,
      count: map['count'] as String,
      color: map['color'] as Color,
    );
  }

  // Optional: convert back to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'icon': icon,
      'title': title,
      'count': count,
      'color': color,
    };
  }
}
