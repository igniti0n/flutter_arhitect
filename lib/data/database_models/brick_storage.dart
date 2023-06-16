import 'package:hive/hive.dart';
import 'package:mason/mason.dart';

part 'brick_storage.g.dart';

@HiveType(typeId: 5)
class BrickStorage extends HiveObject {
  /// The name of the brick.
  @HiveField(0)
  final String? name;

  /// The local brick template path.
  @HiveField(1)
  final String? path;

  /// Git brick template path.
  @HiveField(2)
  final GitPathStorage? git;

  /// Brick version constraint.
  @HiveField(3)
  final String? version;

  BrickStorage({
    required this.name,
    required this.path,
    required this.git,
    required this.version,
  });

  factory BrickStorage.fromBrick(Brick brick) => BrickStorage(
        name: brick.name,
        path: brick.location.path,
        git: GitPathStorage.fromGitPath(brick.location.git),
        version: brick.location.version,
      );

  Brick toBrick() => Brick(
        name: name,
        location: BrickLocation(
          git: git?.toGitPath(),
          path: path,
          version: version,
        ),
      );
}

@HiveType(typeId: 8)
class GitPathStorage {
  const GitPathStorage(this.url, {String? path, this.ref}) : path = path ?? '';
  @HiveField(0)
  final String url;
  @HiveField(1)
  final String path;
  @HiveField(2)
  final String? ref;

  GitPath toGitPath() => GitPath(
        url,
        path: path,
        ref: ref,
      );

  static GitPathStorage? fromGitPath(GitPath? gitPath) => gitPath == null
      ? null
      : GitPathStorage(
          gitPath.url,
          path: gitPath.path,
          ref: gitPath.ref,
        );
}
