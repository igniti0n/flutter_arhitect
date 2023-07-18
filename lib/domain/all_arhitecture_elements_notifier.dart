import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/arhitecture_layer.dart';
import 'package:flutter_arhitect/common/models/template.dart';
import 'package:flutter_arhitect/data/database_models/feature_storage.dart';
import 'package:flutter_arhitect/data/services/file_service.dart';
import 'package:flutter_arhitect/domain/features_selection/selected_feature_tab_provider.dart';
import 'package:flutter_arhitect/forms/architecture_element_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef AllArhitectureElements = List<BaseArhitectureElement>;

final allArhitectureElementsNotifier = StateNotifierProvider<
    AllArhitectureElementsNotifier, AllArhitectureElements>(
  (ref) => AllArhitectureElementsNotifier(
    ref.watch(architectureElementMapperProvider),
    ref.watch(fileServiceProvider),
    ref.watch(selectedFeatureTabProviderProvider),
  ),
);

class AllArhitectureElementsNotifier
    extends StateNotifier<AllArhitectureElements> {
  final ArchitectureElementMapper<BaseArhitectureElement>
      _architectureElementMapper;
  final FileService _fileService;
  final String _selectedFeatureTab;

  AllArhitectureElementsNotifier(
    this._architectureElementMapper,
    this._fileService,
    this._selectedFeatureTab,
  ) : super([]) {
    _getDataFromDatabaseForCurrentlySelectedFeature();
    // Refres the state after the keys are assignes to the widgets
    Future.delayed(const Duration(milliseconds: 100), () {
      if (!mounted) {
        return;
      }
      state = [...state];
    });
  }

  Future<void> saveCurrentStateToDatabase() async {
    final featuresStorage = FeatureStorage(
      elements: state,
      addedAt: DateTime.now(),
    );
    await _fileService.writeData(
      _selectedFeatureTab,
      featuresStorage.toMap(),
    );
  }

  void addArhitectureElementFromTemplate(Template template) {
    final arhitectureElement = template.generateArhitectureElement();

    final randomNumber = math.Random().nextInt(100);
    arhitectureElement.copyWith(name: randomNumber.toString());

    state = [...state, arhitectureElement];
    saveCurrentStateToDatabase();
  }

  void removeArhitectureElement(BaseArhitectureElement arhitectureElement) {
    var newState = [...state]..removeWhere(
        (element) => element.id == arhitectureElement.id,
      );
    for (final currentElement in newState) {
      if (currentElement.dependencies
              .indexWhere((element) => element.id == arhitectureElement.id) >
          -1) {
        newState = newState
            .map(
              (element) => element.id == currentElement.id
                  ? element.copyWith(
                      dependencies: [...element.dependencies]..removeWhere(
                          (element) => element.id == arhitectureElement.id,
                        ),
                    )
                  : element,
            )
            .toList();
      }
    }
    state = newState;
    saveCurrentStateToDatabase();
  }

  void addDependencyToArhitectureElement({
    required BaseArhitectureElement arhitectureElement,
    required BaseArhitectureElement dependency,
  }) {
    if (arhitectureElement == dependency ||
        !arhitectureElement.layer.canConnectWithLayer(dependency.layer)) {
      return;
    }
    if (arhitectureElement.dependencies
        .any((element) => element.id == dependency.id)) {
      return;
    }
    if (dependency.dependencies
        .any((element) => element.id == arhitectureElement.id)) {
      return;
    }
    state = state.map(
      (element) {
        if (element.id != arhitectureElement.id) {
          return element;
        }
        if (element.dependencies.contains(dependency)) {
          return element;
        }
        return element.copyWith(
          dependencies: [...element.dependencies, dependency],
        );
      },
    ).toList();
    saveCurrentStateToDatabase();
  }

  void removeDependencyFromArhitectureElement({
    required BaseArhitectureElement arhitectureElement,
    required BaseArhitectureElement dependency,
  }) {
    // log('Removing dependency ${dependency.name} from arhitecture element: ${arhitectureElement.name}');
    // state = state
    //     .map(
    //       (element) => element.id == arhitectureElement.id
    //           ? element.copyWith(
    //               dependencies: [...element.dependencies]..removeWhere(
    //                   (element) => element.id == dependency.id,
    //                 ),
    //             )
    //           : element,
    //     )
    //     .toList();
    state = state.map(
      (element) {
        if (element.id == arhitectureElement.id) {
          return element.copyWith(
            dependencies: [...element.dependencies]..removeWhere(
                (element) => element.id == dependency.id,
              ),
          );
        } else if (element.id == dependency.id) {
          return element.copyWith(
            dependencies: [...element.dependencies]..removeWhere(
                (element) => element.id == arhitectureElement.id,
              ),
          );
        }
        return element;
      },
    ).toList();
    saveCurrentStateToDatabase();
  }

  void updateArhitectureElementCanvasPosition(
    BaseArhitectureElement arhitectureElement,
  ) {
    // log('Updating arhitecture element: ${arhitectureElement.name}');
    state = state
        .map(
          (element) => element.id == arhitectureElement.id
              ? arhitectureElement
              : element,
        )
        .toList();
    saveCurrentStateToDatabase();
  }

  void onFormSubmitted({
    required BaseArhitectureElement arhitectureElement,
    required Map<String, dynamic> formMap,
  }) {
    final updatedArchitectureElement =
        _architectureElementMapper(arhitectureElement, formMap);

    var newState = state
        .map(
          (element) => element.id == arhitectureElement.id
              ? updatedArchitectureElement
              : element,
        )
        .toList();
    for (final currentElement in newState) {
      if (currentElement.dependencies
              .indexWhere((element) => element.id == arhitectureElement.id) >
          -1) {
        newState = newState.map(
          (element) {
            if (element.id != updatedArchitectureElement.id) {
              final index = element.dependencies.indexWhere(
                (element) => element.id == updatedArchitectureElement.id,
              );
              if (index > -1) {
                return element.copyWith(
                  dependencies: [...element.dependencies]
                    ..removeAt(index)
                    ..insert(index, updatedArchitectureElement),
                );
              }
            }
            return element;
          },
        ).toList();
      }
    }
    state = newState;
    saveCurrentStateToDatabase();
  }

  void reset() => state = [];

  Future<void> _getDataFromDatabaseForCurrentlySelectedFeature() async {
    log('Getting data from database for feature: $_selectedFeatureTab');
    final featuresStorage = await _fileService.readData(_selectedFeatureTab);
    log('Features storage: $featuresStorage');
    if (featuresStorage.isEmpty) {
      return;
    }
    final storage = FeatureStorage.fromMap(featuresStorage);
    state = storage.elements;
  }
}
