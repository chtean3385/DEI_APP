import 'package:flutter/material.dart';

import '../../../../widgets/others/search_form_common.dart';

AppBar appBarSearch(BuildContext context, {String? query}) {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: true,
    title: SearchFormFieldCommon(
      hint: "Search result for here $query",
      padding: EdgeInsets.zero,
    ),
  );
}
