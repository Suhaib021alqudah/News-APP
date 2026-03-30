import 'package:api/core/constant/app_color.dart';
import 'package:api/core/routing/app_routes.dart';
import 'package:api/features/home/models/top_head_lines_model.dart';
import 'package:api/features/home/services/home_screen_services.dart';
import 'package:api/features/home/widget/articel_widegt.dart';
import 'package:api/features/home/widget/catogey_widget.dart';
import 'package:api/features/home/widget/headline_widget.dart';
import 'package:api/features/home/widget/search_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> categories = [
    'travel',
    'technology',
    'business',
    'entertainment',
  ];

  late Future<GenralArticlsModels?> _newsFuture;

  @override
  void initState() {
    super.initState();
    _newsFuture = HomeScreenServices().getTopHeadLines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 68.h,
        backgroundColor: AppColor.secondryColor,
        title: Text(
          'explore'.tr(),
          style: GoogleFonts.inter(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 32.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (context.locale.languageCode == 'en') {
                context.setLocale(const Locale('ar'));
              } else {
                context.setLocale(const Locale('en'));
              }
            },
            icon: const Icon(Icons.language),
          ),
          SizedBox(width: 220.w, child: const SearchTextField()),
        ],
      ),
      body: FutureBuilder<GenralArticlsModels?>(
        future: _newsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: AppColor.secondryColor),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.hasData && snapshot.data != null) {
            final articles = snapshot.data!.articles ?? [];
            if (articles.isEmpty) {
              return Center(child: Text('no_results'.tr()));
            }

            return Column(
              children: [
                const Gap(10),
                _buildCategoryBar(),
                const Gap(30),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    physics: const BouncingScrollPhysics(),
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      final dateFormatted = article.publishedAt != null
                          ? DateFormat(
                              'yyyy-MM-dd - kk:mm',
                            ).format(article.publishedAt!)
                          : '';

                      if (index == 0) {
                        return Column(
                          children: [
                            HeadlineWidget(
                              imageUrl:
                                  article.urlToImage ??
                                  'https://uxwing.com/wp-content/themes/uxwing/download/signs-and-symbols/error-icon.png',
                              authorName: article.author ?? '',
                              date: dateFormatted,
                              title: article.title ?? '',
                            ),
                            const Gap(40),
                          ],
                        );
                      }

                      return Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: ArticleWidget(article: article),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const Center(child: Text('Try Again'));
        },
      ),
    );
  }

  Widget _buildCategoryBar() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 32.w),
      child: SizedBox(
        height: 40.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) => CatogeryWidget(
            title: categories[index].tr(),
            onTap: () {
              GoRouter.of(
                context,
              ).pushReplacement(AppRoutes.resultPage, extra: categories[index]);
            },
          ),
        ),
      ),
    );
  }
}
