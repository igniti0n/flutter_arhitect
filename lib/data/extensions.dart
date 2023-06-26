import 'dart:ui';

import 'package:mason/mason.dart';

extension OffsetMapping on Offset {
  Map<String, dynamic> toMap() {
    return {
      'dx': dx,
      'dy': dy,
    };
  }

  static Offset fromMap(Map<String, dynamic> map) {
    return Offset(
      map['dx'],
      map['dy'],
    );
  }
}

extension SizeMapping on Size {
  Map<String, dynamic> toMap() {
    return {
      'width': width,
      'height': height,
    };
  }

  static Size fromMap(Map<String, dynamic> map) {
    return Size(
      map['width'],
      map['height'],
    );
  }
}

extension GitPathMapping on GitPath {
  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'path': path,
      'ref': ref,
    };
  }

  static GitPath fromMap(Map<String, dynamic> map) {
    return GitPath(
      map['url'],
      path: map['path'],
      ref: map['ref'],
    );
  }
}

extension BrickLocationMapping on BrickLocation {
  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'git': git?.toMap(),
      'version': version,
    };
  }

  static BrickLocation fromMap(Map<String, dynamic> map) {
    return BrickLocation(
      path: map['path'],
      git: GitPathMapping.fromMap(map['git']),
      version: map['version'],
    );
  }
}

extension BrickMapping on Brick {
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location.toMap(),
    };
  }

  static Brick fromMap(Map<String, dynamic> map) {
    return Brick(
      name: map['name'],
      location: BrickLocationMapping.fromMap(map['location']),
    );
  }
}
