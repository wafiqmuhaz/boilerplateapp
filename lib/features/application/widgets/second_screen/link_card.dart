// ignore_for_file: always_put_required_named_parameters_first, avoid_redundant_argument_values, lines_longer_than_80_chars

import 'package:boilerplateapp/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkCard extends StatelessWidget {
  const LinkCard({
    super.key,
    required this.title,
    required this.icon,
    required this.url,
  });

  final String title;
  final IconData icon;
  final Uri url;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
        onTap: _launchUrl,
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
            Icon(icon, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 16),
            Text(
              l10n.kGithub_card_title,
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

  /// Example: Use the url_launcher package to open the browser
  Future<bool> _launchUrl() async => await canLaunchUrl(url)
      ? await launchUrl(
          url,
          mode: LaunchMode.inAppWebView, //inAppWebView,
          webViewConfiguration:
              const WebViewConfiguration(enableJavaScript: true),
        )
      : throw Exception('Could not launch $url');
}
