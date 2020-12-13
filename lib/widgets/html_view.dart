import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlView extends StatefulWidget {
  final String html;
  HtmlView(String text, {String cssText, List<String> cssLinks = const []})
      : html = '<meta name="viewport" content="width=device-width">' +
            cssLinks
                .map((link) =>
                    '<link rel="stylesheet" href="$link" crossorigin="anonymous" />')
                .join('') +
            '<style>body{margin:12px}${cssText ?? ''}</style>' +
            text;

  @override
  _HtmlViewState createState() => _HtmlViewState();
}

class _HtmlViewState extends State<HtmlView> {
  Timer timer;
  double height;
  WebViewController controller;
  var loaded = false;

  updateHeight() async {
    final value = await controller
        .evaluateJavascript("document.documentElement.scrollHeight;");
    // print(value);
    setState(() {
      height = double.parse(value);
    });
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
    return Container(
      height: height ??
          1, // must be integer(android). 0 would return the wrong height on page finished.
      child: WebView(
        initialUrl: uri.toString(),
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (c) async {
          controller = c;
          timer = Timer.periodic(Duration(milliseconds: 1000), (t) {
            updateHeight();
          });
        },
        onPageFinished: (some) async {
          timer.cancel();
          updateHeight();
        },
        navigationDelegate: (request) {
          if (loaded) {
            launchUrl(request.url); // TODO:
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
