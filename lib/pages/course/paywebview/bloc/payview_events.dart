abstract class PayWebViewEvent {
  const PayWebViewEvent();
}

// inside add(TriggerWebView);
class TriggerWebView extends PayWebViewEvent {
  final String url;
  const TriggerWebView(this.url);
}
