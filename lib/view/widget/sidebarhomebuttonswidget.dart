import 'package:flutter/material.dart';

class SideHomeButtonWidget extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final void Function()? onTap;
  const SideHomeButtonWidget({super.key, this.icon, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 25,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                text!,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
