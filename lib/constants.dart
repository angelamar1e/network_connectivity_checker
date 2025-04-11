// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:network_connectivity_checker/models.dart';

Map<String, StatusInfo> infoMap = {
  'mobile': StatusInfo(
    icon: (Icons.four_g_mobiledata),
    description: 'Connected via Mobile Data',
  ),
  'wifi': StatusInfo(icon: (Icons.wifi), description: 'Connected via Wi-Fi'),
  'no connection': StatusInfo(
    icon: (Icons.signal_wifi_connected_no_internet_4),
    description: 'No connection',
  ),
  'has internet': StatusInfo(
    icon: Icons.check_circle,
    description: 'Internet access available',
  ),
  'no internet': StatusInfo(
    icon: Icons.cancel,
    description: 'No internet access available',
  ),
};
