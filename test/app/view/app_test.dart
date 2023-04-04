// ignore_for_file: lines_longer_than_80_chars
// import 'package:boilerplateapp/app/app.dart';
// import 'package:boilerplateapp/common/app_themes.dart';
// import 'package:boilerplateapp/features/application/bloc/application_bloc.dart';
// import 'package:boilerplateapp/features/application/cubit/bottom_nav_cubit.dart';
// import 'package:boilerplateapp/lang/lang.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group('App tests', () {
//     testWidgets('App contains MultiBlocProvider', (WidgetTester tester) async {
//       await tester.pumpWidget(App());

//       expect(find.byType(MultiBlocProvider), findsOneWidget);
//     });

//     testWidgets('App contains ApplicationBloc', (WidgetTester tester) async {
//       await tester.pumpWidget(App());

//       expect(find.byType(ApplicationBloc), findsOneWidget);
//     });

//     testWidgets('App contains ConfigCubit', (WidgetTester tester) async {
//       await tester.pumpWidget(App());

//       expect(find.byType(ConfigCubit), findsOneWidget);
//     });

//     testWidgets('App contains BottomNavCubit', (WidgetTester tester) async {
//       await tester.pumpWidget(App());

//       expect(find.byType(BottomNavCubit), findsOneWidget);
//     });

//     testWidgets('App displays MaterialApp.router', (WidgetTester tester) async {
//       await tester.pumpWidget(App());

//       expect(find.byType(MaterialApp), findsOneWidget);
//     });

//     testWidgets('AppThemes are set correctly', (WidgetTester tester) async {
//       await tester.pumpWidget(const App());

//       // Test light theme
//       final lightTheme = AppThemes.lightTheme;
//       expect(lightTheme.primaryColor, Colors.blue);

//       // Set dark mode state
//     });
//   });
// }
