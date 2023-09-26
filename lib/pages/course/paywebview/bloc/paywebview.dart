import 'package:edtech/common/values/constant.dart';
import 'package:edtech/common/widgets/base_text_widget.dart';
import 'package:edtech/pages/course/paywebview/bloc/payview_bloc.dart';
import 'package:edtech/pages/course/paywebview/bloc/payview_events.dart';
import 'package:edtech/pages/course/paywebview/bloc/payview_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/foundation.dart';

import 'dart:async';

class PayWebView extends StatefulWidget {
  const PayWebView({super.key});

  @override
  State<PayWebView> createState() => _PayWebViewState();
}

class _PayWebViewState extends State<PayWebView> {
  //late final WebViewController webViewController;
  late final WebViewController controller;

  updateRequestUrl(String url) {
    setState(() {
      url = 'http://10.0.2.2:8000/success';
    });
    print('inside updateRequest method $url');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    context.read<PayWebViewBlocs>().add(TriggerWebView(args["url"]));
    print('Check na ' + args["url"]);

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..addJavaScriptChannel('Pay',
          onMessageReceived: (JavaScriptMessage message) {
        print(message.message);
        Navigator.of(context).pop(message.message);
      })
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page started loading finished: $url');
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');

            if (change.url == "http://127.0.0.1:8000/success") {
              updateRequestUrl(change.url!);
              // change.url = AppConstants.SERVER_API_URL + 'success';
            }
            debugPrint('url change to ${change.url}');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
     Page resource error:
     code: ${error.errorCode}
     description: ${error.description}
     errorType: ${error.errorType}
     isForMainFrame: ${error}
             ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }

            if (request.url.contains('http://127.0.0.1:8000')) {
              print('Old url ' + request.url);
              request.url.replaceAll('http://127.0.0.1:8000/success',
                  AppConstants.SERVER_API_URL + 'success');

              // updateRequestUrl(request.url);
              print('New url ' + request.url);
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(args["url"]));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controller.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayWebViewBlocs, PayWebViewStates>(
        builder: (context, state) {
      return Scaffold(
        appBar: buildAppBar("Payment Page"),
        body: state.url == ""
            ? Container(
                width: 50.w,
                height: 50.h,
                child: CircularProgressIndicator(),
              )
            : WebViewWidget(controller: controller),
      );
    });
  }
}
