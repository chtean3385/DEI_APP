import 'package:flutter/material.dart';

import '../../../widgets/others/search_form_common.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      // onTap: AppNavigator.loadSearchScreen,
      child: AbsorbPointer(
        absorbing: true,
        child: SearchFormFieldCommon(
          hint: "Search jobs here",
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
