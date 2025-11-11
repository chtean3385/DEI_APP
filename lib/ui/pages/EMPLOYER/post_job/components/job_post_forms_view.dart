import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/ui/pages/employer/post_job/components/job_category_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/app_styles.dart';
import '../../../../../constants/app_validators.dart';
import '../../../../../providers/providers.dart';
import '../../../../../widgets/form/transparent_form_field.dart';
import '../../../../../widgets/others/animated_wrapper.dart';
import '../../../../../widgets/others/custom_decorated_box.dart';
import '../../../auth/signup_employer/widgets/select_city.dart';
import '../../../auth/signup_employer/widgets/select_state.dart';
import 'job_department_selector.dart';
import 'job_salary_selector.dart';
import 'job_type_selector.dart';

class JobPostFormView extends ConsumerStatefulWidget {
  const JobPostFormView({super.key});

  @override
  ConsumerState<JobPostFormView> createState() => _JobPostFormViewState();
}

class _JobPostFormViewState extends ConsumerState<JobPostFormView> {
  final _titleFocus = FocusNode();
  final _departmentFocus = FocusNode();
  final _salaryFocus = FocusNode();
  final _categoryFocus = FocusNode();
  final _typeFocus = FocusNode();
  final _tagsFocus = FocusNode();
  final _areaFocus = FocusNode();
  final _stateFocus = FocusNode();
  final _cityFocus = FocusNode();
  final _countryFocus = FocusNode();

  @override
  void dispose() {
    _titleFocus.dispose();
    _departmentFocus.dispose();
    _salaryFocus.dispose();
    _categoryFocus.dispose();
    _typeFocus.dispose();
    _tagsFocus.dispose();
    _areaFocus.dispose();
    _stateFocus.dispose();
    _cityFocus.dispose();
    _countryFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(addEditJobProvider.notifier);
    final state = ref.watch(addEditJobProvider);

    final theme = Theme.of(context).textTheme;
    final _controller = QuillController(
      document: Document()..insert(0, controller.descriptionController.text),
      selection: const TextSelection.collapsed(offset: 0),
    );

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(
          context,
        ).viewInsets.bottom, // pushes content above keyboard
      ),
      child: AnimatedSignupWrapper(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tell us about your role', style: theme.titleMedium),
              gapH16(),
              TransparentFormField(
                controller: controller.titleController,
                hint: "e.g. Senior Product Designer",
                label: "Job title",
                icon: Icons.work_outline,
                textInputAction: TextInputAction.next,
                validator: AppValidators.fieldEmpty("Job title"),
                textCapitalization: TextCapitalization.words,
                focusNode: _titleFocus,
                nextFocusNode: _departmentFocus,
              ),

              gapH16(),
              JobDepartmentSelector(
                controller: controller.departmentController,
                focusNode: _departmentFocus,
                nextFocus: _salaryFocus,
              ),
              gapH16(),

              JobSalaryField(controller: controller.salaryController, focusNode: _salaryFocus,
                nextFocus: _categoryFocus,),
              gapH16(),

              JobCategorySelector(controller: controller.categoryController, focusNode: _categoryFocus,
                nextFocus: _typeFocus,),
              gapH16(),

              JobTypeSelector(
                controller: controller.typeController,
                focusNode: _typeFocus,
                nextFocus: _tagsFocus,
              ),
              gapH16(),
              Text(
                "job description",
                style: theme.bodyMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              gapH4(),
              Theme(
                data: ThemeData.light().copyWith(
                  scaffoldBackgroundColor: Colors.white,
                  cardColor: Colors.white,
                  primaryColor: AppColors.primaryColor,
                  textTheme: const TextTheme(
                    bodyMedium: TextStyle(color: Colors.black87),
                  ),
                  iconTheme: const IconThemeData(color: Colors.black87),
                  inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Toolbar
                    CustomDecoratedBox(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: QuillSimpleToolbar(
                          controller: _controller,
                          config: QuillSimpleToolbarConfig(
                            // Only show the icons you want
                            showUndo: true,
                            showRedo: true,
                            showFontFamily: false,
                            showFontSize: false,
                            showBoldButton: true,
                            showItalicButton: true,
                            showUnderLineButton: false,
                            showStrikeThrough: false,
                            showColorButton: false,
                            showBackgroundColorButton: false,
                            showLink: true,
                            showAlignmentButtons: true,
                            showListBullets: true,
                            showListNumbers: true,
                            showQuote: true,
                            showCodeBlock: false,
                            showDividers: true,
                            showDirection: false,
                            showInlineCode: false,
                            showIndent: false,
                            showClearFormat: false,
                            showHeaderStyle: true,
                            // 'Paragraph' dropdown
                            multiRowsDisplay: false,

                            // Visuals
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            iconTheme: QuillIconTheme(
                              iconButtonUnselectedData: IconButtonData(
                                color: Colors.black87,
                              ),
                              iconButtonSelectedData: IconButtonData(
                                color: Colors.white,
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    CustomDecoratedBox(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(16),
                      ),
                      color: AppColors.primaryColor.withValues(alpha: .15),
                      child: QuillEditor.basic(
                        controller: _controller,
                        config: QuillEditorConfig(
                          minHeight: 100,
                          placeholder: "Add your job description...",

                          customStyles: DefaultStyles(
                            placeHolder: DefaultTextBlockStyle(
                              TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontFamily: 'Poppins',
                              ),
                              HorizontalSpacing.zero,
                              VerticalSpacing.zero,
                              VerticalSpacing.zero,
                              const BoxDecoration(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              gapH16(),

              TransparentFormField(
                controller: controller.tagsController,
                hint: "Enter Tags",
                label: "Tags",
                icon: Icons.public_outlined,
                textInputAction: TextInputAction.next,
                validator: AppValidators.fieldEmpty("Country"),
                textCapitalization: TextCapitalization.words,
                focusNode: _tagsFocus,
                nextFocusNode: _areaFocus,
              ),
              gapH16(),
              TransparentFormField(
                controller: controller.areaController,
                hint: "Enter Area",
                label: "Area",
                icon: Icons.home_outlined,
                textInputAction: TextInputAction.next,
                validator: AppValidators.fieldEmpty("Area"),
                textCapitalization: TextCapitalization.words,
                focusNode: _areaFocus,
                nextFocusNode: _stateFocus,
              ),
              gapH16(),
              SelectState(
                controller: controller.stateController,
                focusNode: _stateFocus,
                nextFocus: _cityFocus,
              ),
              gapH16(),
              SelectCity(
                controller: controller.cityController,
                focusNode: _cityFocus,
                nextFocus: _countryFocus,
              ),
              gapH16(),
              TransparentFormField(
                controller: controller.countryController,
                hint: "Enter Country",
                label: "Country",
                icon: Icons.public_outlined,
                validator: AppValidators.fieldEmpty("Country"),
                textCapitalization: TextCapitalization.words,
                focusNode: _countryFocus,
                textInputAction: TextInputAction.done,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
