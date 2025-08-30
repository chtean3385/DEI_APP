import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';

class BusinessType extends StatelessWidget {
  final bool individual;
  final Function(bool) onChanged;

  const BusinessType({
    Key? key,
    required this.individual,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You are creating account as',
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => onChanged(true),
              behavior: HitTestBehavior.translucent,
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: individual ? AppColors.primaryColor : Colors.white,
                      border: Border.all(
                        color: individual
                            ? AppColors.primaryColor
                            : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: individual
                        ? const Center(
                      child: Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 8,
                      ),
                    )
                        : null,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Company/Business',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,fontSize: 13
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => onChanged(false),
              behavior: HitTestBehavior.translucent,
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: !individual
                          ? AppColors.primaryColor
                          : Colors.white,
                      border: Border.all(
                        color: !individual
                            ? AppColors.primaryColor
                            : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: !individual
                        ? const Center(
                      child: Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 8,
                      ),
                    )
                        : null,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Individual/Proprietor',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,fontSize: 13
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}