// ignore_for_file: always_use_package_imports, use_super_parameters

import 'package:boilerplateapp/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../../common/app_dimens.dart';
import '../../common/app_spacing.dart';
import '../../lang/cubit/config_cubit.dart';
import '../../lang/utils/utils.dart';
import 'bloc/application_bloc.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.config),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.basePadding),
        child: Column(
          children: [
            _buildLangs(context),
            AppSpacing.verticalSpacing24,
            _buildDarkMode(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLangs(BuildContext context) {
    return Card(
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
              AppLocalizations.of(context).kLanguage,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .apply(fontWeightDelta: 2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDarkMode(BuildContext context) {
    final bloc = BlocProvider.of<ApplicationBloc>(context);
    return BlocBuilder<ApplicationBloc, ApplicationState>(
      bloc: bloc,
      builder: (context, state) {
        final l10n = context.l10n;
        return Card(
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
                      Ionicons.swap_vertical_outline,
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
        );
      },
    );
  }
}
