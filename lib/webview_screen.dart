import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class NuesaWebview extends StatefulWidget {
  @override
  _NuesaWebviewState createState() => _NuesaWebviewState();
}

class _NuesaWebviewState extends State<NuesaWebview> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final Set<String> _favorites = Set<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Connection'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        /*actions: <Widget>[
          NavigationControls(_controller.future),
          Menu(_controller.future, () => _favorites),
        ],*/
      ),
      body: WebView(
        //initialUrl: 'https://a1in1.com/nuesa/nuesa.php',
        initialUrl: 'https://a1in1.com/w_springer/w_springer.php',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }

}