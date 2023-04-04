import 'package:boilerplateapp/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Center(child: Text(l10n.didnt_supported)),
    );
  }
}
