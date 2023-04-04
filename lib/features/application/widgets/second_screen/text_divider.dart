// ignore_for_file: always_put_required_named_parameters_first, unused_local_variable, lines_longer_than_80_chars

import 'package:boilerplateapp/l10n/l10n.dart';
import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              color: Theme.of(context).colorScheme.onBackground.withOpacity(.4),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Expanded(
            child: Divider(
              color: Theme.of(context).colorScheme.onBackground.withOpacity(.4),
            ),
          ),
        ],
      ),
    );
  }
}
