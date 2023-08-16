import 'package:edtech/pages/course/paywebview/bloc/payview_bloc.dart';
import 'package:edtech/pages/course/paywebview/bloc/payview_events.dart';
import 'package:edtech/pages/course/paywebview/bloc/payview_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayWebView extends StatefulWidget {
  const PayWebView({super.key});

  @override
  State<PayWebView> createState() => _PayWebViewState();
}

class _PayWebViewState extends State<PayWebView> {
  late final WebViewController webViewController;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    print("-- my returned stripe url is $args ---------");
    context.read<PayWebViewBlocs>().add(TriggerWebView(args["url"]));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayWebViewBlocs, PayWebViewStates>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Hello Payment"),
        ),
        body: state.url == ""
            ? Container(
                width: 50.w,
                height: 50.h,
                child: CircularProgressIndicator(),
              )
            : WebView(
                initialUrl: state.url,
                javascriptMode: JavascriptMode.unrestricted,
                javascriptChannels: {
                    JavascriptChannel(
                      name: "Pay",
                      onMessageReceived: (JavascriptMessage message) {
                        print(message.message);
                      },
                    ),
                  }),
      );
    });
  }
}
