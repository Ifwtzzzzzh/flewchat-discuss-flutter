import 'package:discuss_app_v3/configs/session.dart';
import 'package:discuss_app_v3/controller/c_add_topic.dart';
import 'package:discuss_app_v3/controller/c_comment.dart';
import 'package:discuss_app_v3/controller/c_follower.dart';
import 'package:discuss_app_v3/controller/c_following.dart';
import 'package:discuss_app_v3/controller/c_profile.dart';
import 'package:discuss_app_v3/controller/c_search.dart';
import 'package:discuss_app_v3/models/user.dart';
import 'package:discuss_app_v3/pages/add_topic.dart';
import 'package:discuss_app_v3/pages/error_page.dart';
import 'package:discuss_app_v3/pages/home_page.dart';
import 'package:discuss_app_v3/pages/login_page.dart';
import 'package:discuss_app_v3/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRoute {
  // Define app-wide route names for key screens, ensuring consistency and readability.
  static const home = '/';
  static const login = '/login';
  static const register = '/register';
  static const addTopic = '/add-topic';
  static const profile = '/profile';
  static const search = '/search';
  static const follower = '/follower';
  static const following = '/following';
  static const comment = '/comment';
  static const detailTopic = '/detail-topic';
  static const updateTopic = '/update-topic';

  // GoRouter configuration for app navigation, error handling, authentication, and loading states.
  static GoRouter routerConfig = GoRouter(
    errorBuilder: (context, state) => state.error != null
        ? ErrorPage(
            title: 'Something Error',
            description: state.error.toString(),
          )
        : const SizedBox(), // Or a loading indicator
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      User? user = await Session.getUser();
      if (user == null) {
        if (state.fullPath == login || state.fullPath == register) {
          return null;
        }
        return login;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => RegisterPage(),
      ),
      GoRoute(
        path: addTopic,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => CAddTopic(),
          child: AddTopic(),
        ),
      ),
      GoRoute(
        path: profile,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => CProfile(),
          child: const Scaffold(),
        ),
      ),
      GoRoute(
        path: search,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => CSearch(),
          child: const Scaffold(),
        ),
      ),
      GoRoute(
        path: follower,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => CFollower(),
          child: const Scaffold(),
        ),
      ),
      GoRoute(
        path: following,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => CFollowing(),
          child: const Scaffold(),
        ),
      ),
      GoRoute(
        path: comment,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => CComment(),
          child: const Scaffold(),
        ),
      ),
    ],
  );
}
