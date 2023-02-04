import 'package:flutter/material.dart';

class TopTags extends StatelessWidget {
  final Color textColor, background;
  final String text;
  final icon;
  final iconVisibility;
  const TopTags({
    Key? key,
    required this.textColor,
    required this.background,
    required this.text,
    this.iconVisibility = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(6, 3, 6, 3),
      decoration: BoxDecoration(
          color: background,
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      child: Center(
        child: Row(
          children: [
            Visibility(
              visible: iconVisibility,
              child: Icon(
                icon,
                color: textColor,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
