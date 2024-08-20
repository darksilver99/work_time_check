// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PermissionDataStruct extends FFFirebaseStruct {
  PermissionDataStruct({
    String? val,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _val = val,
        _name = name,
        super(firestoreUtilData);

  // "val" field.
  String? _val;
  String get val => _val ?? '';
  set val(String? val) => _val = val;

  bool hasVal() => _val != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static PermissionDataStruct fromMap(Map<String, dynamic> data) =>
      PermissionDataStruct(
        val: data['val'] as String?,
        name: data['name'] as String?,
      );

  static PermissionDataStruct? maybeFromMap(dynamic data) => data is Map
      ? PermissionDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'val': _val,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'val': serializeParam(
          _val,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static PermissionDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      PermissionDataStruct(
        val: deserializeParam(
          data['val'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PermissionDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PermissionDataStruct &&
        val == other.val &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([val, name]);
}

PermissionDataStruct createPermissionDataStruct({
  String? val,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PermissionDataStruct(
      val: val,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PermissionDataStruct? updatePermissionDataStruct(
  PermissionDataStruct? permissionData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    permissionData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPermissionDataStructData(
  Map<String, dynamic> firestoreData,
  PermissionDataStruct? permissionData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (permissionData == null) {
    return;
  }
  if (permissionData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && permissionData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final permissionDataData =
      getPermissionDataFirestoreData(permissionData, forFieldValue);
  final nestedData =
      permissionDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = permissionData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPermissionDataFirestoreData(
  PermissionDataStruct? permissionData, [
  bool forFieldValue = false,
]) {
  if (permissionData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(permissionData.toMap());

  // Add any Firestore field values
  permissionData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPermissionDataListFirestoreData(
  List<PermissionDataStruct>? permissionDatas,
) =>
    permissionDatas
        ?.map((e) => getPermissionDataFirestoreData(e, true))
        .toList() ??
    [];
