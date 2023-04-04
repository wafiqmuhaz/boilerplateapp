// ignore_for_file: always_use_package_imports, lines_longer_than_80_chars

import 'package:boilerplateapp/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../../common/app_spacing.dart';
import '../../lang/lang.dart';
import 'bloc/application_bloc.dart';
import 'widgets/first_screen/info_card.dart';
import 'widgets/header.dart';
import 'widgets/second_screen/text_divider.dart';

class FeaturesPage extends StatelessWidget {
  const FeaturesPage({super.key});

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
          Header(text: l10n.kFeatures), //l10n

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
                          Utils.localeToCountryName(
                            locale,
                          ),
                        ),
                      );
                    },
                  ).toList();
                },
                onSelected: (value) {
                  context.read<ConfigCubit>().changeLanguage(
                        Locale(
                          value,
                        ),
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

          TextDivider(text: l10n.kFoundation),

          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 4 / 5.5,
            padding: EdgeInsets.zero,
            children: <InfoCard>[
              /// Example: it is good practice to put widgets in separate files.
              /// This way the screen files won't become too large and
              /// the code becomes more clear.
              InfoCard(
                title: l10n.kLocalization_title,
                content: l10n.kLocalization_content,
                icon: Ionicons.language_outline,
                isPrimaryColor: true,
              ),
              InfoCard(
                title: l10n.kLinting_title,
                content: l10n.kLinting_content,
                icon: Ionicons.code_slash_outline,
                isPrimaryColor: false,
              ),
              InfoCard(
                title: l10n.kStorage_title,
                content: l10n.kStorage_content,
                icon: Ionicons.folder_open_outline,
                isPrimaryColor: false,
              ),
              InfoCard(
                title: l10n.kDark_mode_title,
                content: l10n.kDark_mode_content,
                icon: Ionicons.moon_outline,
                isPrimaryColor: true,
              ),
              InfoCard(
                title: l10n.kState_title,
                content: l10n.kState_content,
                icon: Ionicons.leaf_outline,
                isPrimaryColor: true,
              ),
              InfoCard(
                title: l10n.kDisplay_title,
                content: l10n.kDisplay_content,
                icon: Ionicons.speedometer_outline,
                isPrimaryColor: false,
              ),
              InfoCard(
                title: l10n.kLatestStableFlutterVersion,
                content: l10n.kLatestStableFlutterVersionDesc,
                icon: Ionicons.flash_outline,
                isPrimaryColor: false,
              ),
              InfoCard(
                title: l10n.kNullSafety,
                content: l10n.kNullSafetyDesc,
                icon: Ionicons.color_wand_outline,
                isPrimaryColor: true,
              ),
              InfoCard(
                title: l10n.kBuildFlavors,
                content: l10n.kBuildFlavorsDesc,
                icon: Ionicons.construct_outline,
                isPrimaryColor: true,
              ),
              InfoCard(
                title: l10n.kCustomSplashScreen,
                content: l10n.kComingSoon,
                icon: Ionicons.layers_outline,
                isPrimaryColor: false,
              ),
              InfoCard(
                title: l10n.kCustomAppIcons,
                content: l10n.kComingSoon,
                icon: Ionicons.options_outline,
                isPrimaryColor: false,
              ),
              InfoCard(
                title: l10n.kSecureStorage,
                content: l10n.kComingSoon,
                icon: Ionicons.document_lock_outline,
                isPrimaryColor: true,
              ),
            ],
          ),

          TextDivider(text: l10n.kAutomationMaintenance),

          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 4 / 5.5,
            padding: EdgeInsets.zero,
            children: <InfoCard>[
              /// Example: it is good practice to put widgets in separate files.
              /// This way the screen files won't become too large and
              /// the code becomes more clear.

              InfoCard(
                title: l10n.kGitHubActionsWorkflows,
                content: l10n.kGitHubActionsWorkflowsDesc,
                icon: Ionicons.hammer_outline,
                isPrimaryColor: false,
              ),
              InfoCard(
                title: l10n.kComprehensiveUnitTests,
                content: l10n.kComprehensiveUnitTestsDesc,
                icon: Ionicons.pulse_outline,
                isPrimaryColor: true,
              ),
              InfoCard(
                title: l10n.kComprehensiveWidgetTests,
                content: l10n.kComprehensiveWidgetTestsDesc,
                icon: Ionicons.speedometer_outline,
                isPrimaryColor: true,
              ),
              InfoCard(
                title: l10n.kForceUpgrade,
                content: l10n.kComingSoon,
                icon: Ionicons.trending_up_outline,
                isPrimaryColor: false,
              ),
              InfoCard(
                title: l10n.kDownforMaintenance,
                content: l10n.kComingSoon,
                icon: Ionicons.trending_down_outline,
                isPrimaryColor: false,
              ),
              InfoCard(
                title: l10n.kInAppReviewSupport,
                content: l10n.kComingSoon,
                icon: Ionicons.eye_outline,
                isPrimaryColor: true,
              ),
              InfoCard(
                title: l10n.kCICD,
                content: l10n.kComingSoon,
                icon: Ionicons.color_wand_sharp,
                isPrimaryColor: true,
              ),
            ],
          ),

          TextDivider(text: l10n.kUserManagement),

          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 4 / 5.5,
            padding: EdgeInsets.zero,
            children: <InfoCard>[
              /// Example: it is good practice to put widgets in separate files.
              /// This way the screen files won't become too large and
              /// the code becomes more clear.

              InfoCard(
                title: l10n.kGoogleSignIn,
                content: l10n.kComingSoon,
                icon: Ionicons.logo_google_playstore,
                isPrimaryColor: false,
              ),
              InfoCard(
                title: l10n.kAppleSignIn,
                content: l10n.kComingSoon,
                icon: Ionicons.logo_apple,
                isPrimaryColor: true,
              ),
              InfoCard(
                title: l10n.kEmailSignIn,
                content: l10n.kComingSoon,
                icon: Ionicons.at_outline,
                isPrimaryColor: true,
              ),
              InfoCard(
                title: l10n.kEmailSignUp,
                content: l10n.kComingSoon,
                icon: Ionicons.logo_google,
                isPrimaryColor: false,
              ),
              InfoCard(
                title: l10n.kPermissionsIntegration,
                content: l10n.kComingSoon,
                icon: Ionicons.hand_left_outline,
                isPrimaryColor: false,
              ),
              InfoCard(
                title: l10n.kFormValidation,
                content: l10n.kComingSoon,
                icon: Ionicons.accessibility_outline,
                isPrimaryColor: true,
              ),
            ],
          ),

          TextDivider(text: l10n.kAnalyticsBackend),

          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 4 / 5.5,
            padding: EdgeInsets.zero,
            children: <InfoCard>[
              /// Example: it is good practice to put widgets in separate files.
              /// This way the screen files won't become too large and
              /// the code becomes more clear.

              InfoCard(
                title: l10n.kFirebaseAnalyticsIntegration,
                content: l10n.kComingSoon,
                icon: Ionicons.log_in_outline,
                isPrimaryColor: false,
              ),
              InfoCard(
                title: l10n.kFirestoreIntegration,
                content: l10n.kComingSoon,
                icon: Ionicons.lock_open_outline,
                isPrimaryColor: true,
              ),
              InfoCard(
                title: l10n.kCrashReporting,
                content: l10n.kCrashReportingDesc,
                icon: Ionicons.code_working_outline,
                isPrimaryColor: true,
              ),
              InfoCard(
                title: l10n.kLogging,
                content: l10n.kLoggingDesc,
                icon: Ionicons.bug_outline,
                isPrimaryColor: false,
              ),
            ],
          ),

          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
