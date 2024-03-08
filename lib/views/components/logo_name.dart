import 'package:crypto_price_tracker/common/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class LogoAndName extends StatelessWidget {
  const LogoAndName({
    Key? key,
    required this.path,
    required this.title,
    required this.size,
  }) : super(key: key);

  final String path, title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w),
      // color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            height: size.h,
            width: size.h,
            image: Svg(
              // size: Size(size.h, size.h),
              path,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: Responsive.isMobile(context) ? 15 : 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
