import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PayHistoryListRecord extends FirestoreRecord {
  PayHistoryListRecord._(
    super.reference,
    super.data,
  ) {
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

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['amount']);
    _status = castToType<int>(snapshotData['status']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pay_history_list');

  static Stream<PayHistoryListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PayHistoryListRecord.fromSnapshot(s));

  static Future<PayHistoryListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PayHistoryListRecord.fromSnapshot(s));

  static PayHistoryListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PayHistoryListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PayHistoryListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PayHistoryListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PayHistoryListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PayHistoryListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPayHistoryListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  double? amount,
  int? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'amount': amount,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class PayHistoryListRecordDocumentEquality
    implements Equality<PayHistoryListRecord> {
  const PayHistoryListRecordDocumentEquality();

  @override
  bool equals(PayHistoryListRecord? e1, PayHistoryListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.amount == e2?.amount &&
        e1?.status == e2?.status;
  }

  @override
  int hash(PayHistoryListRecord? e) => const ListEquality()
      .hash([e?.createDate, e?.createBy, e?.amount, e?.status]);

  @override
  bool isValidKey(Object? o) => o is PayHistoryListRecord;
}
