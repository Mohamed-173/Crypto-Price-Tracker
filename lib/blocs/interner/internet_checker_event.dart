class ConnectivityStatusChanged extends ConnectivityEvent {
  final bool isConnected;

  ConnectivityStatusChanged(this.isConnected);
}

abstract class ConnectivityEvent {}

class CheckConnectivity extends ConnectivityEvent {}
