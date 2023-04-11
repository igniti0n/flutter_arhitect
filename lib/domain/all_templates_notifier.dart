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
  (ref) => AllTemplatesNotifier(),
);

class AllTemplatesNotifier extends RequestNotifier<AllTemplates> {
  final mockedTemplates = [
    Template(
      id: const Uuid().v1(),
      layer: ArhitectureLayer.data,
      name: 'Repository',
      brick: Brick.git(const GitPath(
        'https://github.com/igniti0n/bricks',
        path: 'clean_repository',
      )),
    ),
    Template(
      id: const Uuid().v1(),
      layer: ArhitectureLayer.data,
      name: 'Service',
      brick: Brick.git(const GitPath(
        'https://github.com/igniti0n/bricks',
        path: 'clean_service',
      )),
    ),
    Template(
      id: const Uuid().v1(),
      layer: ArhitectureLayer.data,
      name: 'Provider',
      brick: Brick.git(const GitPath(
        'https://github.com/igniti0n/bricks',
        path: 'provider',
      )),
    ),
    Template(
      id: const Uuid().v1(),
      layer: ArhitectureLayer.data,
      name: 'StateProvider',
      brick: Brick.git(const GitPath(
        'https://github.com/igniti0n/bricks',
        path: 'state_provider',
      )),
    ),
    Template(
      id: const Uuid().v1(),
      layer: ArhitectureLayer.data,
      name: 'Notifier',
      brick: Brick.git(const GitPath(
        'https://github.com/igniti0n/bricks',
        path: 'notifier',
      )),
    ),
    Template(
      id: const Uuid().v1(),
      layer: ArhitectureLayer.data,
      name: 'Page',
      brick: Brick.git(
        const GitPath('https://github.com/igniti0n/bricks', path: 'page'),
      ),
    ),
  ];

  AllTemplatesNotifier() : super() {
    getAllTemplates();
  }

  Future<void> getAllTemplates() async => executeRequest(
        requestBuilder: () async {
          await Future.delayed(const Duration(milliseconds: 400));

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
