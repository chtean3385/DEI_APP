import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/main.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_styles.dart';

class AutoSuggestionDropdownField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String? label;
  final IconData icon;
  final List<String> suggestions;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final TextCapitalization textCapitalization;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onSuggestionSelected;
  final ValueChanged<String>? onChanged;
  final int maxSuggestions;
  final bool caseSensitive;
  final bool showAbove;
  final FocusNode? focusNode;
  final double? radius;
  final bool isRequired ;
  final bool readOnly ;



  const AutoSuggestionDropdownField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    required this.suggestions,
    this.keyboardType,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.autofillHints,
    this.textInputAction,
    this.onFieldSubmitted,
    this.onSuggestionSelected,
    this.maxSuggestions = 5,
    this.caseSensitive = false,
    this.showAbove = false,
     this.focusNode,
    this.label,
    this.onChanged,
    this.radius,
    this.isRequired = false,
    this.readOnly = false,
  });

  @override
  State<AutoSuggestionDropdownField> createState() => _AutoSuggestionDropdownFieldState();
}

class _AutoSuggestionDropdownFieldState extends State<AutoSuggestionDropdownField> {
  final LayerLink _layerLink = LayerLink();
  final ScrollController _scrollController = ScrollController(); // ✅ ADD
  OverlayEntry? _overlayEntry;
  late FocusNode _focusNode;
  FocusNode? _internalFocusNode; // track if we created it
  List<String> _filteredSuggestions = [];
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();

    // if parent provided, use it, else create one
    if (widget.focusNode != null) {
      _focusNode = widget.focusNode!;
    } else {
      _internalFocusNode = FocusNode();
      _focusNode = _internalFocusNode!;
    }

    _focusNode.addListener(_onFocusChanged);
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _scrollController.dispose(); // ✅ ADD
    _focusNode.removeListener(_onFocusChanged);
    widget.controller.removeListener(_onTextChanged);
    _removeOverlay();

    // only dispose if we created it
    _internalFocusNode?.dispose();

