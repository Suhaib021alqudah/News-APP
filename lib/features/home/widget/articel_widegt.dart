import 'package:api/core/constant/app_font.dart';
import 'package:api/core/routing/app_routes.dart';
import 'package:api/features/home/models/top_head_lines_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key, required this.article});

  final Article article;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).pushNamed(AppRoutes.detailsScreen, extra: article);
      },
      child: Padding(
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
                    article.title!,
                    style: AppFont.homePageHeadText,
                    maxLines: 2,
                  ),
                ),
                Gap(8.h),
                SizedBox(
                  width: 200.w,
                  child: Text(
                    '${article.author ?? "Unknown"} . ${article.publishedAt ?? ""}',
                    style: AppFont.homePagedescText,
                  ),
                ),
              ],
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                imageUrl:
                    article.urlToImage ??
                    'https://media.istockphoto.com/id/827247322/vector/danger-sign-vector-icon-attention-caution-illustration-business-concept-simple-flat-pictogram.jpg?s=612x612&w=0&k=20&c=BvyScQEVAM94DrdKVybDKc_s0FBxgYbu-Iv6u7yddbs=',
                width: 112.w,
                height: 80.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
