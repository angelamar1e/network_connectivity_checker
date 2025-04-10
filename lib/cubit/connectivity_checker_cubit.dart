import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'connectivity_checker_state.dart';

class ConnectivityCheckerCubit extends Cubit<ConnectivityCheckerState> {
  late final StreamSubscription<List<ConnectivityResult>> networkStatusListener;
  late final StreamSubscription<InternetStatus> internetConnectivityListener;

  ConnectivityCheckerCubit() : super(ConnectivityCheckerInitial()) {
    checkConnectivity();
  }

  void checkConnectivity() async {
    await Future.delayed(Duration(seconds: 2)); // simulate loading

    networkStatusListener = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      emit(state.copyWith(networkStatus: fetchNetworkStatus(result)));
    });

    internetConnectivityListener = InternetConnection().onStatusChange.listen((
      InternetStatus status,
    ) {
      emit(
        state.copyWith(
          internetConnectivityStatus: fetchInternetConnectivityStatus(status),
        ),
      );
    });
  }

  NetworkStatus fetchNetworkStatus(result) {
    if (result.contains(ConnectivityResult.mobile)) {
      // Mobile data is available.
      return NetworkStatus.connectedToMobileData;
    } else if (result.contains(ConnectivityResult.wifi)) {
      return NetworkStatus.connectedToWifi;
      // Wi-fi is available.
      // Note for Android:
      // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
    } else {
      return NetworkStatus.noConnection;
    }
  }

  InternetConnectivityStatus fetchInternetConnectivityStatus(status) {
    switch (status) {
      case InternetStatus.connected:
        return InternetConnectivityStatus.internetAccessAvailable;
      case InternetStatus.disconnected:
        return InternetConnectivityStatus.noInternetAccess;
      default:
        return InternetConnectivityStatus.loading;
    }
  }

  @override
  Future<void> close() {
    networkStatusListener.cancel();
    internetConnectivityListener.cancel();
    return super.close();
  }
}
