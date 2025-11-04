import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/enums.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/custom_loader.dart';

class HtmlContentVIew extends ConsumerStatefulWidget {
  final String pageName;

  const HtmlContentVIew({super.key, required this.pageName});

  @override
  ConsumerState<HtmlContentVIew> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends ConsumerState<HtmlContentVIew> {
  @override
  void initState() {
    super.initState();
    final controller = ref.read(commonHtmlPageContentsProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchHtmlPageData(pageName: widget.pageName);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(commonHtmlPageContentsProvider);
    if (state.pageState == PageState.loading) {
      return Center(child: const CustomLoader());
    }
    if (state.pageState == PageState.error) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.errorMessage ?? "Something went wrong"),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              child: Text(
                "Go Back",
                style: context.textTheme.labelMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (state.data == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("No details found"),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              child: Text(
                "Go Back",
                style: context.textTheme.labelMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    }
    final content = state.data?.content;
    final processedHtml = highlightSpecialNotes(content ?? "");
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Html(
        data: processedHtml,
        style: {
          "body": Style(
            fontSize: FontSize(14),
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: Colors.black87,
            lineHeight: LineHeight(1.5),
            margin: Margins.zero,
            padding: HtmlPaddings.zero,
          ),

          // Heading 1
          "h1": Style(
            fontSize: FontSize(16),
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            margin: Margins.only(top: 16, bottom: 12),
            padding: HtmlPaddings.only(bottom: 4),
            border: const Border(
              bottom: BorderSide(color: Color(0xFF1565C0), width: 1.2),
            ),
          ),

          // Heading 2
          "h2": Style(
            fontSize: FontSize(16),
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontFamily: GoogleFonts.poppins().fontFamily,
            margin: Margins.only(top: 16, bottom: 10),
            padding: HtmlPaddings.only(bottom: 3),
            border: const Border(
              bottom: BorderSide(color: Color(0xFF1976D2), width: 1),
            ),
          ),

          // Paragraphs
          "p": Style(
            margin: Margins.only(bottom: 12),
            fontSize: FontSize(14),
            fontFamily: GoogleFonts.poppins().fontFamily,
            lineHeight: LineHeight(1.7),
          ),

          // Lists
          "ul": Style(
            margin: Margins.only(left: 16, bottom: 12),
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          "li": Style(
            margin: Margins.only(bottom: 6),
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),

          // Text emphasis
          "strong": Style(
            fontWeight: FontWeight.bold,

            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          "em": Style(
            fontStyle: FontStyle.italic,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),

          // Make the "Note:" label bold
          "b": Style(
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        },
      ),
    );
  }
}

String highlightSpecialNotes(String html) {
  final patterns = {
    'Important:': '#e8f5e9|#4caf50', // green
    'Note:': '#e3f2fd|#2196f3', // blue
    'Warning:': '#fff3e0|#ff9800', // orange
  };

  patterns.forEach((key, value) {
    final parts = value.split('|');
    final bg = parts[0];
    final border = parts[1];

    final regex = RegExp(
      r'<p><strong>' + key + r'(.*?)</p>',
      caseSensitive: false,
      dotAll: true,
    );

    html = html.replaceAllMapped(regex, (match) {
      final text = match.group(1) ?? '';
      return '''
      <div style="background-color:$bg;padding:12px;border-left:5px solid $border;
      border-radius:8px;margin:12px 0;">
        <strong>$key</strong>$text
      </div>
      ''';
    });
  });

  return html;
}
