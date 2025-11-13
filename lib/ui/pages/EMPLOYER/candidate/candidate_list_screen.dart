import 'package:dei_champions/constants/app_strings.dart';
import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/others/search_form_common.dart';
import 'candidates_components/candidates_list.dart';
import 'candidates_components/filter_button.dart';

class CandidatesScreen extends StatelessWidget {
  const CandidatesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(
        title: "Candidates",
        titleStyleSmall: true,
        actions: [CandidatesFilter()],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchFormFieldCommon(
             hintList: AppStrings.searchHintList,
              padding: EdgeInsets.all(16),
              hintColor: Colors.black54,
              radius: 8,
            ),
            // candidates list
            Expanded(child: CandidatesListView()),
          ],
        ),
      ),
    );
  }
}
