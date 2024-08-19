import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MemberListRecord extends FirestoreRecord {
  MemberListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  // "update_by" field.
  DocumentReference? _updateBy;
  DocumentReference? get updateBy => _updateBy;
  bool hasUpdateBy() => _updateBy != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "permission" field.
  String? _permission;
  String get permission => _permission ?? '';
  bool hasPermission() => _permission != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _permission = snapshotData['permission'] as String?;
    _displayName = snapshotData['display_name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('member_list')
          : FirebaseFirestore.instance.collectionGroup('member_list');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('member_list').doc(id);

  static Stream<MemberListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MemberListRecord.fromSnapshot(s));

  static Future<MemberListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MemberListRecord.fromSnapshot(s));

  static MemberListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MemberListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MemberListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MemberListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MemberListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MemberListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMemberListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  int? status,
  String? permission,
  String? displayName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'status': status,
      'permission': permission,
      'display_name': displayName,
    }.withoutNulls,
  );

  return firestoreData;
}

class MemberListRecordDocumentEquality implements Equality<MemberListRecord> {
  const MemberListRecordDocumentEquality();

  @override
  bool equals(MemberListRecord? e1, MemberListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.status == e2?.status &&
        e1?.permission == e2?.permission &&
        e1?.displayName == e2?.displayName;
  }

  @override
  int hash(MemberListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.status,
        e?.permission,
        e?.displayName
      ]);

  @override
  bool isValidKey(Object? o) => o is MemberListRecord;
}
