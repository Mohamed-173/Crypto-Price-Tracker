part of 'web_socket_bloc.dart';

sealed class WebSocketEvent extends Equatable {
  const WebSocketEvent();
}

class Initial extends WebSocketEvent {
  const Initial();

  @override
  List<Object?> get props => [];
}

class FetchConnectingEvent extends WebSocketEvent {
  const FetchConnectingEvent();

  @override
  List<Object?> get props => [];
}

class FailedFetchConnectingEvent extends WebSocketEvent {
  const FailedFetchConnectingEvent(this.errorData);
  final String errorData;

  @override
  List<Object?> get props => [];
}
