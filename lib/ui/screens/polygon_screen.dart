import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:onfinance/data/candle_data.dart';
import 'package:onfinance/ui/style/app_color.dart';
import 'package:onfinance/ui/style/painter.dart';
import 'package:onfinance/ui/widgets/analyst_rating.dart';
import 'package:onfinance/ui/widgets/hostorical_yield.dart';
import 'package:onfinance/ui/widgets/indicator_sheet.dart';
import 'package:onfinance/ui/widgets/polygon_bar.dart';
import 'package:onfinance/ui/widgets/portfolio.dart';
import 'package:onfinance/ui/widgets/time_frame_container.dart';
import 'package:onfinance/ui/widgets/top_tip.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:intl/intl.dart';

import '../widgets/about_coin.dart';

class PolygonScreen extends StatefulWidget {
  const PolygonScreen({super.key});

  @override
  State<PolygonScreen> createState() => _PolygonScreenState();
}

enum ChartType { line, bar }

class _PolygonScreenState extends State<PolygonScreen> {
  var bookMarked = false;
  var selectedType = ChartType.bar;
  late TrackballBehavior _trackBallBehavior;

  @override
  void initState() {
    _trackBallBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constrait) {
      if (constrait.maxWidth < 600) {
        return MobileView(
          trackBallBehavior: _trackBallBehavior,
          bookMarked: bookMarked,
          selectedType: selectedType,
        );
      }
      return MacOSView(
        trackBallBehavior: _trackBallBehavior,
        bookMarked: bookMarked,
        selectedType: selectedType,
      );
    });
  }
}

