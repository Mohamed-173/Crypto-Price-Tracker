const String apiPublicKraken = "wss://ws.kraken.com/v2";
const String sender = '''{
  "method": "subscribe",
  "params": {
    "channel": "ticker",
    "snapshot": true,
    "symbol": [
      "BTC/USD"
    ]
  },
  "req_id": 1234567890
}  ''';
const String unsender = '''{
  "method": "unsubscribe",
  "params": {
    "channel": "ticker",
    "snapshot": true,
    "symbol": [
      "BTC/USD"
    ]
  },
  "req_id": 1234567890
}  ''';

const String hearBeat = '''{"channel":"heartbeat"}''';
const String internetConnected = "we  have internet";
const String internetDisConnected = "we dont have internet";
