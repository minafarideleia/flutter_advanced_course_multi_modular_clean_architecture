import 'package:data/network_info/network_info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    final isConnectedToNetwork =
        connectivityResult.contains(ConnectivityResult.wifi) ||
            connectivityResult.contains(ConnectivityResult.mobile);
    return isConnectedToNetwork;
  }
}
