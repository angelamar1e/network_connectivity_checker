import 'package:flutter/material.dart';
import 'package:network_connectivity_checker/connectivity_checker_screen.dart';
import 'package:network_connectivity_checker/cubit/connectivity_checker_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const ConnectivityChecker());
}

class ConnectivityChecker extends StatelessWidget {
  const ConnectivityChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Incentives',
      home: BlocProvider(
        create: (context) => ConnectivityCheckerCubit(),
        child: const ConnectivityCheckerScreen(),
      ),
    );
  }
}
