import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LetterListRecord extends FirestoreRecord {
  LetterListRecord._(
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

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  // "member_ref" field.
  DocumentReference? _memberRef;
  DocumentReference? get memberRef => _memberRef;
  bool hasMemberRef() => _memberRef != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _subject = snapshotData['subject'] as String?;
    _detail = snapshotData['detail'] as String?;
    _memberRef = snapshotData['member_ref'] as DocumentReference?;
    _startDate = snapshotData['start_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('letter_list')
          : FirebaseFirestore.instance.collectionGroup('letter_list');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('letter_list').doc(id);

  static Stream<LetterListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LetterListRecord.fromSnapshot(s));

  static Future<LetterListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LetterListRecord.fromSnapshot(s));

  static LetterListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LetterListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LetterListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LetterListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LetterListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LetterListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLetterListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  int? status,
  String? subject,
  String? detail,
  DocumentReference? memberRef,
  DateTime? startDate,
  DateTime? endDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'status': status,
      'subject': subject,
      'detail': detail,
      'member_ref': memberRef,
      'start_date': startDate,
      'end_date': endDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class LetterListRecordDocumentEquality implements Equality<LetterListRecord> {
  const LetterListRecordDocumentEquality();

  @override
  bool equals(LetterListRecord? e1, LetterListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.status == e2?.status &&
        e1?.subject == e2?.subject &&
        e1?.detail == e2?.detail &&
        e1?.memberRef == e2?.memberRef &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate;
  }

  @override
  int hash(LetterListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.status,
        e?.subject,
        e?.detail,
        e?.memberRef,
        e?.startDate,
        e?.endDate
      ]);

  @override
  bool isValidKey(Object? o) => o is LetterListRecord;
}
