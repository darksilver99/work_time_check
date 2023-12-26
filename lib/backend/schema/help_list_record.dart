import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HelpListRecord extends FirestoreRecord {
  HelpListRecord._(
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

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "topic" field.
  String? _topic;
  String get topic => _topic ?? '';
  bool hasTopic() => _topic != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _topic = snapshotData['topic'] as String?;
    _detail = snapshotData['detail'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('help_list');

  static Stream<HelpListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HelpListRecord.fromSnapshot(s));

  static Future<HelpListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HelpListRecord.fromSnapshot(s));

  static HelpListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HelpListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HelpListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HelpListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HelpListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HelpListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHelpListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  int? status,
  String? topic,
  String? detail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'status': status,
      'topic': topic,
      'detail': detail,
    }.withoutNulls,
  );

  return firestoreData;
}

class HelpListRecordDocumentEquality implements Equality<HelpListRecord> {
  const HelpListRecordDocumentEquality();

  @override
  bool equals(HelpListRecord? e1, HelpListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.status == e2?.status &&
        e1?.topic == e2?.topic &&
        e1?.detail == e2?.detail;
  }

  @override
  int hash(HelpListRecord? e) => const ListEquality()
      .hash([e?.createDate, e?.createBy, e?.status, e?.topic, e?.detail]);

  @override
  bool isValidKey(Object? o) => o is HelpListRecord;
}
