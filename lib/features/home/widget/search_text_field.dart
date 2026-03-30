import 'dart:developer';

import 'package:api/core/constant/app_color.dart';
import 'package:api/core/routing/app_routes.dart';
import 'package:api/features/home/widget/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  bool showTextField = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              textHint: 'Search',
              onFieldSubmitted: (value) {
                GoRouter.of(
                  context,
                ).pushReplacement(AppRoutes.resultPage, extra: value);
              },
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                showTextField = !showTextField;
              });
            },
            icon: Icon(Icons.search, color: AppColor.primaryColor),
          ),
        ],
      ),
    );
  }
}
