part of 'config_cubit.dart';

// @immutable
// abstract class ConfigState {}

// class AppbarConfigInitial extends ConfigState {}
class ConfigState {
  const ConfigState({
    this.currentLocale = const Locale('en'),
  });
  final Locale currentLocale;

  ConfigState copyWith({
    Locale? currentLocale,
  }) {
    return ConfigState(
      currentLocale: currentLocale ?? this.currentLocale,
    );
  }
}
