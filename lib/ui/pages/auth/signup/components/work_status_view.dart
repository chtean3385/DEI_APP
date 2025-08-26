import 'package:flutter/material.dart';
import 'work_status_card.dart';

class WorkStatusView extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const WorkStatusView({super.key, required this.formKey});

  @override
  State<WorkStatusView> createState() => _WorkStatusViewState();
}

class _WorkStatusViewState extends State<WorkStatusView> {
  String? _selectedWorkStatus;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: (value) {
        if (_selectedWorkStatus == null || _selectedWorkStatus!.isEmpty) {
          return 'Please select your work status';
        }
        return null;
      },
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: WorkStatusCard(
                    title: "I'm experienced",
                    subtitle: "I have work experience (excluding internships)",
                    icon: Icons.work_outline,
                    isSelected: _selectedWorkStatus == "experienced",
                    onTap: () {
                      setState(() {
                        _selectedWorkStatus = "experienced";
                        field.didChange(_selectedWorkStatus);
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: WorkStatusCard(
                    title: "I'm a fresher",
                    subtitle: "I am a student/Haven't worked after graduation",
                    icon: Icons.school_outlined,
                    isSelected: _selectedWorkStatus == "fresher",
                    onTap: () {
                      setState(() {
                        _selectedWorkStatus = "fresher";
                        field.didChange(_selectedWorkStatus);
                      });
                    },
                  ),
                ),
              ],
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  field.errorText!,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
