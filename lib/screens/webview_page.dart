import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class WebviewPage extends StatefulWidget {
  final String url;
  final String title;

  const WebviewPage({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    if (defaultTargetPlatform == TargetPlatform.android) {
      WebViewPlatform.instance = AndroidWebViewPlatform();
    }

    _controller = WebViewController()..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
