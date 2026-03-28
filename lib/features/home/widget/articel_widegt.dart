import 'package:api/core/constant/app_font.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    super.key,
    required this.authorName,
    required this.date,
    required this.title,
    required this.imageUrl,
  });
  final String title;
  final String authorName;
  final String date;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(
                width: 238.w,
                child: Text(
                  title,
                  style: AppFont.homePageHeadText,
                  maxLines: 2,
                ),
              ),
              Gap(8.h),
              SizedBox(
                width: 200.w,
                child: Text(
                  '$authorName. $date',
                  style: AppFont.homePagedescText,
                ),
              ),
            ],
          ),

          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 112.w,
              height: 80.h,
            ),
          ),
        ],
      ),
    );
  }
}
