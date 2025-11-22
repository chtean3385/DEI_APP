import 'dart:async';

import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';

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
          clipBehavior: Clip.antiAlias,child: content),
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
Future<void> openDynamicFormSheet2({
  required BuildContext context,
  required Widget child,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.3,      // starts small
            minChildSize: 0.3,          // minimum height
            maxChildSize: 0.95,         // grows until 95% of screen
            builder: (context, scrollController) {
              return AnimatedPadding(
                duration: const Duration(milliseconds: 150),
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ---- TOP DRAG HANDLE ----
                      Container(
                        width: 45,
                        height: 5,
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),

                      // ---- SCROLLING CONTENT ----
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: child,
                          ),
                        ),
                      ),

                      // ---- STICKY BOTTOM BUTTONS HERE ----
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    },
  );
}
