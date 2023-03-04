import 'package:flutter/material.dart';
import 'package:flutter_arhitect/domain/mouse_position_state_provider.dart';
import 'package:flutter_arhitect/domain/user_connecting_positions_provider.dart';
import 'package:flutter_arhitect/painters/connecting_painter.dart';
import 'package:flutter_arhitect/scale_update_details_state_provider.dart';
import 'package:flutter_arhitect/temp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            //const ChooseWidgetsToConnect(),

            const _Screen(),

        // const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class _Screen extends ConsumerWidget {
  const _Screen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userConnectingLinePoints = ref.watch(userConnectingPositionsProvider);

    // log('Changed positions ${userConnectingLinePoints.first} : ${userConnectingLinePoints.second} ');

    return MouseRegion(
      onHover: (event) =>
          ref.read(mousePositionStateProvider.notifier).state = event.position,
      child: CustomPaint(
        foregroundPainter: UserConnectingLinePainter(
          startPoint: userConnectingLinePoints.first,
          endPoint: userConnectingLinePoints.second,
        ),
        child: const ConnectWidgets(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _Viewer(counter: _counter),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _Viewer extends ConsumerWidget {
  const _Viewer({
    required int counter,
  }) : _counter = counter;

  final int _counter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InteractiveViewer(
      minScale: 0.4,
      maxScale: 2.8,
      onInteractionUpdate: (scaleUpdateDetails) => ref
          .read(scaleUpdateDetailsStateProvider.notifier)
          .state = scaleUpdateDetails,
      constrained: false,
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 4000,
                  height: 600,
                  color: Colors.red,
                ),
                Container(
                  width: 1000,
                  height: 800,
                  color: Colors.blue,
                ),
                Draggable(
                  childWhenDragging: Container(),
                  feedback: Container(
                    width: 200,
                    height: 200,
                    color: Colors.green[900],
                  ),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.green[900],
                  ),
                ),
                Container(
                  width: 1000,
                  height: 600,
                  color: Colors.green[900],
                ),
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          // const PositionedDraggableIcon(
          //   top: 100,
          //   left: 100,
          // ),
        ],
      ),
    );
  }
}
