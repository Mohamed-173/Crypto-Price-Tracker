class InitialResponse {
  final String apiVersion;
  final int connectionId;
  final String system;
  final String version;

  InitialResponse({
    required this.apiVersion,
    required this.connectionId,
    required this.system,
    required this.version,
  });

  factory InitialResponse.fromJson(Map<String, dynamic> json) {
    return InitialResponse(
      apiVersion: json['api_version'],
      connectionId: json['connection_id'],
      system: json['system'],
      version: json['version'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'api_version': apiVersion,
      'connection_id': connectionId,
      'system': system,
      'version': version,
    };
  }
}

class Status {
  final String channel;
  final List<InitialResponse> data;
  final String type;

  Status({
    required this.channel,
    required this.data,
    required this.type,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      channel: json['channel'],
      data: (json['data'] as List<dynamic>)
          .map((data) => InitialResponse.fromJson(data))
          .toList(),
      type: json['type'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'channel': channel,
      'data': data.map((data) => data.toMap()).toList(),
      'type': type,
    };
  }
}
