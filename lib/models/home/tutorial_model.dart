// target_item.dart
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TargetItem {
  final String id;
  final GlobalKey key;
  final String title;
  final String description;
  final String tapText;
  final ShapeBorder shape;
  final ContentAlign align;

  const TargetItem({
    required this.id,
    required this.key,
    required this.title,
    required this.description,
    required this.tapText,
    this.shape = const RoundedRectangleBorder(),
    this.align = ContentAlign.bottom,
  });
}
