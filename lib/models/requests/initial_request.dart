class SubscribeRequest {
  final String method;
  final Params params;
  final int reqId;

  SubscribeRequest({
    required this.method,
    required this.params,
    required this.reqId,
  });

  factory SubscribeRequest.fromJson(Map<String, dynamic> json) {
    return SubscribeRequest(
      method: json['method'],
      params: Params.fromJson(json['params']),
      reqId: json['req_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'method': method,
      'params': params.toJson(),
      'req_id': reqId,
    };
  }
}

class Params {
  final String channel;
  final bool snapshot;
  final List<String> symbol;

  Params({
    required this.channel,
    required this.snapshot,
    required this.symbol,
  });

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      channel: json['channel'],
      snapshot: json['snapshot'],
      symbol: List<String>.from(json['symbol']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'channel': channel,
      'snapshot': snapshot,
      'symbol': symbol,
    };
  }
}
