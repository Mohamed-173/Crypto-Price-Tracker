import 'dart:html';

import 'package:crypto_price_tracker/blocs/bloc/web_socket_bloc.dart';
import 'package:crypto_price_tracker/views/bitcoin/bitcoin_view.dart';
import 'package:crypto_price_tracker/views/home/home_page.dart';

import 'package:crypto_price_tracker/views/setting/setting_view.dart';
import 'package:crypto_price_tracker/views/usd/usd_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (context) => WebSocketBloc()..add(FetchConnectingEvent()),
            child: HomePage(),
          ),
        );
      case '/bitcoin':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (context) => WebSocketBloc()..add(FetchConnectingEvent()),
            child: BitcoinView(),
          ),
        );
      case '/usd':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => UsdView(),
        );
      case '/setting':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => SettingView(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
