// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'config_state.dart';

class ConfigCubit extends Cubit<ConfigState> {
  ConfigCubit() : super(const ConfigState());

  void changeLanguage(Locale locale) {
    emit(state.copyWith(currentLocale: locale));
  }
}
