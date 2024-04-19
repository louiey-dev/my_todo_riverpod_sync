import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_riverpod_sync/pages/providers/theme/theme_provider.dart';

class TodoHeader extends ConsumerWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              "TODO",
              style: TextStyle(fontSize: 36),
            ),
            const SizedBox(width: 10),
            Text(
              "(1/4)",
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue[900],
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            ref.read(themeProvider.notifier).toggleTheme();
          },
          icon: const Icon(Icons.light_mode),
        ),
      ],
    );
  }
}
