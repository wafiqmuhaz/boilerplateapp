// ignore_for_file: always_put_required_named_parameters_first, unused_local_variable, lines_longer_than_80_chars

import 'package:boilerplateapp/l10n/l10n.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 2, right: 2, top: 48, bottom: 24),
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(fontWeightDelta: 2),
        ),
      ),
    );
  }
}
