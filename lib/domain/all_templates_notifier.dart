import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/arhitecture_layer.dart';
import 'package:flutter_arhitect/common/models/template.dart';
import 'package:flutter_arhitect/domain/common/request_notifier/request_notifier.dart';
import 'package:flutter_arhitect/domain/common/request_notifier/request_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mason/mason.dart';
import 'package:uuid/uuid.dart';

typedef AllTemplates = List<Template>;

final allTemplatesNotifier =
    StateNotifierProvider<AllTemplatesNotifier, RequestState<AllTemplates>>(
  (ref) => AllTemplatesNotifier(ref),
);

class AllTemplatesNotifier extends RequestNotifier<AllTemplates> {
  static const gitUrl = 'https://github.com/igniti0n/bricks';

  final mockedTemplates = [
    Template(
      id: const Uuid().v1(),
      layer: ArhitectureLayer.data,
      name: 'Repository',
      brick: Brick.git(const GitPath(
        gitUrl,
        path: 'clean_repository',
      )),
    ),
    Template(
      id: const Uuid().v1(),
      layer: ArhitectureLayer.data,
      name: 'Service',
      brick: Brick.git(const GitPath(
        gitUrl,
        path: 'clean_service',
      )),
    ),
    Template(
      id: const Uuid().v1(),
      layer: ArhitectureLayer.domain,
      name: 'Notifier',
      brick: Brick.git(const GitPath(
        gitUrl,
        path: 'notifier',
      )),
    ),
    Template(
      id: const Uuid().v1(),
      layer: ArhitectureLayer.domain,
      name: 'Provider',
      brick: Brick.git(const GitPath(
        gitUrl,
        path: 'provider',
      )),
    ),
    Template(
      id: const Uuid().v1(),
      layer: ArhitectureLayer.domain,
      name: 'StateProvider',
      brick: Brick.git(const GitPath(
        gitUrl,
        path: 'state_provider',
      )),
    ),
    Template(
      id: const Uuid().v1(),
      layer: ArhitectureLayer.domain,
      name: 'RequestProvider',
      brick: Brick.git(const GitPath(
        gitUrl,
        path: 'request_provider',
      )),
    ),
    Template(
      id: const Uuid().v1(),
      layer: ArhitectureLayer.presentation,
      name: 'Page',
      brick: Brick.git(
        const GitPath(
          gitUrl,
          path: 'page',
        ),
      ),
    ),
    // Template(
    //   id: const Uuid().v1(),
    //   layer: ArhitectureLayer.data,
    //   name: 'Repository',
    //   brick: Brick.git(const GitPath(
    //     'https://github.com/Q-Agency/QBricks',
    //     path: 'bricks/repository',
    //   )),
    // ),
    // Template(
    //   id: const Uuid().v1(),
    //   layer: ArhitectureLayer.data,
    //   name: 'Service',
    //   brick: Brick.git(const GitPath(
    //     'https://github.com/Q-Agency/QBricks',
    //     path: 'bricks/service',
    //   )),
    // ),
    // Template(
    //   id: const Uuid().v1(),
    //   layer: ArhitectureLayer.domain,
    //   name: 'BaseStateNotifier',
    //   brick: Brick.git(const GitPath(
    //     'https://github.com/Q-Agency/QBricks',
    //     path: 'bricks/notifier',
    //   )),
    // ),
    // Template(
    //   id: const Uuid().v1(),
    //   layer: ArhitectureLayer.domain,
    //   name: 'SimpleStateNotifier',
    //   brick: Brick.git(const GitPath(
    //     'https://github.com/Q-Agency/QBricks',
    //     path: 'bricks/simple_state_notifier',
    //   )),
    // ),
    // Template(
    //   id: const Uuid().v1(),
    //   layer: ArhitectureLayer.presentation,
    //   name: 'Page',
    //   brick: Brick.git(
    //     const GitPath(
    //       'https://github.com/Q-Agency/QBricks',
    //       path: 'bricks/page',
    //     ),
    //   ),
    // ),
  ];

  AllTemplatesNotifier(Ref ref) : super(ref) {
    getAllTemplates();
  }

  Future<void> getAllTemplates() async => executeRequest(
        globalLoading: false,
        requestBuilder: () async {
          return mockedTemplates;
        },
      );

  Future<void> addTemplate({required Template template}) async =>
      executeRequest(
        requestBuilder: () async {
          await Future.delayed(const Duration(milliseconds: 400));

          return [...mockedTemplates, template];
        },
      );

  Future<void> removeTemplate({required Template template}) async =>
      executeRequest(
        requestBuilder: () async {
          await Future.delayed(const Duration(milliseconds: 400));

          return [...mockedTemplates, template];
        },
      );
}
