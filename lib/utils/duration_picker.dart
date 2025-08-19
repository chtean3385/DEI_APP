import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../widgets/others/custom_theme_button.dart';

class CookingDurationPicker extends StatefulWidget {
  final Duration initialDuration;
  final ValueChanged<Duration> onChanged; // callback to parent



  const CookingDurationPicker({
    super.key,
    this.initialDuration = const Duration(hours: 0, minutes: 30),
    required this.onChanged,
  });

  @override
  State<CookingDurationPicker> createState() => _CookingDurationPickerState();
}

class _CookingDurationPickerState extends State<CookingDurationPicker> {
  late Duration cookingDuration;

  @override
  void initState() {
    super.initState();
    cookingDuration = widget.initialDuration;
  }

  void _pickDuration() {
    Duration tempDuration = cookingDuration;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          child: Column(
            children: [
              Expanded(
                child: CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.ms,
                  initialTimerDuration: tempDuration,
                  minuteInterval: 1,
                  onTimerDurationChanged: (newDuration) {
                    tempDuration = newDuration;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cookingDuration = tempDuration;
                    });
                    widget.onChanged(cookingDuration); // 🔹 notify parent
                    Navigator.pop(context);
                  },
                  child: Text(
                    "OK",
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatDuration(Duration d) {
    final hours = d.inHours;
    final minutes = d.inMinutes % 60;
    if (hours > 0) {
      return "$hours hr ${minutes > 0 ? "$minutes min" : ""}";
    } else {
      return "$minutes min";
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color:  Colors.grey,width: 1
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            CustomThemeButton(
              color: AppColors.primaryColor,
              radius: 12,
              onTap: _pickDuration,
              isExpanded: false,
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    const Icon(Icons.timer),
                    Text(
                      "Preparation Time",
                      style: context.textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Duration: ${_formatDuration(cookingDuration)}",
                style: context.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Duration parseDurationFromApi(String? durationStr) {
  if (durationStr == null || durationStr.trim().isEmpty) {
    return const Duration(minutes: 30); // default
  }

  final lower = durationStr.toLowerCase();

  final hoursMatch = RegExp(r'(\d+)\s*hr').firstMatch(lower);
  final minutesMatch = RegExp(r'(\d+)\s*min').firstMatch(lower);

  final hours = hoursMatch != null ? int.parse(hoursMatch.group(1)!) : 0;
  final minutes = minutesMatch != null ? int.parse(minutesMatch.group(1)!) : 0;

  return Duration(hours: hours, minutes: minutes);
}
