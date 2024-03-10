part of 'web_socket_bloc.dart';

sealed class WebSocketState extends Equatable {}

final class WebSocketInitial extends WebSocketState {
  WebSocketInitial();

  @override
  List<Object?> get props => [];
}

final class FetchedData extends WebSocketState {
  final TickerUpdate ticker;
  FetchedData(this.ticker);

  @override
  List<Object?> get props => [ticker];
}

final class GetError extends WebSocketState {
  GetError(this.string);

  final String? string;

  @override
  List<Object?> get props => [string]; // Include 'string' in the props list
}

final class CheckInternet extends WebSocketState {
  CheckInternet(this.string);

  final String? string;

  @override
  List<Object?> get props => [string]; // Include 'string' in the props list
}
