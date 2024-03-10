import 'package:crypto_price_tracker/blocs/bloc/web_socket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BitcoinView extends StatelessWidget {
  const BitcoinView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WebSocketBloc, WebSocketState>(
        builder: (context, state) {
          if (state is FetchedData) {
            var track = state.ticker.data[0];
            return CryptoDetailsPage(
              cryptoData: {
                "ask": track.ask,
                "ask_qty": track.askQty,
                "bid": track.bid,
                "bid_qty": track.bidQty,
                "change": track.change,
                "change_pct": track.changePct,
                "high": track.high,
                "last": track.last,
                "low": track.low,
                "symbol": track.symbol,
                "volume": track.volume,
                "vwap": track.vwap,
              },
            );
          } else {
            return const CryptoDetailsPage(
              cryptoData: {
                "ask": 7000.3,
                "ask_qty": 0.01,
                "bid": 6000.0,
                "bid_qty": 0.01,
                "change": -100.0,
                "change_pct": -1.54,
                "high": 6500.9,
                "last": 6400.6,
                "low": 6400.1,
                "symbol": "BTC/EUR",
                "volume": 0.02,
                "vwap": 6450.2
              },
            );
          }
        },
      ),
    );
  }
}

class CryptoDetailsPage extends StatelessWidget {
  final Map<String, dynamic> cryptoData;

  const CryptoDetailsPage({super.key, required this.cryptoData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailItem('Symbol', cryptoData['symbol']),
              _buildDetailItem('Last', cryptoData['last'].toString()),
              _buildDetailItem('Ask', cryptoData['ask'].toString()),
              _buildDetailItem('Bid', cryptoData['bid'].toString()),
              _buildDetailItem('Volume', cryptoData['volume'].toString()),
              _buildDetailItem('High', cryptoData['high'].toString()),
              _buildDetailItem('Low', cryptoData['low'].toString()),
              _buildDetailItem('Change', cryptoData['change'].toString()),
              _buildDetailItem('Change %', cryptoData['change_pct'].toString()),
              _buildDetailItem(
                  'Ask Quantity', cryptoData['ask_qty'].toString()),
              _buildDetailItem(
                  'Bid Quantity', cryptoData['bid_qty'].toString()),
              _buildDetailItem('Volume Weighted Average Price',
                  cryptoData['vwap'].toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(value),
        const SizedBox(height: 16),
      ],
    );
  }
}
