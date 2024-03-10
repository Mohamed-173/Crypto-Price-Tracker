class TickerUpdate {
  final String channel;
  final String type;
  final List<TickerData> data;

  TickerUpdate({
    required this.channel,
    required this.type,
    required this.data,
  });

  factory TickerUpdate.fromJson(Map<String, dynamic> json) {
    final List<dynamic> dataList = json['data'];
    final List<TickerData> tickerDataList = dataList
        .map((data) => TickerData.fromJson(data as Map<String, dynamic>))
        .toList();

    return TickerUpdate(
      channel: json['channel'] as String,
      type: json['type'] as String,
      data: tickerDataList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'channel': channel,
      'type': type,
      'data': data.map((data) => data.toMap()).toList(),
    };
  }
}

class TickerData {
  final String symbol;
  final double bid;
  final double bidQty;
  final double ask;
  final double askQty;
  final double last;
  final double volume;
  final double vwap;
  final double low;
  final double high;
  final double change;
  final double changePct;

  TickerData({
    required this.symbol,
    required this.bid,
    required this.bidQty,
    required this.ask,
    required this.askQty,
    required this.last,
    required this.volume,
    required this.vwap,
    required this.low,
    required this.high,
    required this.change,
    required this.changePct,
  });

  factory TickerData.fromJson(Map<String, dynamic> json) {
    return TickerData(
      symbol: json['symbol'] as String,
      bid: json['bid'] as double,
      bidQty: json['bid_qty'] as double,
      ask: json['ask'] as double,
      askQty: json['ask_qty'] as double,
      last: json['last'] as double,
      volume: json['volume'] as double,
      vwap: json['vwap'] as double,
      low: json['low'] as double,
      high: json['high'] as double,
      change: json['change'] as double,
      changePct: json['change_pct'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'symbol': symbol,
      'bid': bid,
      'bid_qty': bidQty,
      'ask': ask,
      'ask_qty': askQty,
      'last': last,
      'volume': volume,
      'vwap': vwap,
      'low': low,
      'high': high,
      'change': change,
      'change_pct': changePct,
    };
  }
}
