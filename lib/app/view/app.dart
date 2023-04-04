// ignore_for_file: unused_import, always_use_package_imports

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../common/app_themes.dart';
import '../../configs/app_config.dart';
import '../../features/application/bloc/application_bloc.dart';
import '../../features/application/cubit/bottom_nav_cubit.dart';
import '../../injector/injector.dart';
import '../../l10n/l10n.dart';
import '../../lang/cubit/config_cubit.dart';
import '../../router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationBloc>(
          create: (context) => Injector.instance<ApplicationBloc>()
            ..add(const ApplicationLoaded()),
        ),
        BlocProvider<ConfigCubit>(
          create: (context) => ConfigCubit(),
        ),
        BlocProvider<BottomNavCubit>(
          create: (context) => BottomNavCubit(),
        ),
      ],
      child: BlocBuilder<ApplicationBloc, ApplicationState>(
        builder: (context, state) {
          return MaterialApp.router(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: context.watch<ConfigCubit>().state.currentLocale,
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            routeInformationProvider: AppRouter.router.routeInformationProvider,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routerDelegate: AppRouter.router.routerDelegate,
            title: 'BoilerPlate',
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
