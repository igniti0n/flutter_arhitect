import 'package:flutter/material.dart';
import 'package:flutter_arhitect/domain/selected_widgets_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ElementWidget extends ConsumerWidget {
  final thisWidgetGlobalKey = GlobalKey();
  ElementWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref
          .read(selectedWidgetsNotifier.notifier)
          .selectWidget(thisWidgetGlobalKey),
      child: Container(
        key: thisWidgetGlobalKey,
        height: 50,
        width: 100,
        color: Colors.green,
      ),
    );
  }
}
