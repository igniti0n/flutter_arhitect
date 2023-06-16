import 'dart:ui';

import 'package:hive/hive.dart';

part 'offset_storage.g.dart';

@HiveType(typeId: 7)
class OffsetStorage extends HiveObject {
  @HiveField(0)
  final double xOffset;
  @HiveField(1)
  final double yOffset;

  OffsetStorage({
    required this.xOffset,
    required this.yOffset,
  });

  factory OffsetStorage.fromOffset(
    Offset layer,
  ) =>
      OffsetStorage(
        xOffset: layer.dx,
        yOffset: layer.dy,
      );

  Offset toOffset() => Offset(xOffset, yOffset);
}
