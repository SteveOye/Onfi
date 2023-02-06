import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:onfinance/ui/style/app_color.dart';
import 'package:onfinance/ui/widgets/bear_bull_widget.dart';

class AnalystWidget extends StatefulWidget {
  const AnalystWidget({super.key});

  @override
  State<AnalystWidget> createState() => _AnalystWidgetState();
}

class _AnalystWidgetState extends State<AnalystWidget> {
  bool _visibility = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Analyst Ratings',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Image.asset(
                            'assets/png/stars.png',
                            height: 20,
                            width: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4)),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                )),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(28, 8, 28, 8),
                              child: Text(
                                '\$0.90987',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4)),
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColor().inactiveGrey,
                                      offset: const Offset(1, 1),
                                      spreadRadius: 0,
                                      blurRadius: 0),
                                  BoxShadow(
                                      color: AppColor().inactiveGrey,
                                      offset: const Offset(1, -1),
                                      spreadRadius: 0,
                                      blurRadius: 0)
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(28, 8, 28, 8),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '\$0.90987',
                                    style: TextStyle(
                                      color: AppColor().inactiveGrey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          BuySell(text: 'Strong\nbuy'),
                          BuySell(text: 'Buy\n'),
                          BuySell(text: 'Hold\n'),
                          BuySell(text: 'Sell\n'),
                          BuySell(text: 'Strong\nSell'),
                        ],
                      ),
                    ],
                  ),
                ),

                //visibility switch
                Visibility(
                  visible: _visibility,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        height: .6,
                        child: Container(color: AppColor().inactiveGrey),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text.rich(
                        TextSpan(
                          text: '64%',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: AppColor().neonGreen,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: ' Buying rating',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor().neonGreen),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: .6,
                        child: Container(color: AppColor().inactiveGrey),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const BearBullWidget(
                        leftTitle: 'Top Bull',
                        rightTitle: 'History Accuracy',
                        listt: [
                          MarketList('assets/png/hdfc.png',
                              'HDF Asset Mngt. Co', '86%'),
                          MarketList(
                              'assets/png/si.png', 'Solar Industries', '92%'),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const BearBullWidget(
                        leftTitle: 'Top Bear',
                        rightTitle: '',
                        listt: [
                          MarketList(
                              'assets/png/us.png', 'United Spirits', '86%'),
                          MarketList('assets/png/hffc.png',
                              'Home first finance', '92%'),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _visibility = !_visibility;
                    });
                  },
                  icon: Icon(
                    _visibility
                        ? IconlyLight.arrow_up_2
                        : IconlyLight.arrow_down_2,
                    size: 16,
                    color: AppColor().inactiveGrey,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.width / 75,
          width: MediaQuery.of(context).size.width / 4,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            color: AppColor().neonGreen,
          ),
        )
      ],
    );
  }
}

class BuySell extends StatelessWidget {
  final bool state;
  final String text;
  const BuySell({Key? key, required this.text, this.state = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
          width: 2,
          child: Container(
            color: AppColor().inactiveGrey,
          ),
        ),
        const SizedBox(
          height: 9,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
