// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:network_connectivity_checker/models.dart';

Map<String, NetworkStatusInfo> networkInfoMap = {
  'mobile': NetworkStatusInfo(
    icon: (Icons.four_g_mobiledata),
    description: 'Connected via Mobile Data',
  ),
  'wifi': NetworkStatusInfo(
    icon: (Icons.wifi),
    description: 'Connected via Wi-Fi',
  ),
  'no connection': NetworkStatusInfo(
    icon: (Icons.signal_wifi_connected_no_internet_4),
    description: 'No Connection',
  ),
};
