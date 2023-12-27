import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyListRecord extends FirestoreRecord {
  CompanyListRecord._(
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

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "company_code" field.
  String? _companyCode;
  String get companyCode => _companyCode ?? '';
  bool hasCompanyCode() => _companyCode != null;

  // "start_date" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  String? _endDate;
  String get endDate => _endDate ?? '';
  bool hasEndDate() => _endDate != null;

  // "is_free" field.
  bool? _isFree;
  bool get isFree => _isFree ?? false;
  bool hasIsFree() => _isFree != null;

  // "is_paid" field.
  bool? _isPaid;
  bool get isPaid => _isPaid ?? false;
  bool hasIsPaid() => _isPaid != null;

  // "expire_date" field.
  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  bool hasExpireDate() => _expireDate != null;

  // "total_badge" field.
  int? _totalBadge;
  int get totalBadge => _totalBadge ?? 0;
  bool hasTotalBadge() => _totalBadge != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _deleteDate = snapshotData['delete_date'] as DateTime?;
    _deleteBy = snapshotData['delete_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _companyName = snapshotData['company_name'] as String?;
    _companyCode = snapshotData['company_code'] as String?;
    _startDate = snapshotData['start_date'] as String?;
    _endDate = snapshotData['end_date'] as String?;
    _isFree = snapshotData['is_free'] as bool?;
    _isPaid = snapshotData['is_paid'] as bool?;
    _expireDate = snapshotData['expire_date'] as DateTime?;
    _totalBadge = castToType<int>(snapshotData['total_badge']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('company_list');

  static Stream<CompanyListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyListRecord.fromSnapshot(s));

  static Future<CompanyListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyListRecord.fromSnapshot(s));

  static CompanyListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  DateTime? deleteDate,
  DocumentReference? deleteBy,
  int? status,
  String? companyName,
  String? companyCode,
  String? startDate,
  String? endDate,
  bool? isFree,
  bool? isPaid,
  DateTime? expireDate,
  int? totalBadge,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'delete_date': deleteDate,
      'delete_by': deleteBy,
      'status': status,
      'company_name': companyName,
      'company_code': companyCode,
      'start_date': startDate,
      'end_date': endDate,
      'is_free': isFree,
      'is_paid': isPaid,
      'expire_date': expireDate,
      'total_badge': totalBadge,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyListRecordDocumentEquality implements Equality<CompanyListRecord> {
  const CompanyListRecordDocumentEquality();

  @override
  bool equals(CompanyListRecord? e1, CompanyListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.deleteDate == e2?.deleteDate &&
        e1?.deleteBy == e2?.deleteBy &&
        e1?.status == e2?.status &&
        e1?.companyName == e2?.companyName &&
        e1?.companyCode == e2?.companyCode &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.isFree == e2?.isFree &&
        e1?.isPaid == e2?.isPaid &&
        e1?.expireDate == e2?.expireDate &&
        e1?.totalBadge == e2?.totalBadge;
  }

  @override
  int hash(CompanyListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.deleteDate,
        e?.deleteBy,
        e?.status,
        e?.companyName,
        e?.companyCode,
        e?.startDate,
        e?.endDate,
        e?.isFree,
        e?.isPaid,
        e?.expireDate,
        e?.totalBadge
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyListRecord;
}
