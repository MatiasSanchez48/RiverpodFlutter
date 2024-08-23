import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/l10n/l10n.dart';
import 'package:riverpod_tutorial/screens/screens.dart';

/// {@template App}
/// App widget for app view and MaterialApp.
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro App}
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const MainMenu(),
      ),
    );
  }
}
