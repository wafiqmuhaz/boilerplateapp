// ignore_for_file: always_use_package_imports, omit_local_variable_types

import 'package:boilerplateapp/features/application/about_page.dart';
import 'package:boilerplateapp/features/application/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/bottom_nav_cubit.dart';
import 'features_page.dart';
import 'widgets/app_bar_gone.dart';
import 'widgets/bottom_nav_bar.dart';

class SkeletonPage extends StatelessWidget {
  const SkeletonPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> pageNavigation = <Widget>[
      HomePage(),
      FeaturesPage(),
      AboutPage(),
    ];

    return BlocProvider<BottomNavCubit>(
      create: (BuildContext context) => BottomNavCubit(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const AppBarGone(),

        /// When switching between tabs this will fade the old
        /// layout out and the new layout in.
        body: BlocBuilder<BottomNavCubit, int>(
          builder: (BuildContext context, int state) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: pageNavigation.elementAt(
                state,
              ),
            );
          },
        ),

        bottomNavigationBar: const BottomNavBar(),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
