import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconly/iconly.dart';
import 'package:onfinance/ui/style/app_color.dart';

class IndicatorBottomSheet extends StatefulWidget {
  const IndicatorBottomSheet({super.key});

  @override
  State<IndicatorBottomSheet> createState() => _IndicatorBottomSheetState();
}

class _IndicatorBottomSheetState extends State<IndicatorBottomSheet> {
  var selectedCountry, selectedState;
  var region = 'nigeria';
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
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColor().boxGrey),
                  child: const Icon(
                    Icons.close,
                    size: 15,
                  ),
                ),
              ),
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
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: GFCheckbox(
                      onChanged: (value) {},
                      value: false,
                      inactiveBgColor: AppColor().inactiveGrey,
                    ),
                  ),
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: GFDropdown(
                        padding: const EdgeInsets.all(4),
                        borderRadius: BorderRadius.circular(5),
                        icon: Icon(
                          IconlyLight.arrow_down_2,
                          color: AppColor().inactiveGrey,
                        ),
                        itemHeight: 48,
                        border: BorderSide(
                            color: AppColor().indicatorColor, width: 2),
                        dropdownButtonColor: AppColor().boxGrey,
                        value: selectedCountry,
                        onChanged: (newValue) {
                          setState(() {});
                        },
                        style: const TextStyle(color: Colors.white),
                        items: ['MA - Moving Average']
                            .map((value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                      ),
                    ),
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
