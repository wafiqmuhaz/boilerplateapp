// ignore_for_file: always_put_required_named_parameters_first, unused_local_variable, omit_local_variable_types, lines_longer_than_80_chars

import 'package:boilerplateapp/l10n/l10n.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
    required this.isPrimaryColor,
  });

  final String title;
  final String content;
  final IconData icon;
  final bool isPrimaryColor;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final TextTheme textTheme = isPrimaryColor
        ? Theme.of(context).primaryTextTheme
        : Theme.of(context).textTheme;
    return Card(
      elevation: 2,
      shadowColor: Theme.of(context).colorScheme.shadow,
      color: isPrimaryColor
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            12,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title, //l10n.kLocalization_title,
              style: textTheme.titleLarge!.apply(fontWeightDelta: 2),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Text(
              content, //l10n.kLocalization_content,
              style: textTheme.bodyMedium,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Icon(
              icon,
              size: 32,
              color: textTheme.bodyMedium!.color,
            ),
          ],
        ),
      ),
    );
  }
}
