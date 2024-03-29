import 'package:course_discuss_app/config/app_color.dart';
import 'package:course_discuss_app/config/app_route.dart';
import 'package:course_discuss_app/controller/c_account.dart';
import 'package:course_discuss_app/controller/c_home.dart';
import 'package:course_discuss_app/controller/c_my_topic.dart';
import 'package:course_discuss_app/controller/c_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/session.dart';
import 'controller/c_explore.dart';
import 'controller/c_feed.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CUser()),
        ChangeNotifierProvider(create: (_) => CHome()),
        ChangeNotifierProvider(create: (_) => CFeed()),
        ChangeNotifierProvider(create: (_) => CExplore()),
        ChangeNotifierProvider(create: (_) => CMyTopic()),
        ChangeNotifierProvider(create: (_) => CAccount()),
      ],
      builder: (context, child) {
        Session.getUser().then((user) {
          if (user != null) context.read<CUser>().data = user;
        });
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColor.primary,
            colorScheme: const ColorScheme.light().copyWith(
              primary: AppColor.primary,
              secondary: AppColor.primary,
            ),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: AppColor.primary,
              foregroundColor: Colors.white,
            ),
          ),
          routerConfig: AppRoute.routerConfig,
        );
      },
    );
  }
}
