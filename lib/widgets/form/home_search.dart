import 'package:flutter/material.dart';

import '../../../widgets/others/search_form_common.dart';
import '../../constants/app_navigator.dart';
import '../../constants/app_strings.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: AppNavigator.loadJobSearchResultScreen,
      child: AbsorbPointer(
        absorbing: true,
        child: SearchFormFieldCommon(
          hintList: AppStrings.searchHintList,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
