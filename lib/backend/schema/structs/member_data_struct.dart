// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MemberDataStruct extends FFFirebaseStruct {
  MemberDataStruct({
    DocumentReference? memberRef,
    String? permission,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _memberRef = memberRef,
        _permission = permission,
        super(firestoreUtilData);

  // "member_ref" field.
  DocumentReference? _memberRef;
  DocumentReference? get memberRef => _memberRef;
  set memberRef(DocumentReference? val) => _memberRef = val;

  bool hasMemberRef() => _memberRef != null;

  // "permission" field.
  String? _permission;
  String get permission => _permission ?? '';
  set permission(String? val) => _permission = val;

  bool hasPermission() => _permission != null;

  static MemberDataStruct fromMap(Map<String, dynamic> data) =>
      MemberDataStruct(
        memberRef: data['member_ref'] as DocumentReference?,
        permission: data['permission'] as String?,
      );

  static MemberDataStruct? maybeFromMap(dynamic data) => data is Map
      ? MemberDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'member_ref': _memberRef,
        'permission': _permission,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'member_ref': serializeParam(
          _memberRef,
          ParamType.DocumentReference,
        ),
        'permission': serializeParam(
          _permission,
          ParamType.String,
        ),
      }.withoutNulls;

  static MemberDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      MemberDataStruct(
        memberRef: deserializeParam(
          data['member_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['customer', 'member_list'],
        ),
        permission: deserializeParam(
          data['permission'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MemberDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MemberDataStruct &&
        memberRef == other.memberRef &&
        permission == other.permission;
  }

  @override
  int get hashCode => const ListEquality().hash([memberRef, permission]);
}

MemberDataStruct createMemberDataStruct({
  DocumentReference? memberRef,
  String? permission,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MemberDataStruct(
      memberRef: memberRef,
      permission: permission,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MemberDataStruct? updateMemberDataStruct(
  MemberDataStruct? memberData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    memberData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMemberDataStructData(
  Map<String, dynamic> firestoreData,
  MemberDataStruct? memberData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (memberData == null) {
    return;
  }
  if (memberData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && memberData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final memberDataData = getMemberDataFirestoreData(memberData, forFieldValue);
  final nestedData = memberDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = memberData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMemberDataFirestoreData(
  MemberDataStruct? memberData, [
  bool forFieldValue = false,
]) {
  if (memberData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(memberData.toMap());

  // Add any Firestore field values
  memberData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMemberDataListFirestoreData(
  List<MemberDataStruct>? memberDatas,
) =>
    memberDatas?.map((e) => getMemberDataFirestoreData(e, true)).toList() ?? [];
