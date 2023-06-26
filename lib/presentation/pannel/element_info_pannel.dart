import 'package:flutter/material.dart';
import 'package:flutter_arhitect/presentation/pannel/pannel_body.dart';
import 'package:flutter_arhitect/presentation/pannel/pannel_pully.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ElementInfoPannel extends HookConsumerWidget {
  const ElementInfoPannel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxPannelWidth = MediaQuery.of(context).size.width * 0.5;
    return SizedBox(
      width: maxPannelWidth,
      child: Stack(
        children: const [
          PannelBody(),
          PannelPully(),
        ],
      ),
    );
  }
}
