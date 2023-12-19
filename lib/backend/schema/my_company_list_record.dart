import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyCompanyListRecord extends FirestoreRecord {
  MyCompanyListRecord._(
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

  // "delete_date" field.
  DateTime? _deleteDate;
  DateTime? get deleteDate => _deleteDate;
  bool hasDeleteDate() => _deleteDate != null;

  // "delete_by" field.
  DocumentReference? _deleteBy;
  DocumentReference? get deleteBy => _deleteBy;
  bool hasDeleteBy() => _deleteBy != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "company_ref" field.
  DocumentReference? _companyRef;
  DocumentReference? get companyRef => _companyRef;
  bool hasCompanyRef() => _companyRef != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _deleteDate = snapshotData['delete_date'] as DateTime?;
    _deleteBy = snapshotData['delete_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _companyRef = snapshotData['company_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('my_company_list');

  static Stream<MyCompanyListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyCompanyListRecord.fromSnapshot(s));

  static Future<MyCompanyListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyCompanyListRecord.fromSnapshot(s));

  static MyCompanyListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyCompanyListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyCompanyListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyCompanyListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyCompanyListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyCompanyListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyCompanyListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? deleteDate,
  DocumentReference? deleteBy,
  int? status,
  DocumentReference? companyRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'delete_date': deleteDate,
      'delete_by': deleteBy,
      'status': status,
      'company_ref': companyRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class MyCompanyListRecordDocumentEquality
    implements Equality<MyCompanyListRecord> {
  const MyCompanyListRecordDocumentEquality();

  @override
  bool equals(MyCompanyListRecord? e1, MyCompanyListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.deleteDate == e2?.deleteDate &&
        e1?.deleteBy == e2?.deleteBy &&
        e1?.status == e2?.status &&
        e1?.companyRef == e2?.companyRef;
  }

  @override
  int hash(MyCompanyListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.deleteDate,
        e?.deleteBy,
        e?.status,
        e?.companyRef
      ]);

  @override
  bool isValidKey(Object? o) => o is MyCompanyListRecord;
}
