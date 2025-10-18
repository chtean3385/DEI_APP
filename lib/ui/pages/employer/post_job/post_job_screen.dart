import 'package:dei_champions/ui/pages/employer/post_job/components/job_category_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_styles.dart';
import '../../../../constants/app_validators.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/form/transparent_form_field.dart';
import '../../../../widgets/others/custom_decorated_box.dart';
import '../../auth/signup_employer/widgets/select_city.dart';
import '../../auth/signup_employer/widgets/select_state.dart';
import 'components/job_department_selector.dart';
import 'components/job_salary_selector.dart';
import 'components/job_type_selector.dart';

class PostJobScreen extends ConsumerWidget {
  const PostJobScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addEditJobProvider);
    final controller = ref.read(addEditJobProvider.notifier);
    final theme = Theme.of(context).textTheme;

    return  CustomDecoratedBox(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tell us about your role', style: theme.titleMedium),
            gapH16(),
            TransparentFormField(
              controller: controller.titleController,
              hint:"e.g. Senior Product Designer",
              label: "Job title",
              icon: Icons.work_outline,
              textInputAction: TextInputAction.next,
              validator: AppValidators.fieldEmpty( "Job title"),
              textCapitalization: TextCapitalization.words,
            ),
            gapH16(),
            JobDepartmentSelector(controller: controller.departmentController),
            gapH16(),

            JobSalaryField(controller: controller.salaryController),
            gapH16(),

            JobCategorySelector(controller: controller.categoryController),
            gapH16(),

            JobTypeSelector(controller: controller.typeController),
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
              controller: controller.areaController,
              hint: "Enter Country",
              label: "Country",
              icon: Icons.public_outlined,
              textInputAction: TextInputAction.next,
              validator: AppValidators.fieldEmpty("Country"),
              textCapitalization: TextCapitalization.words,
            ),
            gapH16(),


          ],
        ),
      ),


    );
  }
}