    super.dispose();
  }


  void _onFocusChanged() {
    if (_focusNode.hasFocus) {
      _updateSuggestions();
      if (_filteredSuggestions.isNotEmpty) {
        _showDropdown();
      }
    } else {
      // Add small delay to allow tap on suggestions
      Future.delayed(Duration(milliseconds: 150), () {
        if (!_focusNode.hasFocus) {
          _hideDropdown();
        }
      });
    }
  }

  void _onTextChanged() {
    _updateSuggestions();

    if (_filteredSuggestions.isNotEmpty && _focusNode.hasFocus) {
      _showDropdown(); // always refresh dropdown
    } else {
      _hideDropdown();
    }
  }


  void _updateSuggestions() {
    final query = widget.controller.text.trim();

    if (query.isEmpty) {
      _filteredSuggestions = widget.suggestions.take(widget.maxSuggestions).toList();
    } else {
      final searchQuery = widget.caseSensitive ? query : query.toLowerCase();
      _filteredSuggestions = widget.suggestions.where((suggestion) {
        final suggestionText = widget.caseSensitive ? suggestion : suggestion.toLowerCase();
        return suggestionText.contains(searchQuery);
      }).take(widget.maxSuggestions).toList();
    }

    print('Query: "$query", Filtered: ${_filteredSuggestions.length}'); // Debug print
  }

  void _showDropdown() {
    _removeOverlay(); // 🔑 Remove old overlay before creating a new one

    if (_filteredSuggestions.isEmpty) return;

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);

    setState(() {
      _isDropdownOpen = true;
    });
  }

  void _hideDropdown() {
    _removeOverlay();
    setState(() {
      _isDropdownOpen = false;
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);

    final screenHeight = MediaQuery.of(context).size.height;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    const maxDropdownHeight = 200.0;
    final itemHeight = 48.0; // estimated height per suggestion
    final dropdownHeight = (_filteredSuggestions.length * itemHeight)
        .clamp(0.0, maxDropdownHeight); // clamp height

    if (dropdownHeight == 0) return OverlayEntry(builder: (_) => const SizedBox());

    // Space above and below the field
    final spaceAbove = position.dy;
    final spaceBelow = screenHeight - (position.dy + size.height) - keyboardHeight;

    final double dropdownTop = widget.showAbove
        ? (spaceAbove > dropdownHeight ? position.dy - dropdownHeight - 4 : 0)
        : (spaceBelow > dropdownHeight ? position.dy + size.height + 4 : 0);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx,
        width: size.width,
        top: dropdownTop,
        height: dropdownHeight,
        child: _buildDropdown(),
      ),
    );
  }

  Widget _buildDropdown() {
    final colorTheme = context.colors;
    if (_filteredSuggestions.isEmpty) {
      return Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        color: colorTheme.themBasedWhite,
        child: Center(
          child: Text(
            'No suggestions',
            style: TextStyle(color: Colors.black45),
          ),
        ),
      );
    }

    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(12),
      color: colorTheme.themBasedWhite,
      child: Container(
        decoration: BoxDecoration(
          color: colorTheme.buttonPrimaryColor.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colorTheme.buttonPrimaryColor.withValues(alpha: 0.13),
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Scrollbar(
            controller: _scrollController, // ✅ REQUIRED
            // ✅ Added Scrollbar
            thumbVisibility: true, // always show scrollbar when scrollable
            radius: const Radius.circular(8), // rounded scrollbar thumb
            thickness: 10, // scrollbar width
            child: ListView.builder(
              controller: _scrollController, // ✅ REQUIRED
              padding: EdgeInsets.zero,
              itemCount: _filteredSuggestions.length,
              itemBuilder: (context, index) {
                final suggestion = _filteredSuggestions[index];
                return _SuggestionTile(
                  suggestion: suggestion,
                  onTap: () => _onSuggestionTap(suggestion),
                  query: widget.controller.text.trim(),
                  caseSensitive: widget.caseSensitive,
                  isLast: index == _filteredSuggestions.length - 1,
                );
              },
            ),
          ),
        ),
      ),
    );
  }




  void _onSuggestionTap(String suggestion) {
    widget.controller.text = suggestion;
    widget.onSuggestionSelected?.call(suggestion);
    _hideDropdown();
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = context.colors;

    return CompositedTransformTarget(
      link: _layerLink,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.label != null)  RichText(
            text: TextSpan(
              text: widget.label!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorTheme.themBasedBlack,
                fontWeight: FontWeight.normal,
              ),
              children: widget.isRequired
                  ? [
                TextSpan(
                  text: ' *',
                  style: TextStyle(
                    color: colorTheme.themBasedBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]
                  : [],
            ),
          ),
          if(widget.label != null) gapH4(),
          DecoratedBox(
            decoration: BoxDecoration(
              color: widget.readOnly ? colorTheme.commonDividerBgColor : colorTheme.cardBgColor,
              borderRadius: BorderRadius.circular(widget.radius ?? 12),
              border: Border.all(
                color: colorTheme.themBasedBlack.withValues(alpha: 0.13),
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: TextFormField(
                controller: widget.controller,
                focusNode: _focusNode,
                keyboardType: widget.keyboardType,
                validator: widget.validator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textCapitalization: widget.textCapitalization,
                autofillHints: widget.autofillHints,
                textInputAction: widget.textInputAction,
                cursorColor: Colors.black,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorTheme.themBasedBlack,
                  fontWeight: FontWeight.normal,
                ),
                readOnly: widget.readOnly ,
                onFieldSubmitted: widget.onFieldSubmitted,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: theme.textTheme.bodyMedium?.copyWith(
                    color: colorTheme.black54,
                  ),
                  errorStyle: theme.textTheme.displaySmall?.copyWith(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                  ),
                  prefixIcon: Icon(widget.icon, color: colorTheme.black54, size: 22),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SuggestionTile extends StatelessWidget {
  final String suggestion;
  final VoidCallback onTap;
  final String query;
  final bool caseSensitive;
  final bool isLast;

  const _SuggestionTile({
    required this.suggestion,
    required this.onTap,
    required this.query,
    required this.caseSensitive,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colors;
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          border: !isLast ? Border(
            bottom: BorderSide(
              color: colorTheme.buttonPrimaryColor.withValues(alpha: 0.1),
              width: 0.5,
            ),
          ) : null,
        ),
        child: Row(
          children: [
            Icon(
              Icons.search_outlined,
              color: colorTheme.black54,
              size: 18,
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildHighlightedText(theme),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHighlightedText(ThemeData theme) {
    final colorTheme = navigatorKey.currentContext!.colors;

    if (query.isEmpty) {
      return Text(
        suggestion,
        style: theme.textTheme.bodyMedium?.copyWith(
          color:colorTheme.buttonPrimaryColor.withValues(alpha: 0.9),
          fontWeight: FontWeight.normal,
        ),
      );
    }

    final String searchQuery = caseSensitive ? query : query.toLowerCase();
    final String searchText = caseSensitive ? suggestion : suggestion.toLowerCase();

    if (!searchText.contains(searchQuery)) {
      return Text(
        suggestion,
        style: theme.textTheme.bodyMedium?.copyWith(
          color:colorTheme.buttonPrimaryColor.withValues(alpha: 0.9),
          fontWeight: FontWeight.normal,
        ),
      );
    }

    final int startIndex = searchText.indexOf(searchQuery);
    final int endIndex = startIndex + searchQuery.length;

    return RichText(
      text: TextSpan(
        children: [
          if (startIndex > 0)
            TextSpan(
              text: suggestion.substring(0, startIndex),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorTheme.buttonPrimaryColor.withValues(alpha: 0.9),
                fontWeight: FontWeight.normal,
              ),
            ),
          TextSpan(
            text: suggestion.substring(startIndex, endIndex),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorTheme.themBasedBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (endIndex < suggestion.length)
            TextSpan(
              text: suggestion.substring(endIndex),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorTheme.buttonPrimaryColor.withValues(alpha: 0.9),
                fontWeight: FontWeight.normal,
              ),
            ),
        ],
      ),
    );
  }
}