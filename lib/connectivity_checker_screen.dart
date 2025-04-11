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
                                ? SizedBox(
                                  height: 150,
                                  width: 5,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Color.fromARGB(255, 61, 116, 69),
                                    ),
                                  ),
                                )
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
                                ? SizedBox(
                                  height: 150,
                                  width: 5,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Color.fromARGB(255, 61, 116, 69),
                                    ),
                                  ),
                                )
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
