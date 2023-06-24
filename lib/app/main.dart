import 'package:flutter/material.dart';
import 'package:flutter_arhitect/app/hive_init.dart';
import 'package:flutter_arhitect/connect_widgets.dart';
import 'package:flutter_arhitect/domain/global_info_provider.dart';
import 'package:flutter_arhitect/domain/global_loading_provider.dart';
import 'package:flutter_arhitect/domain/mouse_position_state_provider.dart';
import 'package:flutter_arhitect/domain/selected_widgets_notifier.dart';
import 'package:flutter_arhitect/domain/user_connecting_positions_provider.dart';
import 'package:flutter_arhitect/domain/utils/toast.dart';
import 'package:flutter_arhitect/presentation/painters/user_connecting_line_painter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const projectName = 'starter';

void main() async {
  await hiveInit();
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
    ref.globalInfoListener();
    final userConnectingLinePoints = ref.watch(userConnectingPositionsProvider);
    final showLoading = ref.watch(globalLoadingProvider);
    return Stack(
      children: [
        MouseRegion(
          onHover: (event) => ref
              .read(mousePositionStateProvider.notifier)
              .state = event.position,
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
        ),
        if (showLoading)
          Container(
            color: Colors.black.withOpacity(0.5),
            height: double.infinity,
            width: double.infinity,
            child: const Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }
}

extension _WidgetRefExtensions on WidgetRef {
  void globalInfoListener() {
    listen<GlobalInfo?>(globalInfoProvider, (_, globalInfo) {
      if (globalInfo == null) return;
      Toast().show(
        context: context,
        message: globalInfo.message,
        isError: globalInfo.isError,
      );
    });
  }
}
