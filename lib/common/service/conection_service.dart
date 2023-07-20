import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetConnection {
  Future<bool> checkInternetConnection() async {
    //  final connectivityResult = await (Connectivity().checkConnectivity());
    bool result = await InternetConnectionCheckerPlus().hasConnection;

    return result;
    // if (connectivityResult == ConnectivityResult.mobile) {
    //   // I am connected to a mobile network.
    //   if(result){

    //   }
    // } else if (connectivityResult == ConnectivityResult.wifi) {
    //   // I am connected to a wifi network.
    // } else if (connectivityResult == ConnectivityResult.ethernet) {
    //   // I am connected to a ethernet network.
    // } else if (connectivityResult == ConnectivityResult.vpn) {
    //   // I am connected to a vpn network.
    //   // Note for iOS and macOS:
    //   // There is no separate network interface type for [vpn].
    //   // It returns [other] on any device (also simulator)
    // } else if (connectivityResult == ConnectivityResult.bluetooth) {
    //   // I am connected to a bluetooth.
    // } else if (connectivityResult == ConnectivityResult.other) {
    //   // I am connected to a network which is not in the above mentioned networks.
    // } else if (connectivityResult == ConnectivityResult.none) {
    //   // I am not connected to any network.
    // }
  }
}
