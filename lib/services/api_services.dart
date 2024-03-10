import 'package:crypto_price_tracker/common/constant/constants_strings.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ApiService {
  final channel = WebSocketChannel.connect(
    Uri.parse(apiPublicKraken),
  );
}
