import 'package:flutter/material.dart';
import 'package:network_connectivity_checker/constants.dart';
import 'package:network_connectivity_checker/cubit/connectivity_checker_cubit.dart';
import 'package:network_connectivity_checker/models.dart';

Widget statusCard(
  NetworkStatus? networkStatus, [
  InternetConnectivityStatus? internetStatus,
]) {
  late StatusInfo statusInfo;
  Color statusColor = Color.fromARGB(255, 61, 116, 69);

  if (networkStatus != null) {
    switch (networkStatus) {
      case NetworkStatus.connectedToMobileData:
        statusInfo = InfoMap['mobile']!;
      case NetworkStatus.connectedToWifi:
        statusInfo = InfoMap['wifi']!;
      default:
        statusInfo = InfoMap['no connection']!;
        statusColor = Color.fromARGB(255, 102, 54, 60);
    }
  } else if (internetStatus != null) {
    switch (internetStatus) {
      case InternetConnectivityStatus.internetAccessAvailable:
        statusInfo = InfoMap['has internet']!;
      case InternetConnectivityStatus.noInternetAccess:
        statusInfo = InfoMap['no internet']!;
        statusColor = Color.fromARGB(255, 102, 54, 60);
      default:
        statusInfo = InfoMap['no internet']!;
        statusColor = Color.fromARGB(255, 102, 54, 60);
    }
  }

  return Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: Icon(statusInfo.icon, color: statusColor, size: 70),
        ),
        Text(
          statusInfo.description,
          style: TextStyle(color: statusColor, fontSize: 20),
        ),
      ],
    ),
  );
}
