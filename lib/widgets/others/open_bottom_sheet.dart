import 'dart:async';

import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> openEditBottomSheet({
  required BuildContext context,
  required Widget content,
  double minChildSize = 0.5,
  double maxChildSize = 0.95,
  double initialChildSize = 0.85,
  bool isDraggable = false,
}) {
  final colorTheme = context.colors;

  if (!isDraggable) {

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      builder: (ctx) => Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom, // pushes content above keyboard
          ),
          decoration: BoxDecoration(
            color: colorTheme.commonDividerBgColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          clipBehavior: Clip.antiAlias,child: Padding(
        padding: const EdgeInsets.all(16),
            child: content,
          )
      ),
    );
  } else {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: colorTheme.themBasedWhite,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(ctx).viewInsets.bottom, // pushes content above keyboard
              ),
              clipBehavior: Clip.antiAlias,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                controller: scrollController,
                child: content,

            ),
            );
          },
        );
      },
    );
  }
}


Future<void> openDynamicFormSheet({
  required BuildContext context,
  required Widget child,
  bool isDismissible = true,
}) {
  final colorTheme = context.colors;

  return showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    enableDrag: isDismissible,
    builder: (ctx) {
      return AnimatedPadding(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom, // keyboard handling
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 0.95 * 1000, // <- overriden below dynamically
            ),
            child: Material(
              color: colorTheme.commonDividerBgColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
              clipBehavior: Clip.antiAlias,
              child: IntrinsicHeight( // <- MAGIC: height = content height
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}



class IconTapButton extends StatefulWidget {
  final IconData icon;
  final Future<void> Function() onTap;
  final Color color;
  final double size;
  final double padding;
  final BorderRadius? borderRadius;
  final bool stopLoadingBeforeCall;

  const IconTapButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.color,
    this.size = 16,
    this.padding = 8,
    this.borderRadius,
    this.stopLoadingBeforeCall = false,
  });

  @override
  State<IconTapButton> createState() => _IconTapButtonState();
}



class _IconTapButtonState extends State<IconTapButton> {


  bool _loading = false;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _loading = false;
  }

  @override
  Widget build(BuildContext context) {
    final shape = widget.borderRadius == null
        ? const CircleBorder()
        : RoundedRectangleBorder(borderRadius: widget.borderRadius!);

    return Material(
      type: MaterialType.transparency,
      shape: shape,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        customBorder: shape,
        onTap: _loading
            ? null
            : () async {
          HapticFeedback.selectionClick();

          setState(() => _loading = true);


          // 🔑 Let Flutter paint loading indicator
          await Future<void>.delayed(Duration(milliseconds: 500));
          await Future.sync(widget.onTap);
          await WidgetsBinding.instance.endOfFrame;



          if (mounted) {
            setState(() => _loading = false);
          }
        },
        splashColor: widget.color.withValues(alpha: 0.25),
        highlightColor: widget.color.withValues(alpha: 0.12),
        child: Padding(
          padding: EdgeInsets.all(widget.padding),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 150),
            child: _loading
                ? SizedBox(
              width: widget.size,
              height: widget.size,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: widget.color,
              ),
            )
                : Icon(
              widget.icon,
              size: widget.size,
              color: widget.color,
            ),
          ),
        ),
      ),
    );
  }
}

