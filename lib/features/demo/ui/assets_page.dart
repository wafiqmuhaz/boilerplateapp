// ignore_for_file: always_use_package_imports, use_super_parameters

import 'package:boilerplateapp/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../../../common/app_dimens.dart';
import '../../../common/app_spacing.dart';
import '../../../generated/assets.gen.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.assets),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimens.basePadding),
        child: Column(
          children: [
            const Text('svg'),
            AppSpacing.verticalSpacing24,
            Assets.icons.iconAstronomy.svg(),
            AppSpacing.verticalSpacing24,
            const Text('png'),
            Assets.images.imageDog.image(),
            AppSpacing.verticalSpacing24,
          ],
        ),
      ),
    );
  }
}
