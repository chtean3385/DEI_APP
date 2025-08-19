import 'package:flutter/material.dart';
import '../../../../constants/app_drawables.dart';
import '../../constants/app_colors.dart';

class SearchFormFieldCommon extends StatefulWidget {
  final String hint;
  final EdgeInsetsGeometry? padding;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const SearchFormFieldCommon({
    super.key,
    required this.hint,
    this.padding,
    this.controller,
    this.onChanged,
  });

  @override
  State<SearchFormFieldCommon> createState() => _SearchFormFieldCommonState();
}

class _SearchFormFieldCommonState extends State<SearchFormFieldCommon> {
  late TextEditingController _controller;
  bool _showClear = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();

    _controller.addListener(() {
      final text = _controller.text;
      if (mounted) {
        setState(() {
          _showClear = text.isNotEmpty;
        });
      }
      if (widget.onChanged != null) {
        widget.onChanged!(text);
      }
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose(); // Only dispose if created internally
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
          color: theme.colorScheme.secondary,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          prefixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 24),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12, right: 8),
            child: Image.asset(
              AppDrawables.search,
              width: 20,
              height: 20,
              color: AppColors.primaryColor,
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
          hintText: widget.hint,
          hintStyle: theme.textTheme.displaySmall,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade600, width: 1),
          ),
        ),
      ),
    );
  }
}
