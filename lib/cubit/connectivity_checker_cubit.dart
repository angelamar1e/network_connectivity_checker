import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'connectivity_checker_state.dart';

class ConnectivityCheckerCubit extends Cubit<ConnectivityCheckerState> {
  ConnectivityCheckerCubit() : super(ConnectivityCheckerInitial());
}
