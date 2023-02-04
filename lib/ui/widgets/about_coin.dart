import 'package:flutter/material.dart';
import 'package:onfinance/ui/style/app_color.dart';

class AboutCoin extends StatelessWidget {
  const AboutCoin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      color: Colors.black,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'About MATIC',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColor().neonBlue,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 36,
          ),
          const AboutItem(tag: 'Market Cap', value: '65,196 Cr.'),
          const AboutItem(
              tag: 'Revenue',
              value: '65,196 Cr.',
              hasPercent: true,
              percentage: '-50.2%'),
          const AboutItem(tag: 'P/E Ratio', value: '30.2'),
          const AboutItem(
              tag: 'Profit',
              value: '65,196 Cr.',
              hasPercent: true,
              percentage: '-80.2%'),
          const AboutItem(tag: 'Divident Yield', value: '1.92'),
          const SizedBox(
            height: 36,
          ),
          Row(
            children: [
              Text(
                'Technical Indicator',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColor().neonBlue,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 33,
          ),
          const TItems(
              title: 'Cumulative Market Sentiment',
              value: '62.42',
              note:
                  'This measures the sentiment of the investors for that particular stock or boin based on all the news articles, blogs, research papers, financial content featuring it.'),
          const TItems(
              title: 'Relative Strength Index (RSI)',
              value: '37.88',
              note:
                  'This measures the price movement of the securities, tell us if the stock or coin is overbought (above 70) or oversold (below 30)'),
          const TItems(
              title: 'Volatility',
              value: '0.54',
              note:
                  'This measures how much the stock or coin price is moving in any of the directions (upwards, downwards or directional) with respect to time.')
        ],
      ),
    );
  }
}

class TItems extends StatelessWidget {
  final String title, value, note;
  const TItems({
    Key? key,
    required this.title,
    required this.value,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColor().neonGreen),
            )
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          note,
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: Color.fromARGB(150, 239, 233, 233),
          ),
        ),
        const SizedBox(
          height: 24,
        )
      ],
    );
  }
}

class AboutItem extends StatelessWidget {
  final String tag, value, percentage;
  final bool hasPercent;
  const AboutItem(
      {Key? key,
      required this.tag,
      required this.value,
      this.hasPercent = false,
      this.percentage = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              tag,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColor().inactiveGrey,
              ),
            ),
            const Spacer(),
            Visibility(
              visible: hasPercent,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor().grey,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(3),
                  ),
                ),
                child: Text(
                  percentage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: .6,
          child: Container(color: AppColor().inactiveGrey),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
