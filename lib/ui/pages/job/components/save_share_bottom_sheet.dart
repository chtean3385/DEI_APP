import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/ui/pages/job/components/save_hide_button.dart';
import 'package:flutter/material.dart';

void showJobOptionsSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDynamicButton(
                 activeIcon:  Icons.bookmark,
                  inActiveIcon:Icons.bookmark_border ,
                  activeTitle:"Saved Job" ,
                  inActiveTitle:"Save Job" ,
                  size:30 ,
                  smaller: false,
                  onPressed: (Saved) async {
                    // 🔹 Add API call here
                    print("Save/Hide tapped!");
                    return true;
                  },
                ),
                gapH16(),
                CustomDynamicButton(
                  activeIcon: Icons.check_circle,
                  inActiveIcon: Icons.send,
                  activeTitle: "Applied Job",
                  inActiveTitle: "Apply Job",
                  size: 30,
                  smaller: false,
                  onPressed: (applied)  async {
                    // 🔹 Add apply logic/API call here
                    print("Apply tapped!");
                    return true;
                  },
                ),
                gapH16(),


                CustomDynamicButton(
                  activeIcon:  Icons.share,
                  inActiveIcon:Icons.share_outlined ,
                  activeTitle:"Shared Job" ,
                  inActiveTitle:"Share Job" ,
                  size:30 ,
                  smaller: false,
                  onPressed: (shared) async {
                    // 🔹 Add API call here
                    print("Share tapped!");
                    return true;
                  },
                ),

                gapH16()
              ],
            ),
          ),
        ),
      );
    },
  );
}
