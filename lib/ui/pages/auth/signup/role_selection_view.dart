import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import 'components/work_status_card.dart';

class RoleSelectionView extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ValueChanged<String>? onRoleChanged;

  const RoleSelectionView({super.key, required this.formKey, this.onRoleChanged});

  @override
  State<RoleSelectionView> createState() => _RoleSelectionViewState();
}

class _RoleSelectionViewState extends State<RoleSelectionView> {
  String? _selectedRole;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: (value) {
        if (_selectedRole == null || _selectedRole!.isEmpty) {
          return 'Please select your role';
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
                    title: "Employer",
                    subtitle: "I want to post jobs and hire candidates",
                    icon: Icons.business_center_outlined,
                    isSelected: _selectedRole == "employer",
                    onTap: () {
                      setState(() {
                        _selectedRole = "employer";
                        field.didChange(_selectedRole);
                        widget.onRoleChanged?.call(_selectedRole!);
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: WorkStatusCard(
                    title: "Employee",
                    subtitle: "I am looking for jobs/opportunities",
                    icon: Icons.person_search_outlined,
                    isSelected: _selectedRole == "employee",
                    onTap: () {
                      setState(() {
                        _selectedRole = "employee";
                        field.didChange(_selectedRole);
                        widget.onRoleChanged?.call(_selectedRole!);
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
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
