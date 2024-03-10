import 'package:crypto_price_tracker/models/responses/tecker_response_model.dart';

class ViewModelHomePage {
  final TickerUpdate btctickerUpdate;
  late TickerUpdate tecker;

  ViewModelHomePage({required this.btctickerUpdate}) {
    tecker = btctickerUpdate;
  }
}
