import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'connectivity_checker_state.dart';

class ConnectivityCheckerCubit extends Cubit<ConnectivityCheckerState> {
  late final StreamSubscription<List<ConnectivityResult>> subscription;

  ConnectivityCheckerCubit() : super(ConnectivityCheckerInitial()) {
    initialize();
  }

  void initialize() async {
    await Future.delayed(Duration(seconds: 2)); // simulate loading

    subscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      emit(state.copyWith(networkStatus: fetchNetworkStatus(result)));
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

  void fetchInternetConnectivityStatus() async {}

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
