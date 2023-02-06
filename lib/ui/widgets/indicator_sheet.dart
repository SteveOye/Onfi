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
  var selectValue;
  bool checkMA = false;
  var selectRSI;
  bool checkRSI = false;
  var selectBOLL;
  bool checkBOLL = false;
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
                children: [
                  Visibility(
                    visible: checkMA,
                    child: SelectedIndicator(
                      indicate: 'MA',
                      callback: (bool value) {
                        setState(() {
                          checkMA = !checkMA;
                        });
                      },
                    ),
                  ),
                  Visibility(
                    visible: checkRSI,
                    child: SelectedIndicator(
                      indicate: 'RSI',
                      callback: (bool value) {
                        setState(() {
                          checkRSI = !checkRSI;
                        });
                      },
                    ),
                  ),
                  Visibility(
                    visible: checkBOLL,
                    child: SelectedIndicator(
                      indicate: 'BOLL',
                      callback: (bool value) {
                        setState(() {
                          checkBOLL = !checkBOLL;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              MATick(),
              const SizedBox(
                height: 36,
              ),
              RSITick(),
              const SizedBox(
                height: 36,
              ),
              BOLLTick(),
            ],
          ),
        )
      ],
    );
  }

  Row MATick() {
    return Row(
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: GFCheckbox(
            inactiveIcon: Icon(
              Icons.check,
              size: 12,
              color: AppColor().grey,
            ),
            activeIcon: const Icon(
              Icons.check,
              size: 12,
            ),
            onChanged: (value) {
              setState(() {
                checkMA = !checkMA;
              });
            },
            value: checkMA,
            inactiveBgColor: AppColor().inactiveGrey,
          ),
        ),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: GFDropdown(
              padding: const EdgeInsets.only(left: 16, right: 16),
              borderRadius: BorderRadius.circular(5),
              icon: Icon(
                IconlyLight.arrow_down_2,
                color: AppColor().inactiveGrey,
              ),
              dropdownColor: AppColor().grey,
              itemHeight: 40,
              border: BorderSide(color: AppColor().indicatorColor, width: 2),
              dropdownButtonColor: AppColor().boxGrey,
              value: selectValue,
              onChanged: (newValue) {
                setState(() {
                  selectValue = newValue as String;
                });
              },
              style: const TextStyle(color: Colors.white, fontSize: 15),
              items: [
                'MA - Moving Average',
              ]
                  .map((value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Row RSITick() {
    return Row(
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: GFCheckbox(
            inactiveIcon: Icon(
              Icons.check,
              size: 12,
              color: AppColor().grey,
            ),
            activeIcon: const Icon(
              Icons.check,
              size: 12,
            ),
            onChanged: (value) {
              setState(() {
                checkRSI = !checkRSI;
              });
            },
            value: checkRSI,
            inactiveBgColor: AppColor().inactiveGrey,
          ),
        ),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: GFDropdown(
              padding: const EdgeInsets.only(left: 16, right: 16),
              borderRadius: BorderRadius.circular(5),
              icon: Icon(
                IconlyLight.arrow_down_2,
                color: AppColor().inactiveGrey,
              ),
              dropdownColor: AppColor().grey,
              itemHeight: 40,
              border: BorderSide(color: AppColor().indicatorColor, width: 2),
              dropdownButtonColor: AppColor().boxGrey,
              value: selectRSI,
              onChanged: (newValue) {
                setState(() {
                  selectRSI = newValue as String;
                });
              },
              style: const TextStyle(color: Colors.white, fontSize: 15),
              items: [
                'RSI - Relative Strenth Index',
              ]
                  .map((value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Row BOLLTick() {
    return Row(
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: GFCheckbox(
            inactiveIcon: Icon(
              Icons.check,
              size: 12,
              color: AppColor().grey,
            ),
            activeIcon: const Icon(
              Icons.check,
              size: 12,
            ),
            onChanged: (value) {
              setState(() {
                checkBOLL = !checkBOLL;
              });
            },
            value: checkBOLL,
            inactiveBgColor: AppColor().inactiveGrey,
          ),
        ),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: GFDropdown(
              padding: const EdgeInsets.only(left: 16, right: 16),
              borderRadius: BorderRadius.circular(5),
              icon: Icon(
                IconlyLight.arrow_down_2,
                color: AppColor().inactiveGrey,
              ),
              dropdownColor: AppColor().grey,
              itemHeight: 40,
              border: BorderSide(color: AppColor().indicatorColor, width: 2),
              dropdownButtonColor: AppColor().boxGrey,
              value: selectBOLL,
              onChanged: (newValue) {
                setState(() {
                  selectBOLL = newValue as String;
                });
              },
              style: const TextStyle(color: Colors.white, fontSize: 15),
              items: [
                'BOLL - Bollinger Bands',
              ]
                  .map((value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class SelectedIndicator extends StatefulWidget {
  final String indicate;
  final ValueSetter<bool>? callback;
  const SelectedIndicator(
      {Key? key, required this.indicate, required this.callback})
      : super(key: key);

  @override
  State<SelectedIndicator> createState() => _SelectedIndicatorState();
}

class _SelectedIndicatorState extends State<SelectedIndicator> {
  bool close = true;
  @override
  Widget build(BuildContext context) {
    void tapDetected() {
      setState(() {
        close = !close;
      });
    }

    return Visibility(
      visible: close,
      child: Container(
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
              widget.indicate,
              style: TextStyle(
                color: AppColor().neonBlue,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: tapDetected,
              child: Icon(
                Icons.close,
                color: AppColor().inactiveGrey,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
