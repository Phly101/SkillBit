import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:skill_bit/core/network/network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  const NetworkInfoImpl(this._checker);

  final InternetConnection _checker;

  @override
  Stream<bool> get getConnectivityChanged => _checker.onStatusChange.map(
    (final InternetStatus status) => status == InternetStatus.connected,
  );

  @override
  Future<bool> get isConnected => _checker.hasInternetAccess;
}
