// ignore_for_file: always_use_package_imports, always_put_required_named_parameters_first, lines_longer_than_80_chars, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/application_bloc.dart';

class ThemeCard extends StatelessWidget {
  const ThemeCard({
    super.key,
    required this.mode,
    required this.icon,
  });

  final IconData icon;
  final ThemeMode mode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
      builder: (BuildContext context, state) {
        return Card(
          elevation: 2,
          shadowColor: Theme.of(context).colorScheme.shadow,
          color: state.isDarkMode == mode
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surface,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                12,
              ),
            ),
          ),
          child: Icon(icon),
          // InkWell(
          //   onTap: () {
          //     //   return BlocProvider.of<ThemeCubit>(context).getTheme(
          //     //   ThemeModeState(themeMode: mode),
          //     // ),
          //   },
          //   borderRadius: const BorderRadius.all(Radius.circular(12)),
          //   child:
          //       Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary
          //           // state.themeMode != mode
          //           //     ? Theme.of(context).colorScheme.primary
          //           //     : Colors.white,
          //           ),
          // ),
        );
      },
    );
  }
}
