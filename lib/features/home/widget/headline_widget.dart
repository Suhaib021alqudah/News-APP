import 'package:api/core/constant/app_font.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HeadlineWidget extends StatelessWidget {
  final String title;
  final String authorName;
  final String date;
  final String? imageUrl;
  const HeadlineWidget({
    super.key,
    required this.title,
    required this.authorName,
    required this.date,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl:
                  imageUrl ??
                  'https://s.france24.com/media/display/e6279b3c-db08-11ee-b7f5-005056bf30b7/w:1280/p:16x9/news_en_1920x1080.jpg',
              height: 206.h,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const Gap(16),
        Text(title, style: AppFont.homePageHeadText),
        const Gap(8),
        Text('$authorName . $date', style: AppFont.homePagedescText),
      ],
    );
  }
}
