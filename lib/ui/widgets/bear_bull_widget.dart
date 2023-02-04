import 'package:flutter/material.dart';

class BearBullWidget extends StatelessWidget {
  final String leftTitle, rightTitle;
  final List<MarketList> listt;
  const BearBullWidget({
    Key? key,
    required this.leftTitle,
    required this.rightTitle,
    required this.listt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                leftTitle,
                style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(81, 81, 88, 1),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                rightTitle,
                style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(81, 81, 88, 1),
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          BBItem(list: listt[0]),
          const SizedBox(
            height: 9,
          ),
          BBItem(list: listt[1]),
        ],
      ),
    );
  }
}

class BBItem extends StatelessWidget {
  final MarketList list;
  const BBItem({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          list.image,
          width: 16,
          height: 16,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          list.company,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const Spacer(),
        Text(
          list.percentage,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class MarketList {
  final String image;
  final String company;
  final String percentage;

  const MarketList(
    this.image,
    this.company,
    this.percentage,
  );
}
