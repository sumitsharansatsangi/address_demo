// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 6424016787600695430),
      name: 'Location',
      lastPropertyId: const IdUid(7, 189808119834143581),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7340659169639472256),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1610534136920631138),
            name: 'area',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 7501113590020543861),
            name: 'village',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4028480182276226246),
            name: 'panchayat',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 2244748022008546368),
            name: 'block',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 189808119834143581),
            name: 'pinId',
            type: 11,
            flags: 520,
            indexId: const IdUid(3, 1095378391325752394),
            relationTarget: 'Pincode')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 2926843568394500462),
      name: 'Pincode',
      lastPropertyId: const IdUid(5, 983590384906376137),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7594716688924681593),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 4051848489981520417),
            name: 'pincode',
            type: 9,
            flags: 34848,
            indexId: const IdUid(1, 9022913352170306668)),
        ModelProperty(
            id: const IdUid(3, 2156173649322970195),
            name: 'district',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1326536982537431332),
            name: 'state',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 983590384906376137),
            name: 'country',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(name: 'locations', srcEntity: 'Location', srcField: 'pin')
      ])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 2926843568394500462),
      lastIndexId: const IdUid(3, 1095378391325752394),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [2865266008381946663],
      retiredPropertyUids: const [153061183496337685],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Location: EntityDefinition<Location>(
        model: _entities[0],
        toOneRelations: (Location object) => [object.pin],
        toManyRelations: (Location object) => {},
        getId: (Location object) => object.id,
        setId: (Location object, int id) {
          object.id = id;
        },
        objectToFB: (Location object, fb.Builder fbb) {
          final areaOffset =
              object.area == null ? null : fbb.writeString(object.area!);
          final villageOffset =
              object.village == null ? null : fbb.writeString(object.village!);
          final panchayatOffset = object.panchayat == null
              ? null
              : fbb.writeString(object.panchayat!);
          final blockOffset =
              object.block == null ? null : fbb.writeString(object.block!);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, areaOffset);
          fbb.addOffset(2, villageOffset);
          fbb.addOffset(3, panchayatOffset);
          fbb.addOffset(4, blockOffset);
          fbb.addInt64(6, object.pin.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Location(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              area: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              village: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8),
              panchayat: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10),
              block: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12));
          object.pin.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0);
          object.pin.attach(store);
          return object;
        }),
    Pincode: EntityDefinition<Pincode>(
        model: _entities[1],
        toOneRelations: (Pincode object) => [],
        toManyRelations: (Pincode object) => {
              RelInfo<Location>.toOneBacklink(
                      7, object.id, (Location srcObject) => srcObject.pin):
                  object.locations
            },
        getId: (Pincode object) => object.id,
        setId: (Pincode object, int id) {
          object.id = id;
        },
        objectToFB: (Pincode object, fb.Builder fbb) {
          final pincodeOffset =
              object.pincode == null ? null : fbb.writeString(object.pincode!);
          final districtOffset = object.district == null
              ? null
              : fbb.writeString(object.district!);
          final stateOffset =
              object.state == null ? null : fbb.writeString(object.state!);
          final countryOffset =
              object.country == null ? null : fbb.writeString(object.country!);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, pincodeOffset);
          fbb.addOffset(2, districtOffset);
          fbb.addOffset(3, stateOffset);
          fbb.addOffset(4, countryOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Pincode(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              pincode: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              district: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8),
              state: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10),
              country: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12));
          InternalToManyAccess.setRelInfo(
              object.locations,
              store,
              RelInfo<Location>.toOneBacklink(
                  7, object.id, (Location srcObject) => srcObject.pin),
              store.box<Pincode>());
          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Location] entity fields to define ObjectBox queries.
class Location_ {
  /// see [Location.id]
  static final id = QueryIntegerProperty<Location>(_entities[0].properties[0]);

  /// see [Location.area]
  static final area = QueryStringProperty<Location>(_entities[0].properties[1]);

  /// see [Location.village]
  static final village =
      QueryStringProperty<Location>(_entities[0].properties[2]);

  /// see [Location.panchayat]
  static final panchayat =
      QueryStringProperty<Location>(_entities[0].properties[3]);

  /// see [Location.block]
  static final block =
      QueryStringProperty<Location>(_entities[0].properties[4]);

  /// see [Location.pin]
  static final pin =
      QueryRelationToOne<Location, Pincode>(_entities[0].properties[5]);
}

/// [Pincode] entity fields to define ObjectBox queries.
class Pincode_ {
  /// see [Pincode.id]
  static final id = QueryIntegerProperty<Pincode>(_entities[1].properties[0]);

  /// see [Pincode.pincode]
  static final pincode =
      QueryStringProperty<Pincode>(_entities[1].properties[1]);

  /// see [Pincode.district]
  static final district =
      QueryStringProperty<Pincode>(_entities[1].properties[2]);

  /// see [Pincode.state]
  static final state = QueryStringProperty<Pincode>(_entities[1].properties[3]);

  /// see [Pincode.country]
  static final country =
      QueryStringProperty<Pincode>(_entities[1].properties[4]);
}
