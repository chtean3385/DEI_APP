import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants/app_colors.dart';

class CustomTabBar extends StatefulWidget {
  final List<Map<String, dynamic>> filterItems;
  final Function(Map<String, dynamic>)? onItemSelected;
  final double? horizontalPadding;
  final int? initialId;

  const CustomTabBar({
    super.key,
    required this.filterItems,
    this.onItemSelected,
    this.horizontalPadding,
    this.initialId,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  late int selectedIndex;
  late ScrollController _scrollController;
  late List<GlobalKey> _tabKeys;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabKeys = List.generate(widget.filterItems.length, (_) => GlobalKey());

    selectedIndex = widget.initialId != null
        ? widget.filterItems.indexWhere((item) => item['id'] == widget.initialId)
        : 0;
    if (selectedIndex == -1) selectedIndex = 0;

    // Scroll to selected after layout
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
  }

  @override
  void didUpdateWidget(covariant CustomTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialId != oldWidget.initialId && widget.initialId != null) {
      final newIndex =
      widget.filterItems.indexWhere((item) => item['id'] == widget.initialId);
      if (newIndex != -1 && newIndex != selectedIndex) {
        setState(() => selectedIndex = newIndex);
        WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
      }
    }

    if (_tabKeys.length != widget.filterItems.length) {
      _tabKeys = List.generate(widget.filterItems.length, (_) => GlobalKey());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSelected() {
    final keyContext = _tabKeys[selectedIndex].currentContext;
    if (keyContext != null) {
      final box = keyContext.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero, ancestor: context.findRenderObject());
      final scrollOffset = _scrollController.offset + position.dx - 20; // add some padding
      _scrollController.animateTo(
        scrollOffset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final colorTheme = context.colors;
    return SizedBox(
      height: 40,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding ?? 8),
        child: Row(
          children: List.generate(widget.filterItems.length, (index) {
            final item = widget.filterItems[index];
            final isSelected = index == selectedIndex;
            return Padding(
              key: _tabKeys[index],
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: GestureDetector(
                onTap: () {
                  setState(() => selectedIndex = index);
                  widget.onItemSelected?.call(item);
                  WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
                },
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: isSelected ? colorTheme.buttonPrimaryColor : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    _buildLabel(item),
                    style: theme.bodyMedium?.copyWith(
                      color: isSelected ? colorTheme.themBasedBlack : colorTheme.black54,
                      fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  String _buildLabel(Map<String, dynamic> item) {
    final title = item['title']?.toString() ?? item['name']?.toString() ?? "";
    final count = item['count']?.toString();
    return (count != null && count.isNotEmpty) ? "$title ($count)" : title;
  }
}


