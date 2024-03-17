import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VisaScreen extends StatefulWidget {
  const VisaScreen({Key? key}) : super(key: key);

  @override
  State<VisaScreen> createState() => _VisaScreenState();
}

class _VisaScreenState extends State<VisaScreen> {
  WebViewController controller = WebViewController();

  @override
  void initState() {
    super.initState();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [
          IconButton(
            onPressed: () {
              paymentExitApp(context);
            },
            icon: const Icon(
              Icons.exit_to_app,
            ),
          )
        ]),
        body: WebViewWidget(controller: controller),
      ),
    );
  }

  // to exit from app
  void paymentExitApp(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            'Are you sure completed the pay',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}
