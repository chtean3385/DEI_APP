import 'package:dei_champions/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkDuration extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController? workedTillController;
  final bool isWorking;

  const WorkDuration({
    super.key,
    required this.controller,
    this.isWorking = true,
    this.workedTillController,
  });


  void _showMonthYearPicker(BuildContext context, TextEditingController ctr) {
    final now = DateTime.now();
    int selectedYear = now.year;
    int selectedMonth = now.month;

    // Month names (short form)
    final List<String> monthNames =
    List.generate(12, (i) => DateFormat.MMM().format(DateTime(0, i + 1)));

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.9),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Done button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      ctr.text = "${monthNames[selectedMonth - 1]} $selectedYear";
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Done",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    // Month picker
                    Expanded(
                      child: CupertinoPicker(
                        scrollController: FixedExtentScrollController(
                          initialItem: selectedMonth - 1,
                        ),
                        itemExtent: 40,
                        onSelectedItemChanged: (index) {
                          selectedMonth = index + 1;
                        },
                        children: monthNames
                            .map(
                              (name) => Center(
                            child: Text(
                              name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                            .toList(),
                      ),
                    ),
                    // Year picker
                    Expanded(
                      child: CupertinoPicker(
                        scrollController: FixedExtentScrollController(
                          initialItem: now.year - 1970,
                        ),
                        itemExtent: 40,
                        onSelectedItemChanged: (index) {
                          selectedYear = 1970 + index;
                        },
                        children: List.generate(
                          (now.year - 1970 + 10), // 10 years into future
                              (index) => Center(
                            child: Text(
                              "${1970 + index}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Work duration*',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _showMonthYearPicker(context,controller),
                child: AbsorbPointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color:  AppColors.primaryColor.withValues(alpha: 0.13),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: TextFormField(
                        controller: controller,
                        cursorColor: Colors.black,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        decoration: InputDecoration(
                          hintText: "Select month/year",
                          hintStyle: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.black54,
                          ),
                          errorStyle: theme.textTheme.displaySmall?.copyWith(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                          ),
                          prefixIcon: const Icon(
                            Icons.calendar_today,
                            color: Colors.black54,
                            size: 22,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),
                        ),
                        validator: (value) =>
                            value == null || value.isEmpty ? "Required" : null,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 32),
            if (isWorking)
              Text(
                'Present',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                ),
              ),

            if (!isWorking)
              Expanded(
                child: GestureDetector(
                  onTap: () => _showMonthYearPicker(context,workedTillController!),
                  child: AbsorbPointer(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color:  AppColors.primaryColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color:  AppColors.primaryColor.withValues(alpha: 0.13),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: TextFormField(
                          controller: workedTillController,
                          cursorColor: Colors.black,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                          decoration: InputDecoration(
                            hintText: "Select month/year",
                            hintStyle: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.black54,
                            ),
                            errorStyle: theme.textTheme.displaySmall?.copyWith(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                            ),
                            prefixIcon: const Icon(
                              Icons.calendar_today,
                              color: Colors.black54,
                              size: 22,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 18,
                            ),
                          ),
                          validator: (value) => value == null || value.isEmpty
                              ? "Required"
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
