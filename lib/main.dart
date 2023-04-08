import 'package:flutter/material.dart';
import 'package:flutter_arhitect/connect_widgets.dart';
import 'package:flutter_arhitect/domain/mouse_position_state_provider.dart';
import 'package:flutter_arhitect/domain/selected_widgets_notifier.dart';
import 'package:flutter_arhitect/domain/user_connecting_positions_provider.dart';
import 'package:flutter_arhitect/presentation/painters/user_connecting_line_painter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const projectName = 'starter';
const featureName = 'login';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const _Screen(),
      ),
    );
  }
}

class _Screen extends ConsumerWidget {
  const _Screen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userConnectingLinePoints = ref.watch(userConnectingPositionsProvider);

    return MouseRegion(
      onHover: (event) =>
          ref.read(mousePositionStateProvider.notifier).state = event.position,
      child: CustomPaint(
        foregroundPainter: UserConnectingLinePainter(
          startPoint: userConnectingLinePoints.first,
          endPoint: userConnectingLinePoints.second,
        ),
        child: GestureDetector(
          onTap: () => ref.read(selectedWidgetsNotifier.notifier).reset(),
          child: const ConnectWidgets(),
        ),
      ),
    );
  }
}
