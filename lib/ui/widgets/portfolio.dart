import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:onfinance/ui/style/app_color.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
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
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      Text(
                        'Your Portfolio Exposure',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor().orange,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        '\$72,34334',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: .6,
                  child: Container(color: AppColor().inactiveGrey),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PortfolioItem(
                      title: 'INVESTED',
                      content1: '\$5455',
                      content2: '\$5455',
                      visible: _visibility,
                    ),
                    PortfolioItem(
                      title: 'QUANTITY',
                      content1: '1.5',
                      content2: '1',
                      visible: _visibility,
                    ),
                    PortfolioImageItem(visibility: _visibility),
                  ],
                ),
                // Spacer(),
                //visibility switch
                // Visibility(
                //   visible: _visibility,
                //   child: Column(
                //     children: [],
                //   ),
                // ),
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
            color: AppColor().orange,
          ),
        )
      ],
    );
  }
}

class PortfolioImageItem extends StatelessWidget {
  const PortfolioImageItem({
    Key? key,
    required bool visibility,
  })  : _visibility = visibility,
        super(key: key);

  final bool _visibility;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'BROKER',
          style: TextStyle(
            color: AppColor().inactiveGrey,
            fontSize: 10,
          ),
        ),
        const SizedBox(
          height: 11,
        ),
        Row(
          children: [
            Visibility(
              maintainState: true,
              visible: _visibility,
              child: const Text(
                'Ethereum chain',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Image.asset(
              'assets/png/ether.png',
              width: 14,
              height: 14,
            )
          ],
        ),
        const SizedBox(
          height: 11,
        ),
        Visibility(
          visible: _visibility,
          child: Row(
            children: [
              Visibility(
                maintainState: true,
                visible: _visibility,
                child: const Text(
                  'Ethereum chain',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Image.asset(
                'assets/png/ether.png',
                width: 14,
                height: 14,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class PortfolioItem extends StatelessWidget {
  final String title, content1, content2;
  final bool visible;
  const PortfolioItem({
    Key? key,
    required this.title,
    required this.content1,
    required this.content2,
    required this.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColor().inactiveGrey,
            fontSize: 10,
          ),
        ),
        const SizedBox(
          height: 11,
        ),
        Text(
          content1,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 11,
        ),
        Visibility(
          visible: visible,
          child: Text(
            content2,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
