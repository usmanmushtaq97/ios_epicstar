import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebHomeView extends StatefulWidget {
  const WebHomeView({Key? key}) : super(key: key);

  @override
  State<WebHomeView> createState() => _WebHomeViewState();
}

class _WebHomeViewState extends State<WebHomeView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  final _key = UniqueKey();
  int _stackToView = 1;

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }

  void _onProgress(int value) {
    debugPrint("_onProgress: $value");
  }

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isIOS) {
      WebView.platform = CupertinoWebView();
    } else if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _stackToView,
          children: [
            Container(
              color: Colors.black12,
              child: WebView(
                key: _key,
                // javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'https://epicstar.ae/',
                gestureNavigationEnabled: true,
                backgroundColor: Colors.redAccent,
                onWebViewCreated: (WebViewController controller) {
                  _controller.complete(controller);
                },
                onPageFinished: _handleLoad,
                onProgress: _onProgress,
              ),
            ),
            const Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
