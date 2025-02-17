import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCardWidget extends StatelessWidget {
  final Widget? icon;
  const ProductCardWidget({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height / 6,
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        AppImageAssets.testitemview,
                        width: 130,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "XYZ wall Lamp 100W",
                          style: TextStyle(
                              fontFamily: "inter",
                              fontWeight: FontWeight.w700,
                              fontSize: 12),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Spacer(),
                            IconButton(onPressed: () {}, icon: icon!)
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          );
        });
  }
}
