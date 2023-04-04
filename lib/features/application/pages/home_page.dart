// ignore_for_file: always_use_package_imports, lines_longer_than_80_chars

import 'package:boilerplateapp/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

import '../../../common/app_spacing.dart';
import '../../../lang/lang.dart';
import '../../../router/app_router.dart';
import '../bloc/application_bloc.dart';
import '../widgets/header.dart';
import '../widgets/second_screen/text_divider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ApplicationBloc>(context);
    final l10n = context.l10n;
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Header(text: l10n.kApp_name_2),

          Card(
            elevation: 2,
            shadowColor: Theme.of(context).colorScheme.shadow,

            /// Example: Many items have their own colors inside of the ThemData
            /// You can overwrite them in [config/theme.dart].
            color: Theme.of(context).colorScheme.surface,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  12,
                ),
              ),
            ),
            child: BlocBuilder<ApplicationBloc, ApplicationState>(
              bloc: bloc,
              builder: (context, state) {
                final l10n = context.l10n;
                return SwitchListTile(
                  onChanged: (value) {
                    bloc.add(ApplicationDarkModeChanged(enable: value));
                  },
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        12,
                      ),
                    ),
                  ),
                  value: state.isDarkMode,
                  title: Row(
                    children: <Widget>[
                      Icon(
                        Ionicons.contrast_outline,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        l10n.kTheme,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .apply(fontWeightDelta: 2),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          AppSpacing.verticalSpacing10,

          Card(
            elevation: 2,
            shadowColor: Theme.of(context).colorScheme.shadow,
            color: Theme.of(context).colorScheme.surface,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  12,
                ),
              ),
            ),
            child: ListTile(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    12,
                  ),
                ),
              ),
              trailing: PopupMenuButton(
                icon: const Icon(
                  Icons.more_vert,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                elevation: 1,
                itemBuilder: (context) {
                  return AppLocalizations.supportedLocales.map(
                    (locale) {
                      return PopupMenuItem<String>(
                        value: locale.languageCode,
                        child: Text(
                          Utils.localeToCountryName(locale),
                        ),
                      );
                    },
                  ).toList();
                },
                onSelected: (value) {
                  context.read<ConfigCubit>().changeLanguage(
                        Locale(value),
                      );
                },
              ),
              title: Row(
                children: <Widget>[
                  Icon(
                    Ionicons.language_outline,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    l10n.kLanguage,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .apply(fontWeightDelta: 2),
                  ),
                ],
              ),
            ),
          ),

          // GridView.count(
          //     physics: const NeverScrollableScrollPhysics(),
          //     shrinkWrap: true,
          //     crossAxisCount: 3,
          //     crossAxisSpacing: 8,
          //     mainAxisSpacing: 8,
          //     childAspectRatio: 1.75 / 1,
          //     padding: EdgeInsets.zero,
          //     children: const <ThemeCard>[
          //       ThemeCard(
          //         mode: ThemeMode.system,
          //         icon: Ionicons.contrast_outline,
          //       ),
          //       ThemeCard(
          //         mode: ThemeMode.light,
          //         icon: Ionicons.sunny_outline,
          //       ),
          //       ThemeCard(
          //         mode: ThemeMode.dark,
          //         icon: Ionicons.moon_outline,
          //       ),
          //     ]),

          /// Example: Good way to add space between items without using Paddings
          TextDivider(text: l10n.kExamples),

          Column(
            children: [
              // CARD 1 => RANDOM DOG PAGE
              Card(
                elevation: 2,
                shadowColor: Theme.of(context).colorScheme.shadow,
                color: Theme.of(context).colorScheme.surface,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      12,
                    ),
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    context.push(AppRouter.dogImageRandomPath);
                  },
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        12,
                      ),
                    ),
                  ),
                  trailing: Icon(
                    Ionicons.open_outline,
                    color: Theme.of(context).textTheme.titleMedium!.color,
                  ),
                  title: Row(
                    children: <Widget>[
                      Icon(
                        Ionicons.paw_outline,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        l10n.dog_image_random,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .apply(fontWeightDelta: 2),
                      ),
                    ],
                  ),
                ),
              ),
              AppSpacing.verticalSpacing10,
              // CARD 2 => CONFIG PAGE
              Card(
                elevation: 2,
                shadowColor: Theme.of(context).colorScheme.shadow,
                color: Theme.of(context).colorScheme.surface,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      12,
                    ),
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    context.push(AppRouter.config);
                  },
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        12,
                      ),
                    ),
                  ),
                  trailing: Icon(
                    Ionicons.open_outline,
                    color: Theme.of(context).textTheme.titleMedium!.color,
                  ),
                  title: Row(
                    children: <Widget>[
                      Icon(
                        Ionicons.build_outline,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        l10n.config,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .apply(fontWeightDelta: 2),
                      ),
                    ],
                  ),
                ),
              ),
              AppSpacing.verticalSpacing10,
              // CARD 3 => SVG PAGE
              Card(
                elevation: 2,
                shadowColor: Theme.of(context).colorScheme.shadow,
                color: Theme.of(context).colorScheme.surface,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      12,
                    ),
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    context.push(AppRouter.assets);
                  },
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        12,
                      ),
                    ),
                  ),
                  trailing: Icon(
                    Ionicons.open_outline,
                    color: Theme.of(context).textTheme.titleMedium!.color,
                  ),
                  title: Row(
                    children: <Widget>[
                      Icon(
                        Ionicons.document_outline,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        l10n.assets,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .apply(fontWeightDelta: 2),
                      ),
                    ],
                  ),
                ),
              ),
              AppSpacing.verticalSpacing10,
              // CARD 4 => LOCAL DB PAGE
              Card(
                elevation: 2,
                shadowColor: Theme.of(context).colorScheme.shadow,
                color: Theme.of(context).colorScheme.surface,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      12,
                    ),
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    context.push(AppRouter.imagesFromDb);
                  },
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        12,
                      ),
                    ),
                  ),
                  trailing: Icon(
                    Ionicons.open_outline,
                    color: Theme.of(context).textTheme.titleMedium!.color,
                  ),
                  title: Row(
                    children: <Widget>[
                      Icon(
                        Ionicons.document_lock_outline,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        l10n.image_from_db,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .apply(fontWeightDelta: 2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
