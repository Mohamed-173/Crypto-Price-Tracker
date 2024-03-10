import 'package:flutter/material.dart';

import '../../../common/constant/app_color.dart';

class LineTab extends StatelessWidget {
  const LineTab({
    Key? key,
    this.title = "Title",
    this.price = "1.6TB",
    this.total = "1.6TB",
    this.iconData = Icons.monetization_on_outlined,
  }) : super(key: key);
  final String title, price, total;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors.grey
                .withOpacity(0.05); // Light grey color when hovered
          } else if (states.contains(MaterialState.pressed)) {
            return Colors.grey.withOpacity(0.1); // Grey color when pressed
          }
          return Colors.white; // Default color
        }),
        overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors.grey
                .withOpacity(0.05); // Light grey color when hovered
          } else if (states.contains(MaterialState.pressed)) {
            return Colors.grey.withOpacity(0.1); // Grey color when pressed
          }
          return Colors.white; // Default color
        }),
      ),

      // onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        width: 800,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: MyColorClass.surfaceColor),
                  child: Icon(
                    iconData,
                    color: MyColorClass.textColorPrimary.withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 10,
                        color: MyColorClass.textColorSecondary,
                      ),
                    ),
                    Text(
                      total,
                      style: const TextStyle(
                        fontSize: 10,
                        color: MyColorClass.textColorSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              total,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
