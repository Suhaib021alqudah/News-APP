import 'package:api/core/constant/app_font.dart';
import 'package:api/features/home/models/top_head_lines_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: CachedNetworkImage(
                width: MediaQuery.sizeOf(context).width,

                imageUrl:
                    article.urlToImage ??
                    'https://uxwing.com/wp-content/themes/uxwing/download/signs-and-symbols/error-icon.png',
              ),
            ),

            Positioned(
              bottom: 0,
              child: Container(
                width: 430.w,
                height: MediaQuery.sizeOf(context).height - 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(64.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.w,
                    vertical: 24.h,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Gap(24.h),
                        Text(
                          article.title ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        Gap(16.h),
                        Text(
                          DateFormat(
                            'yyyy-MM-dd - kk:mm',
                          ).format(article.publishedAt!),
                        ),
                        const Gap(24),
                        SizedBox(
                          width: 366.w,
                          child: Text(
                            '${article.description}',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
