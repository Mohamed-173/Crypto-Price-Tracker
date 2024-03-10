import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'internet_checker_event.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, bool> {
  final InternetConnection connectionChecker;
  late StreamSubscription<bool> _subscription;

  ConnectivityBloc({required this.connectionChecker}) : super(false) {
    on<ConnectivityEvent>((event, emit) {
      final _subscription =
          InternetConnection().onStatusChange.listen((InternetStatus status) {
        switch (status) {
          case InternetStatus.connected:
            // The internet is now connected
            log("we have internet");
            add(ConnectivityStatusChanged(true));
            break;
          case InternetStatus.disconnected:
            // The internet is now disconnected
            log("we don't have internet");
            add(ConnectivityStatusChanged(false));
            break;
        }
      });
    });

    on<ConnectivityStatusChanged>((event, emit) {
      emit(event.isConnected);
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
