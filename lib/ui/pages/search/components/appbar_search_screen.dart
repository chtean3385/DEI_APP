import 'package:dei_champions/constants/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/others/search_form_common.dart';

AppBar appBarSearch(BuildContext context, {String? query,bool showSearchField = true,ValueChanged<String>? onChanged}) {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: true,
    leadingWidth: 30,
    title:showSearchField ? SearchFormFieldCommon(
      hintList: AppStrings.searchHintList,
      padding: EdgeInsets.zero,
      radius: 10,
      onChanged: onChanged,
    ) :null,
  );
}
