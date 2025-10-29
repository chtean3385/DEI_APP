import 'package:dei_champions/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SaveHideButton extends StatefulWidget {
  final bool showSave;
  final bool isSmaller;
  final VoidCallback? onPressed;

  const SaveHideButton({
    super.key,
    required this.showSave,
    this.onPressed,
    this.isSmaller = true,
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
            size: widget.isSmaller ? 20 : 30,
            color: isActive ? AppColors.primaryColor : Colors.black54,
          ),
          const SizedBox(width: 4),
          Text(
            widget.showSave ? (isActive ? "Saved" : "Save") : "Hide",
            style: widget.isSmaller
                ? theme.labelSmall?.copyWith(
                    color: isActive ? AppColors.primaryColor : Colors.black54,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  )
                : theme.labelMedium?.copyWith(
                    color: isActive ? AppColors.primaryColor : Colors.black54,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  ),
          ),
        ],
      ),
    );
  }
}

////
// class CustomDynamicButton extends StatefulWidget {
//   final IconData activeIcon;
//   final IconData inActiveIcon;
//   final String activeTitle;
//   final String inActiveTitle;
//   final double size;
//   final bool smaller;
//   final bool initialValue;
//   final ValueChanged<bool>? onPressed;
//
//   const CustomDynamicButton({
//     super.key,
//     this.onPressed,
//     this.size = 20,
//     this.smaller = true,
//     this.initialValue = false,
//     required this.activeIcon,
//     required this.inActiveIcon,
//     required this.activeTitle,
//     required this.inActiveTitle,
//   });
//
//   @override
//   State<CustomDynamicButton> createState() => _CustomDynamicButtonState();
// }
//
// class _CustomDynamicButtonState extends State<CustomDynamicButton> {
//   late bool isActive = false;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     isActive = widget.initialValue;
//   }
//
//   void _toggle() {
//     setState(() {
//       isActive = !isActive;
//     });
//     widget.onPressed?.call(isActive); // trigger parent action if provided
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;
//     return InkWell(
//       onTap: _toggle,
//       borderRadius: BorderRadius.circular(8),
//       child: Row(
//         children: [
//           Icon(
//             isActive ? widget.activeIcon : widget.inActiveIcon,
//             size: widget.size,
//             color: isActive ? AppColors.primaryColor : Colors.black54,
//           ),
//           const SizedBox(width: 4),
//           Text(
//             isActive ? widget.activeTitle : widget.inActiveTitle,
//             style: widget.smaller
//                 ? theme.labelSmall?.copyWith(
//                     color: isActive ? AppColors.primaryColor : Colors.black54,
//                     fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
//                   )
//                 : theme.labelMedium?.copyWith(
//                     color: isActive ? AppColors.primaryColor : Colors.black54,
//                     fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class CustomDynamicButton extends StatefulWidget {
  final IconData activeIcon;
  final IconData inActiveIcon;
  final String activeTitle;
  final String inActiveTitle;
  final double size;
  final bool smaller;
  final bool initialValue;
  final Future<bool> Function(bool)? onPressed; // ✅ callback returns whether to accept toggle

  const CustomDynamicButton({
    super.key,
    this.onPressed,
    this.size = 20,
    this.smaller = true,
    this.initialValue = false,
    required this.activeIcon,
    required this.inActiveIcon,
    required this.activeTitle,
    required this.inActiveTitle,
  });

  @override
  State<CustomDynamicButton> createState() => _CustomDynamicButtonState();
}

class _CustomDynamicButtonState extends State<CustomDynamicButton> {
  late bool isActive = widget.initialValue;
  bool isBusy = false;

  Future<void> _toggle() async {
    if (isBusy) return; // prevent spam tapping
    setState(() => isBusy = true);

    final nextValue = !isActive;

    bool shouldToggle = true;
    if (widget.onPressed != null) {
      shouldToggle = await widget.onPressed!(nextValue);
    }

    if (shouldToggle) {
      setState(() => isActive = nextValue);
    }

    setState(() => isBusy = false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return InkWell(
      onTap: _toggle,
      borderRadius: BorderRadius.circular(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isBusy)
            const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          else
            Icon(
              isActive ? widget.activeIcon : widget.inActiveIcon,
              size: widget.size,
              color: isActive ? AppColors.primaryColor : Colors.black54,
            ),
          const SizedBox(width: 4),
          Text(
            isActive ? widget.activeTitle : widget.inActiveTitle,
            style: widget.smaller
                ? theme.labelSmall?.copyWith(
              color: isActive ? AppColors.primaryColor : Colors.black54,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            )
                : theme.labelMedium?.copyWith(
              color: isActive ? AppColors.primaryColor : Colors.black54,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
