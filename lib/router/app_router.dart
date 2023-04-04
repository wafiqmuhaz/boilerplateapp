// ignore_for_file: always_use_package_imports

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../features/application/about_page.dart';
import '../features/application/config_page.dart';
import '../features/application/features_page.dart';
import '../features/application/home_page.dart';
import '../features/application/skeleton_page.dart';
import '../features/demo/ui/assets_page.dart';
import '../features/demo/ui/images_from_db_page.dart';
import '../features/dog_image_random/ui/dog_image_random_page.dart';
import '../widgets/error_page.dart';

class AppRouter {
  AppRouter._();

  static const String skeleton = '/'; //skeleton
  static const String home = '/home'; //home
  static const String about = '/about';
  static const String features = '/features';
  static const String dogImageRandomPath = '/dogImageRandom';
  static const String config = '/config';
  static const String assets = '/assets';
  static const String imagesFromDb = '/imagesFromDb';

  static GoRouter get router => _router;
  static final _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/', //skeleton
        builder: (context, state) => const SkeletonPage(),
      ),
      GoRoute(
        path: '/home', //home
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/features', //home
        builder: (context, state) => const FeaturesPage(),
      ),
      GoRoute(
        path: '/about', //home
        builder: (context, state) => const AboutPage(),
      ),
      GoRoute(
        path: dogImageRandomPath,
        builder: (context, state) => const DogImageRandomPage(),
      ),
      GoRoute(
        path: config,
        builder: (context, state) => const ConfigPage(),
      ),
      GoRoute(
        path: assets,
        builder: (context, state) => const AssetsPage(),
      ),
      GoRoute(
        path: imagesFromDb,
        builder: (context, state) {
          if (!kIsWeb) {
            return const ImagesFromDbPage();
          }

          return const ErrorPage();
        },
      ),
    ],
  );
}
