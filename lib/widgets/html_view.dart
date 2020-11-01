import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MarkdownHtmlView extends StatelessWidget {
  final String html;
  MarkdownHtmlView(this.html);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return HtmlView(html, cssText: theme.markdownCss);
  }
}

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
  double height;
  WebViewController controller;
  var loaded = false;

  @override
  Widget build(BuildContext context) {
    final uri = Uri.dataFromString(
      widget.html,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    );
    return Container(
      height: height ?? 600,
      child: WebView(
        initialUrl: uri.toString(),
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (c) async {
          controller = c;
        },
        onPageFinished: (some) async {
          final res = await controller
              .evaluateJavascript("document.documentElement.scrollHeight;");
          setState(() {
            height = double.parse(res);
          });
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
