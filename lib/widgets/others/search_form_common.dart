import 'package:flutter/material.dart';
import '../../../../constants/app_drawables.dart';
import '../../constants/app_colors.dart';

import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../constants/app_drawables.dart';
import '../../constants/app_colors.dart';

class SearchFormFieldCommon extends StatefulWidget {
  final List<String> hintList; // 👈 new: list of hints
  final Color? hintColor;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Duration hintDuration; // 👈 new: time between hint changes

  const SearchFormFieldCommon({
    super.key,
    required this.hintList,
    this.padding,
    this.controller,
    this.onChanged,
    this.hintColor,
    this.radius,
    this.hintDuration = const Duration(seconds: 2),
  });

  @override
  State<SearchFormFieldCommon> createState() => _SearchFormFieldCommonState();
}

class _SearchFormFieldCommonState extends State<SearchFormFieldCommon> {
  late TextEditingController _controller;
  bool _showClear = false;
  int _currentHintIndex = 0;
  Timer? _hintTimer;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();

    // 👇 Animate hint changes periodically
    _hintTimer = Timer.periodic(widget.hintDuration, (timer) {
      if (mounted) {
        setState(() {
          _currentHintIndex =
              (_currentHintIndex + 1) % widget.hintList.length;
        });
      }
    });

    _controller.addListener(() {
      final text = _controller.text;
      if (mounted) {
        setState(() {
          _showClear = text.isNotEmpty;
        });
      }
      widget.onChanged?.call(text);
    });
  }

  @override
  void dispose() {
    _hintTimer?.cancel();
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: _controller,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontSize: 14,
          color: theme.colorScheme.secondary,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          isDense: true,
          prefixIconConstraints: const BoxConstraints(minHeight: 20, minWidth: 20),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12, right: 6),
            child: Image.asset(
              AppDrawables.search,
              width: 20,
              height: 20,
              color: Colors.black45,
            ),
          ),
          suffixIcon: _showClear
              ? GestureDetector(
            onTap: () {
              _controller.clear();
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: const Icon(Icons.clear, size: 20, color: Colors.black),
          )
              : null,
          // 👇 AnimatedSwitcher for rotating hint text
          hintText: null,
          hintStyle: theme.textTheme.displaySmall?.copyWith(
            fontSize: 14,
            color: widget.hintColor ?? Colors.grey,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 24),
            borderSide: const BorderSide(color: Colors.black26, width: .5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 24),
            borderSide: const BorderSide(color: Colors.black26, width: .5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 24),
            borderSide: BorderSide(color: Colors.grey.shade600, width: .5),
          ),
          // 👇 Animated hint widget
          label: AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            transitionBuilder: (child, animation) => SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.5),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(opacity: animation, child: child),
            ),
            layoutBuilder: (currentChild, previousChildren) => Stack(
              alignment: Alignment.centerLeft, // 👈 keeps text fixed to left
              children: [
                ...previousChildren,
                if (currentChild != null) currentChild,
              ],
            ),
            child: Text(
              widget.hintList[_currentHintIndex],
              key: ValueKey(_currentHintIndex),
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                color: widget.hintColor ?? Colors.grey,
              ),
            ),
          )
          ,
        ),
      ),
    );
  }
}

