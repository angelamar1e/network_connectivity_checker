import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_connectivity_checker/cubit/connectivity_checker_cubit.dart';
import 'package:network_connectivity_checker/widgets.dart';

class ConnectivityCheckerScreen extends StatelessWidget {
  const ConnectivityCheckerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Connectivity Checker'),
        backgroundColor: Color.fromARGB(255, 207, 219, 173),
      ),
      body: Center(
        child: BlocBuilder<ConnectivityCheckerCubit, ConnectivityCheckerState>(
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        child:
                            state.networkStatus == NetworkStatus.initial
                                ? loadingIndicator()
                                : statusCard(state.networkStatus),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        child:
                            state.internetConnectivityStatus ==
                                    InternetConnectivityStatus.initial
                                ? loadingIndicator()
                                : statusCard(
                                  null,
                                  state.internetConnectivityStatus,
                                ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
