import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/snack_bar.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../../networks/api_urls.dart';

class InvoiceDownloader {
  static CancelToken? _cancelToken;

  static Future<void> downloadAndOpenInvoice(
    String? url, {
    String? title,
  }) async {
    try {
      if (url == null || url.trim().isEmpty) {
        showSnackBar("Resume URL is missing.");
        return;
      }

      // Ensure full URL
      final fullUrl = _buildFullUrl(url);

      print("Opening resume URL: $fullUrl");
      _cancelToken?.cancel();
      _cancelToken = CancelToken();

      final uri = Uri.tryParse(fullUrl);
      if (uri == null || !uri.hasScheme) {
        throw Exception("Invalid URL");
      }

      final directory = await getApplicationDocumentsDirectory();

      final filePath =
          "${directory.path}/${title ?? "resume"}_${DateTime.now().millisecondsSinceEpoch}.pdf";
      await Dio().download(fullUrl, filePath, cancelToken: _cancelToken);
      await OpenFilex.open(filePath);
    } on DioException catch (e) {
      if (!CancelToken.isCancel(e)) {
        showSnackBar("Failed to download ${title ?? "invoice"}");
      }
    } finally {
      _cancelToken = null;
    }
  }

  /// ✅ SAFE to call from dispose
  static void cancelDownload() {
    _cancelToken?.cancel();
    _cancelToken = null;
    print("Opening resume URL: cancelDownload");
  }

  static String _buildFullUrl(String rawUrl) {
    // Already a full URL
    if (rawUrl.startsWith('http')) {
      return rawUrl;
    }

    // Remove leading "src/" if present
    final cleanedPath = rawUrl.startsWith('src/')
        ? rawUrl.replaceFirst('src/', '')
        : rawUrl;

    // Ensure no double slashes
    return '${ApiUrls.staticUrl}/$cleanedPath'
        .replaceAll('//', '/')
        .replaceFirst(':/', '://');
  }
}

class DownloadInvoiceButton extends StatefulWidget {
  final String? url;
  final String? title;
  final String label;
  final IconData icon;

  const DownloadInvoiceButton({
    super.key,
    this.url,
    this.title,
    this.label = "Download",
    this.icon = Icons.download,
  });

  @override
  State<DownloadInvoiceButton> createState() => _DownloadInvoiceButtonState();
}

class _DownloadInvoiceButtonState extends State<DownloadInvoiceButton> {
  bool _isDownloading = false;

  Future<void> _handleDownload() async {
    if (_isDownloading) return;
    setState(() => _isDownloading = true);

    try {
      await InvoiceDownloader.downloadAndOpenInvoice(
        widget.url,
        title: widget.title,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to download file")),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isDownloading = false);
      }
    }
  }

  @override
  void dispose() {
    InvoiceDownloader.cancelDownload();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isDownloading ? null : _handleDownload,
      style: ElevatedButton.styleFrom(
        visualDensity: VisualDensity.compact,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        backgroundColor: context.colors.buttonPrimaryColor,
        shape: RoundedRectangleBorder( borderRadius:  BorderRadius.horizontal(
          left: Radius.circular(30),
          right: Radius.circular(30),
        ),),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isDownloading)
            const SizedBox(
              height: 18,
              width: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          else
            Icon(widget.icon, size: 18),

          const SizedBox(width: 10),
          Text(_isDownloading ? "Downloading..." : widget.label),
        ],
      ),
    );
  }
}
