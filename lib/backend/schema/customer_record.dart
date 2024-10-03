import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerRecord extends FirestoreRecord {
  CustomerRecord._(
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

  // "expire_date" field.
  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  bool hasExpireDate() => _expireDate != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "is_first_time" field.
  bool? _isFirstTime;
  bool get isFirstTime => _isFirstTime ?? false;
  bool hasIsFirstTime() => _isFirstTime != null;

  // "delete_date" field.
  DateTime? _deleteDate;
  DateTime? get deleteDate => _deleteDate;
  bool hasDeleteDate() => _deleteDate != null;

  // "delete_by" field.
  DocumentReference? _deleteBy;
  DocumentReference? get deleteBy => _deleteBy;
  bool hasDeleteBy() => _deleteBy != null;

  // "max_person" field.
  int? _maxPerson;
  int get maxPerson => _maxPerson ?? 0;
  bool hasMaxPerson() => _maxPerson != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _expireDate = snapshotData['expire_date'] as DateTime?;
    _subject = snapshotData['subject'] as String?;
    _isFirstTime = snapshotData['is_first_time'] as bool?;
    _deleteDate = snapshotData['delete_date'] as DateTime?;
    _deleteBy = snapshotData['delete_by'] as DocumentReference?;
    _maxPerson = castToType<int>(snapshotData['max_person']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('customer');

  static Stream<CustomerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomerRecord.fromSnapshot(s));

  static Future<CustomerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomerRecord.fromSnapshot(s));

  static CustomerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomerRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  int? status,
  DateTime? expireDate,
  String? subject,
  bool? isFirstTime,
  DateTime? deleteDate,
  DocumentReference? deleteBy,
  int? maxPerson,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'status': status,
      'expire_date': expireDate,
      'subject': subject,
      'is_first_time': isFirstTime,
      'delete_date': deleteDate,
      'delete_by': deleteBy,
      'max_person': maxPerson,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomerRecordDocumentEquality implements Equality<CustomerRecord> {
  const CustomerRecordDocumentEquality();

  @override
  bool equals(CustomerRecord? e1, CustomerRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.status == e2?.status &&
        e1?.expireDate == e2?.expireDate &&
        e1?.subject == e2?.subject &&
        e1?.isFirstTime == e2?.isFirstTime &&
        e1?.deleteDate == e2?.deleteDate &&
        e1?.deleteBy == e2?.deleteBy &&
        e1?.maxPerson == e2?.maxPerson;
  }

  @override
  int hash(CustomerRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.status,
        e?.expireDate,
        e?.subject,
        e?.isFirstTime,
        e?.deleteDate,
        e?.deleteBy,
        e?.maxPerson
      ]);

  @override
  bool isValidKey(Object? o) => o is CustomerRecord;
}
