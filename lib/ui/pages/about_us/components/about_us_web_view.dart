import 'dart:async';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewPage extends StatefulWidget {
  final String pageUrl;

  const WebViewPage({super.key, required this.pageUrl});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  InAppWebViewController? _controller;
  bool _isLoading = true;
  bool _hasError = false;
  bool _retryFailed = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _retryLoad() async {
    try {
      setState(() {
        _hasError = false;
        _isLoading = true;
        _retryFailed = false;
      });

      await _controller?.reload();

      await Future.delayed(const Duration(seconds: 3));

      if (_hasError) throw Exception("Failed");
    } catch (e) {
      setState(() {
        _retryFailed = true;
        _isLoading = false;
        _hasError = true;
        _errorMessage = "Something went wrong.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<ContentBlocker> _blockers = [
      ContentBlocker(
        trigger: ContentBlockerTrigger(
          urlFilter: ".*userway.*",
          resourceType: [
            ContentBlockerTriggerResourceType.SCRIPT,
            ContentBlockerTriggerResourceType.DOCUMENT,
          ],
        ),
        action: ContentBlockerAction(type: ContentBlockerActionType.BLOCK),
      )
    ];

    return SafeArea(
      child: _hasError
          ? _buildErrorScreen(context)
          : Stack(
        children: [

          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(widget.pageUrl)),

            initialSettings: InAppWebViewSettings(
              javaScriptEnabled: true,
              supportZoom: false,
              builtInZoomControls: false,
              displayZoomControls: false,
              verticalScrollBarEnabled: false,
              horizontalScrollBarEnabled: false,
              disableContextMenu: true,
              disableDefaultErrorPage: true,
              safeBrowsingEnabled: false,
              mediaPlaybackRequiresUserGesture: false,
              allowsInlineMediaPlayback: true,
              transparentBackground: true,
              preferredContentMode: UserPreferredContentMode.MOBILE,
              forceDark: ForceDark.ON,    // <-- Android dark mode BEFORE loading
              forceDarkStrategy: ForceDarkStrategy.PREFER_WEB_THEME_OVER_USER_AGENT_DARKENING,
              contentBlockers: _blockers
            ),


            onWebViewCreated: (controller) async {
              _controller = controller;
            },

            onLoadStart: (controller, url) async {
              setState(() {
                _isLoading = true;
                _hasError = false;
                _retryFailed = false;
              });
            },

            shouldOverrideUrlLoading:
                (controller, navigationAction) async {},
            onLoadStop: (controller, url) async {
              final isDark = Theme.of(context).brightness == Brightness.dark ? "dark" : "light";

              await controller.evaluateJavascript(source: """
    (function() {
      
      // --- apply theme instantly (prevent white flash) ---
      if ('$isDark' === 'dark') {
        const style = document.createElement('style');
        style.innerHTML = `
          html {
            filter: invert(1) hue-rotate(180deg) !important;
            background: #000 !important;
          }
          img, video, iframe {
            filter: invert(1) hue-rotate(180deg) !important;
          }
        `;
        document.head.appendChild(style);
      }

      function hideAll() {
        const selectors = [
  '.header-area',
  '.header-style-3',
  '.sticky-bar',
  '#navigation',
  '.logo',
  '.header-logo',
  '.burger-icon',
  '.menu-icon',
  '.accessibility-widget',
  '#userwayAccessibilityIcon',
  '[id^="userway"]',
  '[id*="userway"]',
  '[class*="userway"]',
  '[class*="accessibility"]',
  '[id*="accessibility"]',
  '.skip-to-content',
  '.accessibility-btn',
  '.uwy',
  '.uwy-floating-button',
  '#uwy',
  '#userway',
  '.uai-wrapper',
  '.asw-menu-btn',         // <-- 🆕 ADDED
  'footer',
  '.footer-area',
  '.footer-bg',
  '.scroll-to-top'
];
        selectors.forEach(sel => {
          document.querySelectorAll(sel).forEach(el => {
            el.remove();            // remove the element fully
          });
        });

        // Remove iframes injected by UserWay
        document.querySelectorAll('iframe').forEach(frame => {
          const src = frame.src || "";
          if (src.includes("userway") || src.includes("accessibility")) {
            frame.remove();
          }
        });

        // Remove all <script> that load UserWay
        document.querySelectorAll('script').forEach(s => {
          const txt = s.outerHTML;
          if (txt.includes("userway") || txt.includes("accessibility")) {
            s.remove();
          }
        });

        // Remove shadow DOM instances
        const walker = document.createTreeWalker(document, NodeFilter.SHOW_ELEMENT);
        let node;
        while (node = walker.nextNode()) {
          if (node.shadowRoot) {
            const children = node.shadowRoot.querySelectorAll('*');
            children.forEach(child => {
              const test = child.className + child.id;
              if (test.toLowerCase().includes("access")
               || test.toLowerCase().includes("userway")) {
                child.remove();
              }
            });
          }
        }

        document.body.style.margin = '0';
        document.body.style.padding = '0';
      }

      // Apply multiple times because UserWay injects late
      let attempts = 0;
      let killInterval = setInterval(() => {
        hideAll();
        attempts++;
        if (attempts > 50) clearInterval(killInterval);
      }, 120);

      // Final aggressive CSS override
     const forceCSS = document.createElement('style');
forceCSS.innerHTML = `
  *[class*="userway"], *[id*="userway"],
  *[class*="accessibility"], *[id*="accessibility"],
  .uwy, .uwy-floating-button {
    display: none !important;
    visibility: hidden !important;
    opacity: 0 !important;
    pointer-events: none !important;
    height: 0 !important;
    width: 0 !important;
  }
`;
document.head.appendChild(forceCSS);


    })();
  """);

              setState(() => _isLoading = false);
            },




            onLoadError: (controller, url, code, message) {
              setState(() {
                _hasError = true;
                _isLoading = false;
                _errorMessage = message;
              });
            },

            onLoadHttpError: (controller, url, statusCode, _) {
              if (statusCode >= 400) {
                setState(() {
                  _hasError = true;
                  _errorMessage = "HTTP Error $statusCode";
                });
              }
            },
          ),

          if (_isLoading)
             Center(
              child: CircularProgressIndicator(color: context.colors.buttonPrimaryColor),
            ),
        ],
      ),
    );
  }

  // Error UI
  Widget _buildErrorScreen(BuildContext context) {
    if (_retryFailed) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 80),
            const SizedBox(height: 16),
            const Text("Something went wrong."),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go Back"),
            ),
          ],
        ),
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.wifi_off, color: Colors.red, size: 80),
          Text(_errorMessage ?? "Something went wrong"),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: _retryLoad, child: const Text("Retry")),
        ],
      ),
    );
  }
}
