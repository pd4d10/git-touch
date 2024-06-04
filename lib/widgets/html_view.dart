import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlView extends StatefulWidget {
  HtmlView(String text, {String? cssText, List<String> cssLinks = const []})
      : html =
            '<meta name="viewport" content="width=device-width">${cssLinks.map((link) => '<link rel="stylesheet" href="$link" crossorigin="anonymous" />').join('')}<style>body{margin:12px}${cssText ?? ''}</style>$text';
  final String html;

  @override
  State<HtmlView> createState() => _HtmlViewState();
}

class _HtmlViewState extends State<HtmlView> {
  late Timer timer;
  double? height;
  late WebViewController controller;
  var loaded = true;

  updateHeight() async {
    final value = await controller
        .runJavascriptReturningResult('document.documentElement.scrollHeight;');
    // print(value);
    if (mounted) {
      setState(() {
        height = double.parse(value);
      });
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uri = Uri.dataFromString(
      widget.html,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    );
    return SizedBox(
      height: height ??
          1, // must be integer(android). 0 would return the wrong height on page finished.
      child: WebView(
        initialUrl: uri.toString(),
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (c) async {
          controller = c;
          timer = Timer.periodic(const Duration(milliseconds: 1000), (t) {
            updateHeight();
          });
        },
        onPageFinished: (some) async {
          timer.cancel();
          updateHeight();
        },
        navigationDelegate: (request) {
          if (loaded) {
            launchStringUrl(request.url); // TODO:
            return NavigationDecision.prevent;
          } else {
            loaded = true;
            return NavigationDecision.navigate;
          }
        },
      ),
    );
  }
}
