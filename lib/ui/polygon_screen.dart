import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:onfinance/ui/style/app_color.dart';
import 'package:onfinance/ui/widgets/analyst_rating.dart';
import 'package:onfinance/ui/widgets/polygon_bar.dart';
import 'package:onfinance/ui/widgets/portfolio.dart';
import 'package:onfinance/ui/widgets/time_frame_container.dart';
import 'package:onfinance/ui/widgets/top_tip.dart';
import 'package:http/http.dart' as http;

import 'widgets/about_coin.dart';

class PolygonScreen extends StatefulWidget {
  const PolygonScreen({super.key});

  @override
  State<PolygonScreen> createState() => _PolygonScreenState();
}

class _PolygonScreenState extends State<PolygonScreen> {
  List<Candle> candles = [];

  @override
  void initState() {
    fetchCandles().then((value) {
      setState(() {
        candles = value;
      });
    });
    super.initState();
  }

  Future<List<Candle>> fetchCandles() async {
    final uri = Uri.parse(
        "https://api.binance.com/api/v3/klines?symbol=BTCUSDT&interval=1h");
    final res = await http.get(uri);
    return (jsonDecode(res.body) as List<dynamic>)
        .map((e) => Candle.fromJson(e))
        .toList()
        .reversed
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor().grey,
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          IconlyLight.arrow_left_2,
        ),
        title: const Text(
          'Polygon',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        actions: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: AppColor().grey,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              IconlyLight.bookmark,
              size: 16,
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: ((p0, p1) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: p1.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    PolygonBar(size: size),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          TopTags(
                            iconVisibility: true,
                            icon: Icons.trending_up,
                            background: Colors.black,
                            textColor: AppColor().green,
                            text: '2.79%',
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          TopTags(
                            background: AppColor().topTag,
                            textColor: AppColor().lilac,
                            text: 'Ascending angle',
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          TopTags(
                            background: AppColor().topTag,
                            textColor: AppColor().neonRed,
                            text: 'High Pressure',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * .45,
                      // color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              padding: const EdgeInsets.all(13),
                              width: size.width,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    TimeContainer(
                                      timeString: '1H',
                                      selected: true,
                                    ),
                                    TimeContainer(timeString: '1D'),
                                    TimeContainer(timeString: '1W'),
                                    TimeContainer(timeString: '1M'),
                                    TimeContainer(timeString: '1Y'),
                                  ]),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.all(13),
                              width: size.width,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(
                                    width: 1, color: AppColor().inactiveGrey),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              child: const Center(
                                child: Icon(IconlyLight.chart),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const AnalystWidget(),
                    const SizedBox(
                      height: 36,
                    ),
                    const Portfolio(),
                    const AboutCoin()
                  ],
                ),
              ),
            ),
          );
        }),
      ),
      bottomNavigationBar: Container(
          color: Colors.black,
          height: 96,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 16, 24, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: BottomButton(
                    bgColor: AppColor().blue,
                    action: () {},
                    buttonText: 'Buy',
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: BottomButton(
                    bgColor: Colors.white,
                    textColor: Colors.black,
                    action: () {},
                    buttonText: 'Sell',
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class BottomButton extends StatelessWidget {
  final Color textColor, bgColor;
  final String buttonText;
  final Function() action;
  const BottomButton({
    Key? key,
    required this.bgColor,
    this.textColor = Colors.white,
    required this.action,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: bgColor,
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 16, color: textColor),
        ),
      ),
    );
  }
}
