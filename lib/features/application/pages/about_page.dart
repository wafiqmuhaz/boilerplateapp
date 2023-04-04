// ignore_for_file: always_use_package_imports, lines_longer_than_80_chars

import 'package:boilerplateapp/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../../../common/app_spacing.dart';
import '../bloc/application_bloc.dart';
import '../widgets/header.dart';
import '../widgets/second_screen/grid_item.dart';
import '../widgets/second_screen/link_card.dart';
import '../widgets/second_screen/text_divider.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
          Header(text: l10n.kBottom_nav_second),
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
          LinkCard(
            title: 'github_card_title',
            icon: Ionicons.logo_github,
            url: Uri.parse(
              'https://github.com/wafiqmuhaz/',
            ),
          ),
          TextDivider(text: l10n.kAuthor_divider_title),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 2 / 1.15,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: <GridItem>[
              GridItem(
                title: l10n.kInstagram_card_title,
                icon: Ionicons.logo_instagram,
                url: Uri.parse(
                  'https://www.instagram.com/az.wamuh_/?hl=id',
                ),
              ),
              GridItem(
                title: l10n.kLinkedIn,
                icon: Ionicons.globe_outline,
                url: Uri.parse(
                  'https://www.linkedin.com/in/wafiq-muhammad-abdul-aziz-281503235/',
                ),
              ),
              GridItem(
                title: l10n.kDonate_card_title,
                icon: Ionicons.heart_outline,
                url: Uri.parse(
                  'https://www.paypal.com/',
                ),
              ),
              GridItem(
                title: l10n.kWebsite_card_title,
                icon: Ionicons.desktop_outline,
                url: Uri.parse(
                  'https://wafiqmuhaz.netlify.app',
                ),
              ),
            ],
          ),
          TextDivider(text: l10n.kPackages_divider_title),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 2 / 1.15,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: <GridItem>[
              GridItem(
                title: 'flutter_bloc',
                icon: Ionicons.apps_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/flutter_bloc/versions/8.0.2',
                ),
                version: '8.1.2',
              ),
              GridItem(
                title: 'bloc',
                icon: Ionicons.cube_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/bloc/versions/8.1.1',
                ),
                version: '8.1.1',
              ),
              GridItem(
                title: 'hydrated_bloc',
                icon: Ionicons.folder_open_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/hydrated_bloc/versions/9.1.0',
                ),
                version: '9.1.0',
              ),
              GridItem(
                title: 'equatable',
                icon: Ionicons.git_compare_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/equatable/versions/2.0.5',
                ),
                version: '2.0.5',
              ),
              GridItem(
                title: 'lints',
                icon: Ionicons.options_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/flutter_lints/versions/2.0.0',
                ),
                version: '2.0.0',
              ),
              GridItem(
                title: 'path_provider',
                icon: Ionicons.extension_puzzle_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/path_provider/versions/2.0.13',
                ),
                version: '2.0.13',
              ),
              GridItem(
                title: 'flutter_displaymode',
                icon: Ionicons.speedometer_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/flutter_displaymode/versions/0.5.0',
                ),
                version: '0.5.0',
              ),
              GridItem(
                title: 'intl',
                icon: Ionicons.language_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/intl/versions/0.18.0',
                ),
                version: '0.17.0',
              ),
              GridItem(
                title: 'hive',
                icon: Ionicons.leaf_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/hive/versions/2.2.3',
                ),
                version: '2.2.3',
              ),
              GridItem(
                title: 'url_launcher',
                icon: Ionicons.share_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/url_launcher/versions/6.1.10',
                ),
                version: '6.1.10',
              ),
              GridItem(
                title: 'ionicons',
                icon: Ionicons.logo_ionic,
                url: Uri.parse(
                  'https://pub.dev/packages/ionicons/versions/0.2.2',
                ),
                version: '0.2.2',
              ),

              //=========================
              GridItem(
                title: 'dio',
                icon: Ionicons.wifi_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/dio/versions/4.0.6',
                ),
                version: '4.0.6',
              ),
              GridItem(
                title: 'flutter_svg',
                icon: Ionicons.image_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/flutter_svg/versions/0.2.1',
                ),
                version: '2.0.3',
              ),
              GridItem(
                title: 'bloc_concurrency',
                icon: Ionicons.code_working_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/bloc_concurrency/versions/2.0.3',
                ),
                version: '0.2.1',
              ),
              GridItem(
                title: 'freezed_annotation',
                icon: Ionicons.diamond_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/freezed_annotation/versions/2.2.0',
                ),
                version: '2.2.0',
              ),
              GridItem(
                title: 'get_it',
                icon: Ionicons.link_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/get_it/versions/7.2.0',
                ),
                version: '7.2.0',
              ),
              GridItem(
                title: 'go_router',
                icon: Ionicons.walk_sharp,
                url: Uri.parse(
                  'https://pub.dev/packages/go_router/versions/6.2.0',
                ),
                version: '6.2.0',
              ),
              GridItem(
                title: 'logger',
                icon: Ionicons.bug_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/logger/versions/1.2.2',
                ),
                version: '1.2.2',
              ),
              GridItem(
                title: 'path_provider',
                icon: Ionicons.build_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/path_provider/versions/2.0.13',
                ),
                version: '2.0.13',
              ),
              GridItem(
                title: 'rxdart',
                icon: Ionicons.enter_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/rxdart/versions/0.27.7',
                ),
                version: '0.27.7',
              ),
              GridItem(
                title: 'shared_preferences',
                icon: Ionicons.git_branch_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/shared_preferences/versions/2.0.18',
                ),
                version: '2.0.18',
              ),
              GridItem(
                title: 'bloc_test',
                icon: Ionicons.construct_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/bloc_test/versions/9.1.1',
                ),
                version: '9.1.1',
              ),
              GridItem(
                title: 'flutter_lints',
                icon: Ionicons.code_slash_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/flutter_lints/versions/2.0.0',
                ),
                version: '2.0.0',
              ),
              GridItem(
                title: 'freezed',
                icon: Ionicons.diamond_sharp,
                url: Uri.parse(
                  'https://pub.dev/packages/freezed/versions/2.3.2',
                ),
                version: '2.3.2',
              ),
              GridItem(
                title: 'mockito',
                icon: Ionicons.git_compare_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/mockito/versions/5.3.0',
                ),
                version: '5.3.0',
              ),
              GridItem(
                title: 'mocktail',
                icon: Ionicons.git_pull_request_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/mocktail/versions/0.3.0',
                ),
                version: '0.3.0',
              ),
              GridItem(
                title: 'very_good_cli',
                icon: Ionicons.ribbon_outline,
                url: Uri.parse(
                  'https://pub.dev/packages/very_good_cli/versions/0.12.2',
                ),
                version: '0.12.2',
              ),
            ],
          ),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
