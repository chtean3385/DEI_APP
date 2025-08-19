import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../main.dart';
import '../constants/app_colors.dart';

class DatePickerTextField extends StatelessWidget {
  DateTime? dateTime;
  final DateTime? firstDate, lastDate, initialDate;
  final FormFieldValidator<String>? validator;
  final Function(DateTime)? onDateSelected;
  final String? hint;
  final String? label;
  final bool isRequired;
  final bool isShowBorderAndOutlinedLabel;
  final double? horizontalContentPadding;
  final Color? borderColor;
  final AutovalidateMode? autoValidateMode;
  final Color? fillColor;

  final TextEditingController textEditingController;

  // final FocusNode _focusNode=FocusNode();

  DatePickerTextField({
    super.key,
    this.hint,
    this.label,
    this.firstDate,
    this.lastDate,
    this.dateTime,
    this.validator,
    this.isRequired = true,
    this.onDateSelected,
    this.isShowBorderAndOutlinedLabel = true,
    this.horizontalContentPadding,
    required this.textEditingController,
    this.borderColor,
    this.initialDate,
    this.autoValidateMode,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    if (dateTime != null) {
      textEditingController.text = DateFormat(
        'MM/dd/yyyy',
      ).format(dateTime ?? DateTime.now()).toString();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null && !isShowBorderAndOutlinedLabel)
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: label!,
              style: context.textTheme.bodyMedium,
              children: const [
                TextSpan(
                  text: ' *',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                ),
              ],
            ),
          ),
        TextFormField(
          controller: textEditingController,
          minLines: 1,
          maxLines: 1,
          // focusNode: _focusNode,
          // style: Theme.of(context).textTheme.bodyMedium,
          style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800),
          autovalidateMode:
              autoValidateMode ?? AutovalidateMode.onUserInteraction,
          validator:
              validator ??
              (value) => isRequired && dateTime == null ? "please fill" : null,
          enableSuggestions: true,
          autocorrect: true,
          enableInteractiveSelection: false,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            pickDate();
          },
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: fillColor ?? Colors.transparent,
            counterText: '',
            // hintText: 'Hint',
            label: isShowBorderAndOutlinedLabel
                ? RichText(
                    textAlign: TextAlign.right,
                    text: TextSpan(
                      text: label,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  )
                : null,

            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_month_sharp),
              onPressed: () async {
                pickDate();
              },
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: horizontalContentPadding ?? 12,
              vertical: 6,
            ),
            border: isShowBorderAndOutlinedLabel
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: borderColor ?? Colors.black.withOpacity(.5),
                      width: .2,
                    ),
                  )
                : InputBorder.none,
            errorBorder: isShowBorderAndOutlinedLabel
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: borderColor ?? Colors.black.withOpacity(.5),
                      width: 1,
                    ),
                  )
                : InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: borderColor ?? Colors.black.withOpacity(.8),
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(.5),
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(.5),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: borderColor ?? Colors.black.withOpacity(.5),
                width: 1,
              ),
            ),

            // ),
          ),
        ),
      ],
    );
  }

  pickDate() async {
    dateTime = await showDatePicker(
      initialDate: initialDate ?? DateTime.now(),
      context: navigatorKey.currentContext!,
      firstDate: firstDate ?? DateTime(2020),
      lastDate: lastDate ?? DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor, // Header background
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor, // Button text color
              ),
            ), dialogTheme: DialogThemeData(backgroundColor: Colors.white),
          ),
          child: child!,
        );
      },
    );
    if (dateTime != null) {
      onDateSelected?.call(dateTime!);

      textEditingController.text = DateFormat(
        "MM/dd/yyyy",
      ).format(dateTime ?? DateTime.now()).toString();
    }
  }
}
