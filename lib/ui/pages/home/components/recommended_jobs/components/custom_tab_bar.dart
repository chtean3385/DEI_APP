import 'package:flutter/material.dart';

import '../../../../../../constants/app_colors.dart';

class CustomTabBar extends StatefulWidget {
  final List<Map<String, dynamic>> filterItems;
  final Function(Map<String, dynamic>)? onItemSelected;
  final double? horizontalPadding;
  final int index;

  const CustomTabBar({
    super.key,
    required this.filterItems,
    this.onItemSelected,
    this.horizontalPadding,
    this.index = 0,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  late int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Initialize from widget.index
    selectedIndex = widget.index;
  }

  @override
  void didUpdateWidget(covariant CustomTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update selectedIndex if parent changes the index
    if (widget.index != oldWidget.index && widget.index != selectedIndex) {
      setState(() {
        selectedIndex = widget.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SizedBox(
      height: 35,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding ?? 8,
        ),
        itemCount: widget.filterItems.length,
        separatorBuilder: (_, __) => const SizedBox(width: 4),
        itemBuilder: (context, index) {
          final item = widget.filterItems[index];
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              if (widget.onItemSelected != null) {
                widget.onItemSelected!(
                  item,
                ); // trigger callback with selected item
              }
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected
                        ? AppColors.primaryColor
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 10,
                ),
                child: Text(
                  _buildLabel(item),
                  style: theme.bodyMedium?.copyWith(
                    color: isSelected ? Colors.black : Colors.black54,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String _buildLabel(Map<String, dynamic> item) {
    final title = item['title']?.toString() ?? item['name']?.toString() ?? "";
    final count = item['count']?.toString();

    if (count != null && count.isNotEmpty) {
      return "$title ($count)";
    }
    return title;
  }
}
