import 'package:flutter/material.dart';
import 'package:flutter_arhitect/extensions/global_key_extension.dart';
import 'package:flutter_arhitect/models/element_pair.dart';
import 'package:flutter_arhitect/widgets/element_widget.dart';

import 'painters/elements_connections_painter.dart';

GlobalKey widget1Key = GlobalKey();
GlobalKey widget2Key = GlobalKey();
GlobalKey widget3Key = GlobalKey();
GlobalKey widget4Key = GlobalKey();

class ConnectWidgets extends StatefulWidget {
  const ConnectWidgets({super.key});

  @override
  _ConnectWidgetsState createState() => _ConnectWidgetsState();
}

class _ConnectWidgetsState extends State<ConnectWidgets> {
  var dist = 1.0;

  void updateDist(double num) {
    setState(() {
      dist = num;
      pairs = [
        ElementPair(
          WidgetScreenData(widget1Key.getPosition(), widget1Key.getSize()),
          WidgetScreenData(widget2Key.getPosition(), widget2Key.getSize()),
        ),
        ElementPair(
          WidgetScreenData(widget3Key.getPosition(), widget3Key.getSize()),
          WidgetScreenData(widget4Key.getPosition(), widget4Key.getSize()),
        ),
      ];
    });
  }

  var pairs = [
    ElementPair(
      WidgetScreenData(widget1Key.getPosition(), widget1Key.getSize()),
      WidgetScreenData(widget2Key.getPosition(), widget2Key.getSize()),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Stack(
        children: [
          SingleChildScrollView(
            child: CustomPaint(
              painter: ElementsConnectionsPainter(
                pairs: pairs,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: ElementWidget(),
                      ),
                      SizedBox(
                        height: 200 * dist,
                      ),
                      Center(
                        child: ElementWidget(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          key: widget3Key,
                          height: 50,
                          width: 50,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 200 * dist,
                      ),
                      Center(
                        child: Transform.translate(
                          offset: const Offset(
                            60,
                            100,
                          ),
                          child: Container(
                            key: widget4Key,
                            height: 50,
                            width: 100,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 40,
            bottom: 100,
            child: Slider(
              value: dist,
              max: 10,
              min: 1,
              onChanged: updateDist,
            ),
          )
          // Column(
          //   children: [
          //     WithList(
          //       title: 'TITLE',
          //       tempKey: widget1Key,
          //       onUpdate: () {
          //         setState(() {});
          //       },
          //     ),
          //     const SizedBox(
          //       height: 200,
          //     ),
          //     WithList(
          //       title: 'SECOND',
          //       tempKey: widget2Key,
          //       onUpdate: () {
          //         setState(() {});
          //       },
          //     ),
          //     WithList(
          //       title: 'SECOND',
          //       tempKey: widget2Key,
          //       onUpdate: () {
          //         setState(() {});
          //       },
          //     ),
          //     WithList(
          //       title: 'SECOND',
          //       tempKey: widget2Key,
          //       onUpdate: () {
          //         setState(() {});
          //       },
          //     ),
          //   ],
          // ),
          // PositionedDraggableIcon(
          //   top: 100,
          //   left: 400,
          //   key: widget1Key,
          //   onChange: () {
          //     setState(() {});
          //   },
          // ),
          // PositionedDraggableIcon(
          //   top: 400,
          //   left: 400,
          //   key: widget2Key,
          //   onChange: () {
          //     setState(() {});
          //   },
          // ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Expanded(
          //       child: Center(
          //         child: Container(
          //           key: widget1Key,
          //           height: 50,
          //           width: 50,
          //           color: Colors.blue,
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: Center(
          //         child: Transform.translate(
          //           offset: const Offset(
          //             60,
          //             100,
          //           ),
          //           child: Container(
          //             key: widget2Key,
          //             height: 50,
          //             width: 100,
          //             color: Colors.green,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