class MacOSView extends StatelessWidget {
  const MacOSView({
    super.key,
    required this.trackBallBehavior,
    this.bookMarked,
    this.selectedType,
  });
  final bookMarked;
  final selectedType;
  final TrackballBehavior trackBallBehavior;
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
          GestureDetector(
            onTap: () {
              // setState(() {
              //   // widget.bookMarked = !widget.bookMarked;
              // });
            },
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: AppColor().grey,
                shape: BoxShape.circle,
              ),
              child: Icon(
                bookMarked ? Icons.bookmark : Icons.bookmark_outline_outlined,
                color: bookMarked ? AppColor().orange : Colors.white,
                size: 16,
              ),
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PolygonBar(size: size),
                  Stack(
                    children: [
                      Container(
                        height: size.height * .58,
                        // color: Colors.white,
                        child: SfCartesianChart(
                          plotAreaBorderColor: AppColor().inactiveGrey,
                          plotAreaBorderWidth: 0,
                          margin: const EdgeInsets.all(0),
                          series: <CandleSeries>[
                            CandleSeries<ChartSampleData, DateTime>(
                                enableSolidCandles: true,
                                dataSource: chartData,
                                xValueMapper: (ChartSampleData sales, _) =>
                                    sales.x,
                                lowValueMapper: (ChartSampleData sales, _) =>
                                    sales.low,
                                highValueMapper: (ChartSampleData sales, _) =>
                                    sales.high,
                                openValueMapper: (ChartSampleData sales, _) =>
                                    sales.open,
                                closeValueMapper: (ChartSampleData sales, _) =>
                                    sales.close),
                          ],
                          primaryXAxis: DateTimeAxis(
                            zoomFactor: 1,
                            dateFormat: DateFormat.MMM(),
                            majorGridLines: MajorGridLines(
                              color: AppColor().inactiveGrey,
                            ),
                            minorGridLines: MinorGridLines(
                              color: AppColor().inactiveGrey,
                            ),
                          ),
                          primaryYAxis: NumericAxis(
                            minimum: 70,
                            maximum: 130,
                            interval: 10,
                            numberFormat: NumberFormat.currency(
                              symbol: '',
                              decimalDigits: 1,
                            ),
                            majorGridLines:
                                MajorGridLines(color: AppColor().inactiveGrey),
                          ),
                          trackballBehavior: trackBallBehavior,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Padding(
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
                      ),
                      Positioned(
                        right: 12,
                        bottom: 0,
                        child: Container(
                          color: Colors.black,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(14.0),
                                    ),
                                  ),
                                  builder: (context) {
                                    return const IndicatorBottomSheet();
                                  });
                            },
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(13, 8, 13, 8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColor().boxGrey,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/png/graph.png',
                                    height: 13,
                                    width: 12,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Text(
                                    'Indicator',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                                  TimeContainer(timeString: '5Y'),
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
                            child: GestureDetector(
                              onTap: (() {
                                // setState(() {
                                //   // if (widget.selectedType == ChartType.bar) {
                                //   //   widget.selectedType = ChartType.line;
                                //   // } else {
                                //   //   selectedType = ChartType.bar;
                                //   // }
                                // });
                              }),
                              child: Center(
                                child: Image.asset(
                                  selectedType == ChartType.bar
                                      ? 'assets/png/candles.png'
                                      : 'assets/png/line.png',
                                  height: 19,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const AnalystWidget(),
                  const SizedBox(
                    height: 36,
                  ),
                  const Portfolio(),
                  const SizedBox(
                    height: 66,
                  ),
                  Container(
                    color: Colors.black,
                    child: CustomPaint(
                      painter: BasePainter(),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: CustomPaint(
                          size: Size.infinite,
                          painter: ContainerPainter(),
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                fit: StackFit.loose,
                                clipBehavior: Clip.none,
                                children: [
                                  CustomPaint(
                                    painter: TopPainter(),
                                    child: Container(
                                      width: size.width,
                                      decoration: const BoxDecoration(
                                          // color: Colors.white,
                                          ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 42,
                                            right: 42,
                                            top: 12,
                                            bottom: 12),
                                        child: Center(
                                          child: SizedBox(
                                            height: 2.5,
                                            child: Container(
                                                color: AppColor().boxGrey),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 12,
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          24, 12, 24, 12),
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(40, 40, 49, 1),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8)),
                                      ),
                                      child: Text(
                                        'Historical Yeild'.toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 12.0, right: 12, bottom: 12),
                                child: HistoricalYeild(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const AboutCoin()
                ],
              ),
            ),
          )
        ],
      ),
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

class MobileView extends StatefulWidget {
  const MobileView({
    super.key,
    required this.trackBallBehavior,
    this.bookMarked,
    this.selectedType,
  });
  final bookMarked;
  final selectedType;
  final TrackballBehavior trackBallBehavior;

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
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
          GestureDetector(
            onTap: () {
              setState(() {
                // widget.bookMarked = !widget.bookMarked;
              });
            },
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: AppColor().grey,
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.bookMarked
                    ? Icons.bookmark
                    : Icons.bookmark_outline_outlined,
                color: widget.bookMarked ? AppColor().orange : Colors.white,
                size: 16,
              ),
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
                    Stack(
                      children: [
                        Container(
                          height: size.height * .58,
                          // color: Colors.white,
                          child: SfCartesianChart(
                            plotAreaBorderColor: AppColor().inactiveGrey,
                            plotAreaBorderWidth: 0,
                            margin: const EdgeInsets.all(0),
                            series: <CandleSeries>[
                              CandleSeries<ChartSampleData, DateTime>(
                                  enableSolidCandles: true,
                                  dataSource: chartData,
                                  xValueMapper: (ChartSampleData sales, _) =>
                                      sales.x,
                                  lowValueMapper: (ChartSampleData sales, _) =>
                                      sales.low,
                                  highValueMapper: (ChartSampleData sales, _) =>
                                      sales.high,
                                  openValueMapper: (ChartSampleData sales, _) =>
                                      sales.open,
                                  closeValueMapper:
                                      (ChartSampleData sales, _) =>
                                          sales.close),
                            ],
                            primaryXAxis: DateTimeAxis(
                              zoomFactor: 1,
                              dateFormat: DateFormat.MMM(),
                              majorGridLines: MajorGridLines(
                                color: AppColor().inactiveGrey,
                              ),
                              minorGridLines: MinorGridLines(
                                color: AppColor().inactiveGrey,
                              ),
                            ),
                            primaryYAxis: NumericAxis(
                              minimum: 70,
                              maximum: 130,
                              interval: 10,
                              numberFormat: NumberFormat.currency(
                                symbol: '',
                                decimalDigits: 1,
                              ),
                              majorGridLines: MajorGridLines(
                                  color: AppColor().inactiveGrey),
                            ),
                            trackballBehavior: widget.trackBallBehavior,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Padding(
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
                        ),
                        Positioned(
                            right: 12,
                            bottom: 0,
                            child: Container(
                              color: Colors.black,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(14.0),
                                        ),
                                      ),
                                      builder: (context) {
                                        return const IndicatorBottomSheet();
                                      });
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(13, 8, 13, 8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColor().boxGrey,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(4))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/png/graph.png',
                                        height: 13,
                                        width: 12,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      const Text(
                                        'Indicator',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))
                      ],
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
                                    TimeContainer(timeString: '5Y'),
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
                              child: GestureDetector(
                                onTap: (() {
                                  setState(() {
                                    // if (widget.selectedType == ChartType.bar) {
                                    //   widget.selectedType = ChartType.line;
                                    // } else {
                                    //   selectedType = ChartType.bar;
                                    // }
                                  });
                                }),
                                child: Center(
                                  child: Image.asset(
                                    widget.selectedType == ChartType.bar
                                        ? 'assets/png/candles.png'
                                        : 'assets/png/line.png',
                                    height: 19,
                                  ),
                                ),
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
                    const SizedBox(
                      height: 66,
                    ),
                    Container(
                      color: Colors.black,
                      child: CustomPaint(
                        painter: BasePainter(),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: CustomPaint(
                            size: Size.infinite,
                            painter: ContainerPainter(),
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  fit: StackFit.loose,
                                  clipBehavior: Clip.none,
                                  children: [
                                    CustomPaint(
                                      painter: TopPainter(),
                                      child: Container(
                                        width: size.width,
                                        decoration: const BoxDecoration(
                                            // color: Colors.white,
                                            ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 42,
                                              right: 42,
                                              top: 12,
                                              bottom: 12),
                                          child: Center(
                                            child: SizedBox(
                                              height: 2.5,
                                              child: Container(
                                                  color: AppColor().boxGrey),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 12,
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            24, 12, 24, 12),
                                        decoration: const BoxDecoration(
                                          color: Color.fromRGBO(40, 40, 49, 1),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8)),
                                        ),
                                        child: Text(
                                          'Historical Yeild'.toUpperCase(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 12.0, right: 12, bottom: 12),
                                  child: HistoricalYeild(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
