part of 'connectivity_checker_cubit.dart';

enum NetworkStatus {
  initial,
  connectedToWifi,
  connectedToMobileData,
  noConnection,
}

enum InternetConnectivityStatus { internetAccessAvailable, noInternetAccess }

@immutable
sealed class ConnectivityCheckerState {}

final class ConnectivityCheckerInitial extends ConnectivityCheckerState {}
