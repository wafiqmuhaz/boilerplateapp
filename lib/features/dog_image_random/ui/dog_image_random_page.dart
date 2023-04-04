// ignore_for_file: always_use_package_imports, use_super_parameters, inference_failure_on_instance_creation, lines_longer_than_80_chars

import 'package:another_flushbar/flushbar.dart';
import 'package:boilerplateapp/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/app_dimens.dart';
import '../../../common/app_spacing.dart';
import '../../../injector/injector.dart';
import '../../application/bloc/application_bloc.dart';
import '../bloc/dog_image_random_bloc.dart';

class DogImageRandomPage extends StatelessWidget {
  const DogImageRandomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DogImageRandomBloc>(
      create: (context) => Injector.instance<DogImageRandomBloc>()
        ..add(
          const DogImageRandomLoaded(),
        ),
      child: Scaffold(
        appBar: const _AppBar(),
        body: _Body(),
        bottomNavigationBar: const _ButtonBar(),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppBar(
      title: Text(l10n.dog_image_random),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<DogImageRandomBloc, DogImageRandomState>(
        listenWhen: (prev, next) => prev.notification != next.notification,
        listener: (context, state) {
          state.notification?.when(
            notifySuccess: (message) {
              Flushbar(
                message: state.errorMsg,
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.red,
              ).show(context);
            },
            notifyFailed: (message) {
              Flushbar(
                message: state.successMsg,
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.green,
              ).show(context);
            },
          );
        },
        builder: (context, state) {
          final l10n = context.l10n;
          if (state.status == UIStatus.initial) {
            return Text(l10n.press_button);
          } else if (state.status == UIStatus.loading) {
            return const CircularProgressIndicator();
          } else if (state.status == UIStatus.loadFailed) {
            return Text(l10n.load_failed);
          }

          return Image.network(state.dogImage.message);
        },
      ),
    );
  }
}

class _ButtonBar extends StatelessWidget {
  const _ButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.basePadding,
          vertical: AppDimens.basePadding,
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                child: Text(l10n.load_image),
                onPressed: () {
                  context
                      .read<DogImageRandomBloc>()
                      .add(const DogImageRandomRandomRequested());
                },
              ),
            ),
            AppSpacing.horizontalSpacing16,
            Expanded(
              child: ElevatedButton(
                child: Text(l10n.load_and_insert_db),
                onPressed: () {
                  context
                      .read<DogImageRandomBloc>()
                      .add(const DogImageRandomRandomRequested(insertDb: true));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
