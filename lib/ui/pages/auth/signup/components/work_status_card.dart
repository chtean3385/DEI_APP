import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';



class WorkStatusCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const WorkStatusCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor.withValues(alpha: 0.2)
              : AppColors.primaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF667eea)
                : Colors.black.withValues(alpha: 0.3),
            width: isSelected ? 2 : .5,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF667eea)
                    : AppColors.primaryColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(icon, size: 24, color:isSelected? Colors.white: Colors.black54),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: context.textTheme.bodyMedium?.copyWith(  color: Colors.black,fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: context.textTheme.displaySmall?.copyWith(  color: Colors.black54,fontSize: 11,
                height: 1.3),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}


