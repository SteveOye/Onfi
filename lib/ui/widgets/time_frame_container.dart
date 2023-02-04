import 'package:flutter/material.dart';
import 'package:onfinance/ui/style/app_color.dart';

class TimeContainer extends StatefulWidget {
  const TimeContainer({
    super.key,
    this.selected = false,
    required this.timeString,
  });

  final selected;
  final String timeString;

  @override
  State<TimeContainer> createState() => _TimeContainerState();
}

class _TimeContainerState extends State<TimeContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.selected ? AppColor().blue : Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(13, 4, 13, 4),
      child: Text(
        widget.timeString,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
