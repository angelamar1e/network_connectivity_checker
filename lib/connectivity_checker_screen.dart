import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_connectivity_checker/cubit/connectivity_checker_cubit.dart';

class ConnectivityCheckerScreen extends StatelessWidget {
  const ConnectivityCheckerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Incentives')),
      body: Center(
        child: BlocBuilder<ConnectivityCheckerCubit, ConnectivityCheckerState>(
          builder: (context, state) {
            return Column(
              children: [
                state.networkStatus == NetworkStatus.initial
                    ? CircularProgressIndicator.adaptive()
                    : Text('${state.networkStatus}'),
              ],
            );
          },
        ),
      ),
    );
  }
}
