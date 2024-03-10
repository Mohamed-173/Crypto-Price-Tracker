import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:crypto_price_tracker/common/constant/constants_strings.dart';
import 'package:crypto_price_tracker/view_models/view_model_hompage.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../models/responses/tecker_response_model.dart';
import '../../services/api_services.dart';

part 'web_socket_event.dart';
part 'web_socket_state.dart';

int i = 0;

// class WebSocketBloc extends Bloc<WebSocketEvent, WebSocketState> {
//   WebSocketBloc() : super(WebSocketInitial()) {
//     on<FetchConnectingEvent>(_onFetchData);
//     on<FailedFetchConnectingEvent>(_onFailedFetchData);
//   }

//   void _onFetchData(
//       FetchConnectingEvent event, Emitter<WebSocketState> emit) async {
//     final InternetConnection internetConnectionChecker = InternetConnection();
//     bool sinked = false;

//     try {
//       // Connect to WebSocket
//       final WebSocketChannel channel =
//           WebSocketChannel.connect(Uri.parse(apiPublicKraken));
//       if (sinked == false && i == 0) {
//         _sinkingToTracker(channel);
//         sinked = true;
//         _startEventTimer(channel);
//       }

//       var isEventReceived = false;
//       await for (var event in channel.stream) {
//         if (event == hearBeat) {
//           // Handle heartbeat event if needed
//           print("heartBeat");
//           _resetEventTimer();
//         } else {
//           final dynamic jsonDecoded = jsonDecode(event);

//           if (jsonDecoded["channel"] == "ticker" &&
//               jsonDecoded["type"] == "update") {
//             try {
//               final TickerUpdate ticker = TickerUpdate.fromJson(jsonDecoded);
//               print("Ticker: ${ticker.data[0].symbol} +${ticker.data[0].bid}");
//               emit(FetchedData(ticker));

//               // ViewModelHomePage(btctickerUpdate: ticker);
//               print("the number  $i");
//               _resetEventTimer();
//               isEventReceived = true;
//             } catch (e) {
//               log("Error parsing ticker update: $e");
//             }
//           }
//         }
//       }

//       // Stream done callback
//       if (!isEventReceived) {
//         log("No event received. Sinking to tracker...");
//         // _sinkingToTracker(channel);
//       }
//     } catch (e) {
//       log("Error connecting to WebSocket: $e");
//     }
//   }

//   void _connectToWebSocket(bool sinked, Emitter<WebSocketState> emit) async {}

//   void _onFailedFetchData(
//       FailedFetchConnectingEvent event, Emitter<WebSocketState> emit) {
//     final InternetConnection internetConnectionChecker = InternetConnection();

//     internetConnectionChecker.onStatusChange.listen((InternetStatus status) {
//       switch (status) {
//         case InternetStatus.connected:
//           log("We have internet");
//           add(const FetchConnectingEvent());
//           break;
//         case InternetStatus.disconnected:
//           log("We don't have internet");
//           break;
//       }
//     });
//   }

//   void _sinkingToTracker(WebSocketChannel channel) {
//     channel.sink.add(sender);
//     i++;
//   }

//   Timer? _eventTimer;

//   void _startEventTimer(WebSocketChannel channel) {
//     _eventTimer = Timer(const Duration(seconds: 10), () {
//       if (_eventTimer != null && _eventTimer!.isActive) {
//         // Timer has elapsed without receiving an event
//         log("No event received within 10 seconds. Sinking to tracker.");
//         _sinkingToTracker(channel);
//       }
//     });
//   }

//   void _resetEventTimer() {
//     _eventTimer?.cancel();
//   }

//   @override
//   Future<void> close() {
//     _eventTimer?.cancel();
//     return super.close();
//   }
// }
class WebSocketBloc extends Bloc<WebSocketEvent, WebSocketState> {
  WebSocketBloc() : super(WebSocketInitial()) {
    on<FetchConnectingEvent>(_onFetchData);
    on<FailedFetchConnectingEvent>(_onFailedFetchData);
  }

  void _onFetchData(
      FetchConnectingEvent event, Emitter<WebSocketState> emit) async {
    bool sinked = false;

    try {
      final WebSocketChannel channel =
          WebSocketChannel.connect(Uri.parse(apiPublicKraken));
      if (sinked == false && i == 0) {
        _sinkingToTracker(channel);
        sinked = true;
        _startEventTimer(channel);
      }

      var isEventReceived = false;
      await for (var event in channel.stream) {
        if (event == hearBeat) {
          print("heartBeat");
          _resetEventTimer();
        } else {
          final dynamic jsonDecoded = jsonDecode(event);

          if (jsonDecoded["channel"] == "ticker" &&
              jsonDecoded["type"] == "update") {
            try {
              final TickerUpdate ticker = TickerUpdate.fromJson(jsonDecoded);
              print("Ticker: ${ticker.data[0].symbol} +${ticker.data[0].bid}");
              print(event);
              emit(FetchedData(ticker));

              print("the number  $i");
              _resetEventTimer();
              isEventReceived = true;
            } catch (e) {
              log("Error parsing ticker update: $e");
            }
          }
        }
      }

      if (!isEventReceived) {
        log("No event received. Sinking to tracker...");
      }
    } catch (e) {
      log("Error connecting to WebSocket: $e");
    }
  }

  void _onFailedFetchData(
      FailedFetchConnectingEvent event, Emitter<WebSocketState> emit) {
    final InternetConnection internetConnectionChecker = InternetConnection();

    internetConnectionChecker.onStatusChange.listen((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
          log("We have internet");
          add(const FetchConnectingEvent());
          break;
        case InternetStatus.disconnected:
          log("We don't have internet");
          // Handle disconnected scenario
          break;
      }
    });
  }

  void _sinkingToTracker(WebSocketChannel channel) {
    channel.sink.add(sender);
    i++;
  }

  Timer? _eventTimer;

  void _startEventTimer(WebSocketChannel channel) {
    _eventTimer = Timer(const Duration(seconds: 10), () {
      if (_eventTimer != null && _eventTimer!.isActive) {
        log("No event received within 10 seconds. Sinking to tracker.");
        _sinkingToTracker(channel);
      }
    });
  }

  void _resetEventTimer() {
    _eventTimer?.cancel();
  }

  @override
  Future<void> close() {
    _eventTimer?.cancel();
    return super.close();
  }
}
