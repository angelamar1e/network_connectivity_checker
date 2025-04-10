import 'package:flutter/material.dart';
import 'package:network_connectivity_checker/constants.dart';
import 'package:network_connectivity_checker/cubit/connectivity_checker_cubit.dart';
import 'package:network_connectivity_checker/models.dart';

Widget networkStatusCard(NetworkStatus status) {
  NetworkStatusInfo networkInfo;
  Color statusColor = Color.fromARGB(255, 61, 116, 69);
  switch (status) {
    case NetworkStatus.connectedToMobileData:
      networkInfo = networkInfoMap['mobile']!;
    case NetworkStatus.connectedToWifi:
      networkInfo = networkInfoMap['wifi']!;
    default:
      networkInfo = networkInfoMap['no connection']!;
      statusColor = Color.fromARGB(255, 102, 54, 60);
  }

  return Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: Icon(networkInfo.icon, color: statusColor, size: 70),
        ),
        Text(
          networkInfo.description,
          style: TextStyle(color: statusColor, fontSize: 20),
        ),
      ],
    ),
  );
}
