import 'package:dei_champions/constants/app_styles.dart';
import 'package:flutter/material.dart';

void showJobOptionsSheet(BuildContext context) {
  final theme =Theme.of(context).textTheme;
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.bookmark_border,color: Colors.black,),
                title:  Text('Save Job',style:theme.bodyMedium ,),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: handle save action
                },
              ),
              ListTile(
                leading: const Icon(Icons.share_outlined,color: Colors.black,),
                title:  Text('Share Job',style:theme.bodyMedium ,),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: handle share action
                },
              ),
              gapH16()
            ],
          ),
        ),
      );
    },
  );
}
