import 'dart:io';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/form/transparent_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_strings.dart';
import '../../constants/app_validators.dart';
import '../../ui/pages/auth/forgot_password/components/forgot_password_email_field.dart';

class IOSStylePhoneField extends StatefulWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final bool isForgotPassword;
  final bool isFromLetsConnect;

  const IOSStylePhoneField({
    Key? key,
    required this.controller,
    this.validator,
    this.focusNode,
    this.nextFocusNode,
    this.isForgotPassword = false,
    this.isFromLetsConnect = false,
  }) : super(key: key);

  @override
  State<IOSStylePhoneField> createState() => _IOSStylePhoneFieldState();
}

class _IOSStylePhoneFieldState extends State<IOSStylePhoneField> {
  late FocusNode _focusNode;
  bool _isExternalFocusNode = false;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      _focusNode = widget.focusNode!;
      _isExternalFocusNode = true;
    } else {
      _focusNode = FocusNode();
    }
    if (Platform.isIOS) {
      _focusNode.addListener(_onFocusChange);
    }
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      _showOverlay();
    } else {
      _removeOverlay();
    }
  }

  void _showOverlay() {
    if (_overlayEntry != null) return; // prevent duplicate overlays
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 0,
        right: 0,
        child: Material(
          color: context.colors.themBasedWhite,
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: context.colors.themBasedWhite,
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  onPressed: () {
                    if (widget.isFromLetsConnect) {
                      if (widget.nextFocusNode != null) {
                        FocusScope.of(context).requestFocus(widget.nextFocusNode);
                      } else {
                        _focusNode.unfocus();
                      }
                      return;
                    }
                    _focusNode.unfocus();
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: CupertinoColors.activeBlue,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);

    if (!_isExternalFocusNode) {
      _focusNode.dispose();
    }

    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.isForgotPassword){
      return ForgotPasswordEmailInput(
        controller: widget.controller,
        focusNode:_focusNode,
      );
    }
    if(widget.isFromLetsConnect){
      return TransparentFormField(
        isRequired: true,
        controller:  widget.controller,
        hint: AppStrings.enterMobile,
        label: AppStrings.mobile,
        autofillHints: [AutofillHints.telephoneNumber],
        textInputAction: TextInputAction.next,
        icon: Icons.phone_android,
        validator: AppValidators.phone,
        keyboardType: TextInputType.phone,
        maxLength: 10,
        onFieldSubmitted: (v){TextInputAction.next;},
        nextFocusNode:widget.nextFocusNode ,
      );
    }
    return  TransparentFormField(
      controller: widget.controller,
      focusNode:_focusNode,
      hint: AppStrings.mobile,
      label: AppStrings.mobile,
      autofillHints: [AutofillHints.telephoneNumber],
      textInputAction: TextInputAction.next,
      icon: Icons.phone_android,
      validator: AppValidators.phone,
      keyboardType: TextInputType.phone,
      maxLength: 10,
      nextFocusNode:widget.nextFocusNode ,
    );

  }
}


