import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/arhitecture_layer.dart';
import 'package:flutter_arhitect/common/models/template.dart';
import 'package:flutter_arhitect/domain/common/request_notifier/request_notifier.dart';
import 'package:flutter_arhitect/domain/common/request_notifier/request_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

typedef AllTemplates = List<Template>;

final allTemplatesNotifier =
    StateNotifierProvider<AllTemplatesNotifier, RequestState<AllTemplates>>(
        (ref) {
  return AllTemplatesNotifier();
});

class AllTemplatesNotifier extends RequestNotifier<AllTemplates> {
  AllTemplatesNotifier() : super() {
    getAllTemplates();
  }

  final mockedTemplates = [
    Template(
      id: const Uuid().v1(),
      layer: ArhitectureLayer.data,
      name: 'Repository',
      brickBundleName: 'clean_repository',
    ),
    Template(
      id: const Uuid().v1(),
      layer: ArhitectureLayer.data,
      name: 'Service',
      brickBundleName: 'clean_service',
    ),
    Template(
      id: const Uuid().v1(),
      layer: ArhitectureLayer.data,
      name: 'Provider',
      brickBundleName: 'provider',
    ),
    Template(
      id: const Uuid().v1(),
      layer: ArhitectureLayer.data,
      name: 'StateProvider',
      brickBundleName: 'state_provider',
    ),
    Template(
      id: const Uuid().v1(),
      layer: ArhitectureLayer.data,
      name: 'Notifier',
      brickBundleName: 'notifier',
    ),
    Template(
      id: const Uuid().v1(),
      layer: ArhitectureLayer.data,
      name: 'Page',
      brickBundleName: 'page',
    ),
  ];

  void getAllTemplates() async => executeRequest(
        requestBuilder: () async {
          await Future.delayed(const Duration(milliseconds: 400));

          return mockedTemplates;
        },
      );

  void addTemplate({required Template template}) async => executeRequest(
        requestBuilder: () async {
          await Future.delayed(const Duration(milliseconds: 400));

          return [...mockedTemplates, template];
        },
      );

  void removeTemplate({required Template template}) async => executeRequest(
        requestBuilder: () async {
          await Future.delayed(const Duration(milliseconds: 400));

          return [...mockedTemplates, template];
        },
      );
}
