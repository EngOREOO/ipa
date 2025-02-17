import 'package:flutter/material.dart';

class ButtonLangWidget extends StatelessWidget {
  final String? image;
  final String? name;

  final void Function()? ontap;

  const ButtonLangWidget(
      {super.key, this.image, this.ontap, required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 150,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(image!),
              ),
              Text(
                name!,
                style: TextStyle(fontFamily: "cairo", fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
