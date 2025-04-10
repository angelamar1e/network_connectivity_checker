// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'connectivity_checker_cubit.dart';

enum NetworkStatus {
  initial,
  connectedToWifi,
  connectedToMobileData,
  noConnection,
}

enum InternetConnectivityStatus { internetAccessAvailable, noInternetAccess }

class ConnectivityCheckerState {
  final NetworkStatus networkStatus;
  final InternetConnectivityStatus internetConnectivityStatus;

  ConnectivityCheckerState({
    required this.networkStatus,
    required this.internetConnectivityStatus,
  });
}

final class ConnectivityCheckerInitial extends ConnectivityCheckerState {
  ConnectivityCheckerInitial({
    super.networkStatus = NetworkStatus.initial,
    super.internetConnectivityStatus =
        InternetConnectivityStatus.noInternetAccess,
  });
}
