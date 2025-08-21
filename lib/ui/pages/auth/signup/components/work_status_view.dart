import 'package:flutter/material.dart';

import 'work_status_card.dart';


class WorkStatusView extends StatefulWidget {
  const WorkStatusView({super.key});

  @override
  State<WorkStatusView> createState() => _WorkStatusViewState();
}

class _WorkStatusViewState extends State<WorkStatusView> {
  String _selectedWorkStatus = "";

  @override
  Widget build(BuildContext context) {
    return Row(
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
              });
            },
          ),
        ),
      ],
    );
  }
}


