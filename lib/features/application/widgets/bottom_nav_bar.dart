// ignore_for_file: always_use_package_imports, prefer_const_constructors

import 'package:boilerplateapp/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../cubit/bottom_nav_cubit.dart';

class BottomNavBar extends StatelessWidget {
  /// It is okay not to use a const constructor here.
  /// Using const breaks updating of selected BottomNavigationBarItem.
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Card(
      margin: const EdgeInsets.only(top: 1, right: 4, left: 4),
      elevation: 4,
      shadowColor: Theme.of(context).colorScheme.shadow,
      color: Theme.of(context).colorScheme.surfaceVariant,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (BuildContext context, int state) {
          return BottomNavigationBar(
            currentIndex: state,
            onTap: (int index) =>
                context.read<BottomNavCubit>().updateIndex(index),
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Theme.of(context).textTheme.bodySmall!.color,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Ionicons.home_outline),
                label: l10n.kBottom_nav_first,
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.grid_outline),
                label: 'Features',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.information_circle_outline),
                label: l10n.kBottom_nav_second,
              ),
            ],
          );
        },
      ),
    );
  }
}
