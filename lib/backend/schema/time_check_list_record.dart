import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TimeCheckListRecord extends FirestoreRecord {
  TimeCheckListRecord._(
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

  // "photo_in" field.
  String? _photoIn;
  String get photoIn => _photoIn ?? '';
  bool hasPhotoIn() => _photoIn != null;

  // "detail_in" field.
  String? _detailIn;
  String get detailIn => _detailIn ?? '';
  bool hasDetailIn() => _detailIn != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "photo_out" field.
  String? _photoOut;
  String get photoOut => _photoOut ?? '';
  bool hasPhotoOut() => _photoOut != null;

  // "detail_out" field.
  String? _detailOut;
  String get detailOut => _detailOut ?? '';
  bool hasDetailOut() => _detailOut != null;

  // "company_ref" field.
  DocumentReference? _companyRef;
  DocumentReference? get companyRef => _companyRef;
  bool hasCompanyRef() => _companyRef != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _photoIn = snapshotData['photo_in'] as String?;
    _detailIn = snapshotData['detail_in'] as String?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _photoOut = snapshotData['photo_out'] as String?;
    _detailOut = snapshotData['detail_out'] as String?;
    _companyRef = snapshotData['company_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('time_check_list');

  static Stream<TimeCheckListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TimeCheckListRecord.fromSnapshot(s));

  static Future<TimeCheckListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TimeCheckListRecord.fromSnapshot(s));

  static TimeCheckListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TimeCheckListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TimeCheckListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TimeCheckListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TimeCheckListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TimeCheckListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTimeCheckListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  int? status,
  String? photoIn,
  String? detailIn,
  DateTime? endDate,
  String? photoOut,
  String? detailOut,
  DocumentReference? companyRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'status': status,
      'photo_in': photoIn,
      'detail_in': detailIn,
      'end_date': endDate,
      'photo_out': photoOut,
      'detail_out': detailOut,
      'company_ref': companyRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class TimeCheckListRecordDocumentEquality
    implements Equality<TimeCheckListRecord> {
  const TimeCheckListRecordDocumentEquality();

  @override
  bool equals(TimeCheckListRecord? e1, TimeCheckListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.status == e2?.status &&
        e1?.photoIn == e2?.photoIn &&
        e1?.detailIn == e2?.detailIn &&
        e1?.endDate == e2?.endDate &&
        e1?.photoOut == e2?.photoOut &&
        e1?.detailOut == e2?.detailOut &&
        e1?.companyRef == e2?.companyRef;
  }

  @override
  int hash(TimeCheckListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.status,
        e?.photoIn,
        e?.detailIn,
        e?.endDate,
        e?.photoOut,
        e?.detailOut,
        e?.companyRef
      ]);

  @override
  bool isValidKey(Object? o) => o is TimeCheckListRecord;
}
