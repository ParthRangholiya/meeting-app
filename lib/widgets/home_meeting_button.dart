import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class HomeMeetingButton extends StatelessWidget {
  const HomeMeetingButton(
      {super.key, required this.onPressed, required this.icon, required this.text});

  final VoidCallback onPressed;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.06),
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Icon(icon),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text.toString(),
            style: const TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
