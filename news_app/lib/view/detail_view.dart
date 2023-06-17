import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Detail_screen extends StatefulWidget {
  String newsurl;
  Detail_screen({super.key, required this.newsurl});

  @override
  State<Detail_screen> createState() => _Detail_screenState();
}

class _Detail_screenState extends State<Detail_screen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      widget.newsurl = widget.newsurl.contains("http:")
          ? widget.newsurl.replaceAll("http:", "https:")
          : widget.newsurl;
    });
  }

  final Completer<WebViewController> controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Snack'),
      ),
      body: WebView(
          initialUrl: widget.newsurl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            setState(() {
              controller.complete(webViewController);
            });
          }),
    );
  }
}
