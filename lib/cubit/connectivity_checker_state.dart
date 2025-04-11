// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'connectivity_checker_cubit.dart';

enum NetworkStatus {
  initial,
  connectedToWifi,
  connectedToMobileData,
  noConnection,
}

enum InternetConnectivityStatus {
  initial,
  internetAccessAvailable,
  noInternetAccess,
}

class ConnectivityCheckerState {
  final NetworkStatus networkStatus;
  final InternetConnectivityStatus internetConnectivityStatus;

  ConnectivityCheckerState({
    required this.networkStatus,
    required this.internetConnectivityStatus,
  });

  ConnectivityCheckerState copyWith({
    NetworkStatus? networkStatus,
    InternetConnectivityStatus? internetConnectivityStatus,
  }) {
    return ConnectivityCheckerState(
      networkStatus: networkStatus ?? this.networkStatus,
      internetConnectivityStatus:
          internetConnectivityStatus ?? this.internetConnectivityStatus,
    );
  }
}

final class ConnectivityCheckerInitial extends ConnectivityCheckerState {
  ConnectivityCheckerInitial({
    super.networkStatus = NetworkStatus.initial,
    super.internetConnectivityStatus = InternetConnectivityStatus.initial,
  });
}
