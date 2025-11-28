import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../widgets/others/app_bar_common.dart';
import '../../../providers/providers.dart';
import '../../../widgets/others/custom_theme_button.dart';
import 'component/lets_connect_forms_view.dart';


class LetsConnectScreen extends StatelessWidget {
  const LetsConnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(title: "Write to Us",arrowLeft: true,titleStyleSmall: true),
      body: SafeArea(child: LetsConnectFormView()),
      floatingActionButton: _submit(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }


  Widget _submit() {
    return Consumer(
      builder: (context, ref, _) {
        final isLoading = ref.watch(letsConnectProvider) == PageState.loading;

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: CustomThemeButton(
              isExpanded: false,
              removeAlign: true,
              onTap: isLoading
                  ? null
                  : () async {
                await ref.read(letsConnectProvider.notifier).sendLetsConnectRequest(context);
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
              color:  context.colors.buttonPrimaryColor,
              borderColor:  context.colors.buttonPrimaryColor,
            ),
          ),
        );
      },
    );
  }


}



class CustomFAB extends StatelessWidget {
  final Widget child;
  final double bottomPadding;
  final VoidCallback? onTap;

  const CustomFAB({
    super.key,
    required this.child,
    this.bottomPadding = 16.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding, left: 16, right: 16),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.transparent, // so your child colors show
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: onTap,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

