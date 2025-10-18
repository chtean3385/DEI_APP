import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/ui/pages/employer/post_job/components/job_category_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_styles.dart';
import '../../../../constants/app_validators.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/form/transparent_form_field.dart';
import '../../../../widgets/others/animated_wrapper.dart';
import '../../../../widgets/others/custom_decorated_box.dart';
import '../../auth/signup_employer/widgets/select_city.dart';
import '../../auth/signup_employer/widgets/select_state.dart';
import 'components/job_department_selector.dart';
import 'components/job_salary_selector.dart';
import 'components/job_type_selector.dart';
final hasFetchedInitialDataProvider = StateProvider<bool>((ref) => false);
class PostJobScreen extends ConsumerWidget {
  final bool isEditJobPost;

  const PostJobScreen({super.key,this.isEditJobPost = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addEditJobProvider);
    final controller = ref.read(addEditJobProvider.notifier);
    // Run only once after the first frame
    final hasFetched = ref.watch(hasFetchedInitialDataProvider);

    if (isEditJobPost && !hasFetched) {
      // Run only once
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.fetchInitialProfileData();
        ref.read(hasFetchedInitialDataProvider.notifier).state = true;
      });
    }
    final theme = Theme.of(context).textTheme;
    // QuillController _controller = QuillController.basic();
    final _controller = QuillController(
      document: Document()..insert(0, controller.descriptionController.text),
      selection: const TextSelection.collapsed(offset: 0),
    );

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // pushes content above keyboard
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
              ),
              gapH16(),
              JobDepartmentSelector(
                controller: controller.departmentController,
              ),
              gapH16(),

              JobSalaryField(controller: controller.salaryController),
              gapH16(),

              JobCategorySelector(controller: controller.categoryController),
              gapH16(),

              JobTypeSelector(controller: controller.typeController),
              gapH16(),

              TransparentFormField(
                controller: controller.tagsController,
                hint: "Enter Tags",
                label: "Tags",
                icon: Icons.public_outlined,
                textInputAction: TextInputAction.next,
                validator: AppValidators.fieldEmpty("Country"),
                textCapitalization: TextCapitalization.words,
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
              ),
              gapH16(),
              SelectState(controller: controller.stateController),
              gapH16(),
              SelectCity(controller: controller.cityController),
              gapH16(),
              TransparentFormField(
                controller: controller.countryController,
                hint: "Enter Country",
                label: "Country",
                icon: Icons.public_outlined,
                textInputAction: TextInputAction.next,
                validator: AppValidators.fieldEmpty("Country"),
                textCapitalization: TextCapitalization.words,
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


                          customStyles: DefaultStyles(placeHolder:
                          DefaultTextBlockStyle(
                            TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black54,fontFamily:  'Poppins'),
                              HorizontalSpacing.zero,
                            VerticalSpacing.zero,
                            VerticalSpacing.zero,
                              const BoxDecoration()
                          ))
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
