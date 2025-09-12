import 'package:flutter/material.dart';

import '../../../../widgets/others/search_form_common.dart';

AppBar appBarSearch(BuildContext context, {String? query,bool showSearchField = true}) {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: true,
    leadingWidth: 30,
    title:showSearchField ? SearchFormFieldCommon(
      hint: "Search result for ${query ?? ""} ",
      padding: EdgeInsets.zero,
    ) :null,
  );
}
