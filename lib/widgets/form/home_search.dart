import 'package:dei_champions/constants/app_keys.dart';
import 'package:flutter/material.dart';

import '../../../widgets/others/search_form_common.dart';
import '../../constants/app_navigator.dart';
import '../../constants/app_strings.dart';

class HomeSearch extends StatelessWidget {
  final bool showTutorial;
  const HomeSearch({super.key,this.showTutorial = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: AppNavigator.loadJobSearchResultScreen,
      child: AbsorbPointer(
        key:!showTutorial ? null : AppTutorialKeys.searchButtonKey,
        absorbing: true,
        child: SearchFormFieldCommon(
          hintList: AppStrings.searchHintList,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
