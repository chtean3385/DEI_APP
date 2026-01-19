import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class JobShareUtil {
  JobShareUtil._(); // private constructor

  static Future<void> shareJob({
    required BuildContext context,
    required String jobId,
    required String jobTitle,
  }) async {
    final jobUrl = "https://deichampion.com/job-details?job=$jobId";

    final message =
        '''
🚀 Job Opening: $jobTitle

We’re hiring! Explore this exciting opportunity and apply now.

🔗 View job details & apply:
$jobUrl

Don’t miss out – apply today!
''';

    final box = context.findRenderObject() as RenderBox?;

    await SharePlus.instance.share(
      ShareParams(
        text: message,
        subject: jobTitle,
        sharePositionOrigin: box != null
            ? box.localToGlobal(Offset.zero) & box.size
            : null,
      ),
    );
  }
}
