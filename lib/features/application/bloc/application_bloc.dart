// ignore_for_file: omit_local_variable_types, avoid_dynamic_calls, always_use_package_imports, lines_longer_than_80_chars, unawaited_futures

import 'dart:async';

import 'package:boilerplateapp/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../services/local_storage_service/local_storage_service.dart';

part 'application_event.dart';
part 'application_state.dart';
part 'application_bloc.freezed.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc({
    required LocalStorageService localStorageService,
  }) : super(const ApplicationState()) {
    _localStorageService = localStorageService;
    on<ApplicationLoaded>(_onLoaded);
    on<ApplicationLocaleChanged>(_onLocaleChanged);
    on<ApplicationDarkModeChanged>(_onDarkModeChanged);
  }

  late LocalStorageService _localStorageService;

  FutureOr<void> _onLoaded(
    ApplicationLoaded event,
    Emitter<ApplicationState> emit,
  ) {
    emit(
      state.copyWith(
        status: UIStatus.loading,
      ),
    );

    final String locale = _localStorageService.locale;
    final bool isDarkMode = _localStorageService.isDarkMode;

    emit(
      state.copyWith(
        status: UIStatus.loadSuccess,
        locale: locale,
        isDarkMode: isDarkMode,
      ),
    );
  }

  FutureOr<void> _onLocaleChanged(
    ApplicationLocaleChanged event,
    Emitter<ApplicationState> emit,
  ) async {
    if (state.locale != event.locale) {
      emit(
        state.copyWith(
          status: UIStatus.loading,
        ),
      );
      await AppLocalizations.delegate.load(
        Locale(event.locale),
      );
      // S.load(Locale(event.locale),);

      _localStorageService.setLocale(event.locale);

      emit(
        state.copyWith(
          status: UIStatus.loadSuccess,
          locale: event.locale,
        ),
      );
    }
  }

  FutureOr<void> _onDarkModeChanged(
    ApplicationDarkModeChanged event,
    Emitter<ApplicationState> emit,
  ) async {
    if (state.isDarkMode != event.enable) {
      emit(
        state.copyWith(
          status: UIStatus.loading,
        ),
      );

      _localStorageService.setIsDarkMode(event.enable);

      emit(
        state.copyWith(
          status: UIStatus.loadSuccess,
          isDarkMode: event.enable,
        ),
      );
    }
  }
}
