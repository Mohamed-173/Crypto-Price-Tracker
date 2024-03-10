// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:crypto_price_tracker/blocs/bloc/web_socket_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:crypto_price_tracker/common/constant/app_color.dart';
import 'package:crypto_price_tracker/common/constant/component_parts.dart';
import 'package:crypto_price_tracker/common/responsive/responsive.dart';
import 'package:redacted/redacted.dart';

import 'components/chart_view.dart';
import 'components/component_barrel.dart';
import 'components/line_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: MyColorClass.backgroundColor,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LogoAndName(
                    path: "assets/icons/logo.svg",
                    title: "Crypto Tracker",
                    size: 30,
                  ),
                  ListBotton(
                    listOfAttrebute: componentList,
                  ),
                ],
              ),
            ),
          ),
          const Divider(
              indent: 10, endIndent: 10, color: MyColorClass.dividerColor),
          Expanded(
            flex: 10,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.isMobile(context) ? 25 : 50.w,
                  vertical: 10,
                ),
                color: MyColorClass.primaryColor,
                child: BlocBuilder<WebSocketBloc, WebSocketState>(
                  builder: (context, state) {
                    String btcSymbol = '';

                    double btcTotal = 0;
                    String btcPrice = '';

                    if (state is FetchedData) {
                      btcSymbol = state.ticker.data[0].symbol;
                      btcTotal = state.ticker.data[0].bid;
                      btcPrice = state.ticker.data[0].last.toString();
                    } else {
                      // if not fetchedDaTa
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // first widget
                        const PageTitle(title: "Dashboard"),
                        // second widget
                        Chart(listattribute: btcTotal),
                        // third widget
                        Column(
                          children: [
                            state is FetchedData
                                ? LineTab(
                                    title:
                                        btcSymbol == '' ? "title" : (btcSymbol),
                                    total: ("\$$btcTotal"),
                                    price: btcPrice == '' ? "price" : btcPrice,
                                  )
                                : const LineTab()
                                    .redacted(context: context, redact: true),
                            const SizedBox(height: 10),
                            const LineTab(),
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
