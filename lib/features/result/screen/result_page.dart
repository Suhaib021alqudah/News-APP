import 'package:api/core/constant/app_color.dart';
import 'package:api/core/constant/constant.dart';
import 'package:api/core/routing/app_routes.dart';
import 'package:api/features/home/models/top_head_lines_model.dart';
import 'package:api/features/home/widget/articel_widegt.dart';
import 'package:api/features/home/widget/headline_widget.dart';
import 'package:api/features/result/services/result_services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatefulWidget {
  final String query;
  const ResultPage({super.key, required this.query});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late Future<GenralArticlsModels?> _resultFuture;

  @override
  void initState() {
    super.initState();

    _resultFuture = ResultServices().searchItemByName(widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 68.h,
        backgroundColor: AppColor.secondryColor,
        title: Text(
          'search_results'.tr(),
          style: GoogleFonts.inter(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 32.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRoutes.homePage);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () => context.pushNamed(AppRoutes.searchPage),
            icon: Icon(Icons.search, color: AppColor.primaryColor),
          ),
          IconButton(
            onPressed: () async {
              if (context.locale.languageCode == 'en') {
                await context.setLocale(const Locale('ar'));
                AppConstant.languageCode = 'ar';
              } else {
                await context.setLocale(const Locale('en'));
                AppConstant.languageCode = 'en';
              }
              setState(() {
                _resultFuture = ResultServices().searchItemByName(widget.query);
              });
            },
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: FutureBuilder<GenralArticlsModels?>(
        future: _resultFuture,
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
                const Gap(30),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    physics: const BouncingScrollPhysics(),
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final article = articles[index];

                      final publishedAt = article.publishedAt;
                      final dateFormatted = publishedAt != null
                          ? DateFormat('yyyy-MM-dd - kk:mm').format(publishedAt)
                          : '';

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
}
