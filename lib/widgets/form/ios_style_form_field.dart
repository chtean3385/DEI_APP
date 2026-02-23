// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../constants/app_strings.dart';
// import '../../utils/app_textformfield.dart';
//
// class IOSStylePhoneField extends StatefulWidget {
//   final TextEditingController controller;
//   final FormFieldValidator<String>? validator;
//   final FocusNode? focusNode;
//
//   const IOSStylePhoneField({
//     Key? key,
//     required this.controller,
//     this.validator, this.focusNode,
//   }) : super(key: key);
//
//   @override
//   State<IOSStylePhoneField> createState() => _IOSStylePhoneFieldState();
// }
//
// class _IOSStylePhoneFieldState extends State<IOSStylePhoneField> {
//   late FocusNode _focusNode;
//   bool _isExternalFocusNode = false;
//   OverlayEntry? _overlayEntry;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.focusNode != null) {
//       _focusNode = widget.focusNode!;
//       _isExternalFocusNode = true;
//     } else {
//       _focusNode = FocusNode();
//     }
//     if (Platform.isIOS) {
//       _focusNode.addListener(_onFocusChange);
//     }
//   }
//
//   void _onFocusChange() {
//     if (_focusNode.hasFocus) {
//       _showOverlay();
//     } else {
//       _removeOverlay();
//     }
//   }
//
//   void _showOverlay() {
//     if (_overlayEntry != null) return; // prevent duplicate overlays
//     _overlayEntry = OverlayEntry(
//       builder: (context) => Positioned(
//         bottom: MediaQuery.of(context).viewInsets.bottom,
//         left: 0,
//         right: 0,
//         child: Material(
//           color: CupertinoColors.systemGrey6,
//           child: Container(
//             height: 44,
//             decoration: BoxDecoration(
//               border: Border(
//                 top: BorderSide(
//                   color: CupertinoColors.systemGrey6,
//                   width: 0.5,
//                 ),
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 CupertinoButton(
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   onPressed: () {
//                     _focusNode.unfocus();
//                   },
//                   child: Text(
//                     'Done',
//                     style: TextStyle(
//                       color: CupertinoColors.activeBlue,
//                       fontSize: 17,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//
//     Overlay.of(context).insert(_overlayEntry!);
//   }
//
//   void _removeOverlay() {
//     _overlayEntry?.remove();
//     _overlayEntry = null;
//   }
//
//   @override
//   void dispose() {
//     _focusNode.removeListener(_onFocusChange);
//
//     if (!_isExternalFocusNode) {
//       _focusNode.dispose();
//     }
//
//     _removeOverlay();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return AppTextFormField(
//       controller: widget.controller,
//       focusNode: _focusNode,
//       keyboardType: TextInputType.phone,
//       maxLength: 10,
//       validator: widget.validator,
//       label: AppStrings.mobile,
//       textInputType: TextInputType.phone,
//       autofillHints: [AutofillHints.telephoneNumber],
//       textInputAction: TextInputAction.done,
//     );
//
//   }
// }