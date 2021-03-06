import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Webview'),
      ),
      body: Column(
        children: [
          Text("To know more about google: "),
          WebView(
            initialUrl: 'https://www.google.com',
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ],
      ),
    );
  }
}
