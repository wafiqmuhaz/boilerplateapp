// ignore_for_file: always_use_package_imports, use_super_parameters, inference_failure_on_instance_creation, lines_longer_than_80_chars

import 'package:another_flushbar/flushbar.dart';
import 'package:boilerplateapp/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_client/rest_client.dart';

import '../../../common/app_spacing.dart';
import '../../../injector/injector.dart';
import '../../application/bloc/application_bloc.dart';
import '../bloc/demo_bloc.dart';

class ImagesFromDbPage extends StatelessWidget {
  const ImagesFromDbPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DemoBloc>(
      create: (context) => Injector.instance<DemoBloc>()
        ..add(
          const DemoLoadImageFromDB(),
        ),
      child: const Scaffold(
        appBar: _AppBar(),
        body: _Body(),
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
      title: Text(l10n.image_from_db),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<DemoBloc, DemoState>(
        listenWhen: (prev, next) => prev.status != next.status,
        listener: (context, state) {
          state.notification?.when(
            insertSuccess: (message) {
              Flushbar(
                message: state.successMsg,
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.green,
              ).show(context);
            },
            insertFailed: (message) {
              Flushbar(
                message: state.errorMsg,
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.red,
              ).show(context);
            },
          );
        },
        builder: (context, state) {
          if (state.status == UIStatus.loading || state.isBusy) {
            return const CircularProgressIndicator();
          } else {
            return _buildImages(state.images);
          }
        },
      ),
    );
  }

  Widget _buildImages(List<DogImage> images) {
    return ListView.separated(
      itemBuilder: (context, index) => Stack(
        children: [
          Image.network(images[index].message),
          Positioned(
            child: InkWell(
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onTap: () {
                context
                    .read<DemoBloc>()
                    .add(DemoDeleteImageFromDB(images[index].message));
              },
            ),
          )
        ],
      ),
      separatorBuilder: (context, index) => AppSpacing.verticalSpacing6,
      itemCount: images.length,
    );
  }
}
