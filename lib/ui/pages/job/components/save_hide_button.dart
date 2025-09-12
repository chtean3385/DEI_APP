import 'package:dei_champions/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SaveHideButton extends StatefulWidget {
  final bool showSave;
  final VoidCallback? onPressed;

  const SaveHideButton({
    super.key,
    required this.showSave,
    this.onPressed,
  });

  @override
  State<SaveHideButton> createState() => _SaveHideButtonState();
}

class _SaveHideButtonState extends State<SaveHideButton> {
  bool isActive = false;

  void _toggle() {
    setState(() {
      isActive = !isActive;
    });
    widget.onPressed?.call(); // trigger parent action if provided
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return InkWell(
      onTap: _toggle,
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          Icon(
            widget.showSave
                ? (isActive ? Icons.bookmark : Icons.bookmark_border_outlined)
                : (isActive ? Icons.visibility_off : Icons.remove_red_eye),
            size: 20,
            color: isActive ?AppColors.primaryColor : Colors.black54,
          ),
          const SizedBox(width: 4),
          Text(
            widget.showSave ?(isActive ?"Saved" :  "Save") : "Hide",
            style: theme.labelSmall?.copyWith(
              color: isActive ? AppColors.primaryColor : Colors.black54,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
