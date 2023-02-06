import 'package:flutter/material.dart';
import 'package:onfinance/ui/style/app_color.dart';

class HistoricalYeild extends StatefulWidget {
  const HistoricalYeild({super.key});

  @override
  State<HistoricalYeild> createState() => _HistoricalYeildState();
}

class _HistoricalYeildState extends State<HistoricalYeild> {
  int _value = 1;
  int _valuePeriod = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'If you would have invested',
              style: TextStyle(
                color: AppColor().inactiveGrey,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    '\$${_value * 100000}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Slider(
                    value: _value.toDouble(),
                    min: 0,
                    max: 10.0,
                    divisions: 100,
                    activeColor: AppColor().neonBlue,
                    thumbColor: Colors.white,
                    inactiveColor: AppColor().inactiveGrey,
                    onChanged: (double newValue) {
                      setState(() {
                        _value = newValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'For period',
              style: TextStyle(
                color: AppColor().inactiveGrey,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    '$_valuePeriod year',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Slider(
                    value: _valuePeriod.toDouble(),
                    min: 0,
                    max: 10.0,
                    divisions: 100,
                    activeColor: AppColor().neonBlue,
                    thumbColor: Colors.white,
                    inactiveColor: AppColor().inactiveGrey,
                    onChanged: (double newValue) {
                      setState(() {
                        _valuePeriod = newValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'You would have',
              style: TextStyle(
                color: AppColor().inactiveGrey,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text.rich(
              TextSpan(
                text: '\$${(_value * 1120.78).toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
                children: <InlineSpan>[
                  TextSpan(
                    text: '  ${(_value * 1205.67).toStringAsFixed(2)}MATIC',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColor().neonBlue),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              height: 30,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(15, 158, 158, 158),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Coin(
                    icon: 'assets/png/matic.png',
                    text: 'MATIC',
                    callback: ((value) => {}),
                  ),
                  Coin(
                    icon: 'assets/png/matic.png',
                    text: 'BTC',
                    callback: ((value) {}),
                  ),
                  Coin(
                    icon: 'assets/png/eth.png',
                    text: 'ETH',
                    callback: ((value) {}),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Coin extends StatefulWidget {
  final String icon, text;
  final ValueSetter<bool>? callback;
  const Coin({
    super.key,
    required this.icon,
    required this.text,
    this.callback,
  });

  @override
  State<Coin> createState() => _CoinState();
}

class _CoinState extends State<Coin> {
  bool activeColor = false;
  void tapDetected() {
    setState(() {
      activeColor = !activeColor;
      widget.callback!(activeColor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: tapDetected,
        child: Container(
          height: 30,
          decoration: BoxDecoration(
              color: activeColor ? AppColor().blue : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.icon,
                  height: 14,
                  width: 14,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  widget.text,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
