import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:onfinance/ui/style/app_color.dart';

class IndicatorBottomSheet extends StatefulWidget {
  const IndicatorBottomSheet({super.key});

  @override
  State<IndicatorBottomSheet> createState() => _IndicatorBottomSheetState();
}

class _IndicatorBottomSheetState extends State<IndicatorBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Indicators',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColor().lilac,
                ),
              ),
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColor().boxGrey),
              )
            ],
          ),
        ),
        SizedBox(
          height: 0.7,
          child: Container(
            color: AppColor().inactiveGrey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: const [
                  SelectedIndicator(),
                  SelectedIndicator(),
                  SelectedIndicator(),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: AppColor().inactiveGrey,
                    value: false,
                    onChanged: (vaule) {},
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class SelectedIndicator extends StatelessWidget {
  const SelectedIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        color: AppColor().indicatorColor,
      ),
      child: Row(
        children: [
          Text(
            'MA',
            style: TextStyle(
              color: AppColor().neonBlue,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Icon(
            Icons.close,
            color: AppColor().inactiveGrey,
            size: 16,
          )
        ],
      ),
    );
  }
}
