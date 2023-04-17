import 'package:flutter/cupertino.dart';
import 'package:zoom_clone/utils/colors.dart';

class MeetingOption extends StatelessWidget {
  const MeetingOption(
      {super.key,
      required this.text,
      required this.isMute,
      required this.onchange});
      
  final String text;
  final bool isMute;
  final Function(bool) onchange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: secondarybackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            CupertinoSwitch(
              value: isMute,
              onChanged: onchange,
            ),
          ],
        ),
      ),
    );
  }
}
