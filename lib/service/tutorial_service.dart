import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import '../models/home/tutorial_model.dart';

class TutorialService {
  late TutorialCoachMark _tutorialCoachMark;

  void createTutorial({
    required BuildContext context,
    required List<TargetItem> items,
    VoidCallback? onFinish,
    VoidCallback? onSkip,
    AlignmentGeometry alignSkip = AlignmentGeometry.bottomRight,
    bool isFab = false,
  }) {
    final targets = isFab ? _createTargetsOfFab(items) : _createTargets(items);

    _tutorialCoachMark = TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black87,
      textSkip: "SKIP",
      hideSkip: false,
      textStyleSkip: TextStyle(
        fontSize: 30,

        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      alignSkip: alignSkip,
      skipWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: OutlinedButton(
          onPressed: () {
            _tutorialCoachMark.skip(); // stop tutorial

            if (onSkip != null) onSkip();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            side: const BorderSide(color: Colors.white, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "Skip",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      paddingFocus: 10,
      opacityShadow: 0.7,
      onFinish: () {
        if (onFinish != null) onFinish();
      },
      onSkip: () {
        if (onSkip != null) onSkip();
        return true;
      },
    );
  }

  void showTutorial(BuildContext context) {
    _tutorialCoachMark.show(context: context);
  }

  List<TargetFocus> _createTargets(List<TargetItem> items) {
    return items.map((item) {
      return TargetFocus(
        identify: item.id,
        keyTarget: item.key,
        shape: item.shape is CircleBorder
            ? ShapeLightFocus.Circle
            : ShapeLightFocus.RRect,
        radius: item.shape is CircleBorder ? 0 : 12,
        paddingFocus: 10,
        contents: [
          TargetContent(
            align: item.align,
            builder: (context, controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.description,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    item.tapText,
                    style: TextStyle(color: Colors.yellow, fontSize: 22),
                  ),
                ],
              );
            },
          ),
        ],
      );
    }).toList();
  }

  List<TargetFocus> _createTargetsOfFab(List<TargetItem> items) {
    return items.map((item) {
      return TargetFocus(
        identify: item.id,
        keyTarget: item.key,
        targetPosition: TargetPosition(Size(56, 56), Offset(300, 600)),
        shape: item.shape is CircleBorder
            ? ShapeLightFocus.Circle
            : ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.description,
                    style: const TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    item.tapText,
                    style: TextStyle(color: Colors.yellow, fontSize: 14),
                  ),
                ],
              );
            },
          ),
        ],
      );
    }).toList();
  }
}
