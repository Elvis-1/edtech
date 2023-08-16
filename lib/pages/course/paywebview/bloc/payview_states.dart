class PayWebViewStates {
  final String url;
  const PayWebViewStates({this.url = ""});

  PayWebViewStates copyWith({String? url}) {
    return PayWebViewStates(url: url ?? this.url);
  }
}
