import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pages/providers/theme/theme_provider.dart';
import 'pages/todos_page.dart';

const double screenX = 600.0;
const double screenY = 700.0;

Future<void> main() async {
  if (Platform.isWindows | Platform.isLinux | Platform.isMacOS) {
    WidgetsFlutterBinding.ensureInitialized();
    await DesktopWindow.setWindowSize(
        const Size(screenX, screenY)); // 가로 사이즈, 세로 사이즈 기본 사이즈 부여
    await DesktopWindow.setMinWindowSize(
        const Size(screenX, screenY)); // 최소 사이즈 부여
    await DesktopWindow.setMaxWindowSize(
        const Size(screenX, screenY)); // 최대 사이즈 부여
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);

    return MaterialApp(
      title: 'Todos',
      debugShowCheckedModeBanner: false,
      theme: currentTheme == AppTheme.light
          ? ThemeData.light(useMaterial3: true)
          : ThemeData.dark(useMaterial3: true),
      home: const TodosPage(),
    );
  }
}
