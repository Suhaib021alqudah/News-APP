import 'package:api/core/network/api_helper.dart';
import 'package:api/core/routing/router_gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  ApiHelper.initDio();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'asstes/translation',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      child: const APIAPP(),
    ),
  );
}

class APIAPP extends StatelessWidget {
  const APIAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'News App',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routerConfig: RouterGen.goRouter,
        );
      },
    );
  }
}
