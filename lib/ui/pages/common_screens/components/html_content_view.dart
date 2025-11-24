import 'package:dei_champions/constants/app_theme.dart';
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
    final colorTheme = context.colors;

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
                backgroundColor: colorTheme.buttonPrimaryColor,
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
                backgroundColor: colorTheme.buttonPrimaryColor,
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
    final processedHtml = highlightSpecialNotes(content ?? "",isDarkMode: Theme.of(context).brightness == Brightness.dark,);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Html(
        data: processedHtml,
        style: {
          "body": Style(
            fontSize: FontSize(14),
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: colorTheme.black87,
            lineHeight: LineHeight(1.5),
            margin: Margins.zero,
            padding: HtmlPaddings.zero,
          ),

          // Heading 1
          "h1": Style(
            fontSize: FontSize(16),
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w700,
            color: colorTheme.themBasedBlack,
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
            color: colorTheme.themBasedBlack,
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

String highlightSpecialNotes(String html, {required bool isDarkMode}) {
  final patterns = {
    'Important:': isDarkMode
        ? '#1b3c2d|#66bb6a|#c8e6c9'  // dark-bg | border | text
        : '#e8f5e9|#4caf50|#1b5e20',

    'Note:': isDarkMode
        ? '#10273f|#64b5f6|#bbdefb'
        : '#e3f2fd|#2196f3|#0d47a1',

    'Warning:': isDarkMode
        ? '#3b2e12|#ffb74d|#ffe0b2'
        : '#fff3e0|#ff9800|#e65100',
  };

  patterns.forEach((key, value) {
    final parts = value.split('|');
    final bg = parts[0];
    final border = parts[1];
    final textColor = parts[2];

    final regex = RegExp(
      r'<p><strong>' + key + r'(.*?)</p>',
      caseSensitive: false,
      dotAll: true,
    );

    html = html.replaceAllMapped(regex, (match) {
      final text = match.group(1) ?? '';
      return '''
      <div style="background-color:$bg;padding:12px;border-left:5px solid $border;
          border-radius:8px;margin:12px 0;color:$textColor;">
        <strong style="color:$textColor;">$key</strong>$text
      </div>
      ''';
    });
  });

  return html;
}

