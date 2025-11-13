import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../widgets/others/app_bar_common.dart';
import '../../../constants/app_colors.dart';
import '../../../providers/providers.dart';
import '../../../widgets/others/custom_theme_button.dart';
import 'component/lets_connect_forms_view.dart';


class LetsConnectScreen extends StatelessWidget {
  const LetsConnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(title: "Write to Us",arrowLeft: true,titleStyleSmall: true),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: LetsConnectFormView(),
            ),
            SafeArea(child: _submit())
          ],
        ),
      ),
    );
  }

  Widget _submit() {
    return Consumer(
      builder: (context, ref, _) {
        final isLoading = ref.watch(letsConnectProvider) == PageState.loading;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomThemeButton(
            isExpanded: false,
            onTap: isLoading
                ? null
                : () async {
              await ref.read(letsConnectProvider.notifier).updateEmployeeProfileDetails(context);
            },
            isLoading: isLoading,
            padding: isLoading
                ? const EdgeInsets.symmetric(horizontal: 50, vertical: 12)
                : const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Submit',
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),

            radius: 30,
            color: AppColors.primaryColor,
            borderColor: AppColors.primaryColor,
          ),
        );
      },
    );
  }


}



