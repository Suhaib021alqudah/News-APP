import 'package:api/core/constant/app_color.dart';
import 'package:api/core/constant/app_font.dart';
import 'package:api/core/routing/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CatogeryWidget extends StatelessWidget {
  CatogeryWidget({super.key, required this.title});
  final String title;
  List<String> categories = [
    'Travel',
    'Technology',
    'Business',
    'Entertainment',
  ];

  bool isPressd = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: ElevatedButton(
        onPressed: () {
          GoRouter.of(context).pushNamed(AppRoutes.resultPage);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isPressd
              ? AppColor.secondryColor
              : Colors.transparent,
          elevation: 0,
          side: BorderSide(color: AppColor.secondryColor, width: 2.sp),
        ),
        child: Text(title.tr(), style: AppFont.catoegry),
      ),
    );
  }
}
