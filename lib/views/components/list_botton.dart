// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crypto_price_tracker/common/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListBotton extends StatelessWidget {
  const ListBotton({
    Key? key,
    required this.listOfAttrebute,
    this.colorButton = MyColorClass.textColorPrimary,
  }) : super(key: key);
  final List<String> listOfAttrebute;
  final Color colorButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      child: Row(
        children: List.generate(
          listOfAttrebute.length,
          (index) => TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/second");
            },
            child: Text(
              listOfAttrebute[index],
              style: TextStyle(
                color: colorButton,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
