import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransacationListRecord extends FirestoreRecord {
  TransacationListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "photo_in" field.
  String? _photoIn;
  String get photoIn => _photoIn ?? '';
  bool hasPhotoIn() => _photoIn != null;

  // "photo_out" field.
  String? _photoOut;
  String get photoOut => _photoOut ?? '';
  bool hasPhotoOut() => _photoOut != null;

  // "location_in" field.
  LatLng? _locationIn;
  LatLng? get locationIn => _locationIn;
  bool hasLocationIn() => _locationIn != null;

  // "location_out" field.
  LatLng? _locationOut;
  LatLng? get locationOut => _locationOut;
  bool hasLocationOut() => _locationOut != null;

  // "detail_in" field.
  String? _detailIn;
  String get detailIn => _detailIn ?? '';
  bool hasDetailIn() => _detailIn != null;

  // "detail_out" field.
  String? _detailOut;
  String get detailOut => _detailOut ?? '';
  bool hasDetailOut() => _detailOut != null;

  // "date_in" field.
  DateTime? _dateIn;
  DateTime? get dateIn => _dateIn;
  bool hasDateIn() => _dateIn != null;

  // "date_out" field.
  DateTime? _dateOut;
  DateTime? get dateOut => _dateOut;
  bool hasDateOut() => _dateOut != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _photoIn = snapshotData['photo_in'] as String?;
    _photoOut = snapshotData['photo_out'] as String?;
    _locationIn = snapshotData['location_in'] as LatLng?;
    _locationOut = snapshotData['location_out'] as LatLng?;
    _detailIn = snapshotData['detail_in'] as String?;
    _detailOut = snapshotData['detail_out'] as String?;
    _dateIn = snapshotData['date_in'] as DateTime?;
    _dateOut = snapshotData['date_out'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('transacation_list')
          : FirebaseFirestore.instance.collectionGroup('transacation_list');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('transacation_list').doc(id);

  static Stream<TransacationListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransacationListRecord.fromSnapshot(s));

  static Future<TransacationListRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TransacationListRecord.fromSnapshot(s));

  static TransacationListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransacationListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransacationListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransacationListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransacationListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransacationListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransacationListRecordData({
  DocumentReference? createBy,
  int? status,
  String? photoIn,
  String? photoOut,
  LatLng? locationIn,
  LatLng? locationOut,
  String? detailIn,
  String? detailOut,
  DateTime? dateIn,
  DateTime? dateOut,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_by': createBy,
      'status': status,
      'photo_in': photoIn,
      'photo_out': photoOut,
      'location_in': locationIn,
      'location_out': locationOut,
      'detail_in': detailIn,
      'detail_out': detailOut,
      'date_in': dateIn,
      'date_out': dateOut,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransacationListRecordDocumentEquality
    implements Equality<TransacationListRecord> {
  const TransacationListRecordDocumentEquality();

  @override
  bool equals(TransacationListRecord? e1, TransacationListRecord? e2) {
    return e1?.createBy == e2?.createBy &&
        e1?.status == e2?.status &&
        e1?.photoIn == e2?.photoIn &&
        e1?.photoOut == e2?.photoOut &&
        e1?.locationIn == e2?.locationIn &&
        e1?.locationOut == e2?.locationOut &&
        e1?.detailIn == e2?.detailIn &&
        e1?.detailOut == e2?.detailOut &&
        e1?.dateIn == e2?.dateIn &&
        e1?.dateOut == e2?.dateOut;
  }

  @override
  int hash(TransacationListRecord? e) => const ListEquality().hash([
        e?.createBy,
        e?.status,
        e?.photoIn,
        e?.photoOut,
        e?.locationIn,
        e?.locationOut,
        e?.detailIn,
        e?.detailOut,
        e?.dateIn,
        e?.dateOut
      ]);

  @override
  bool isValidKey(Object? o) => o is TransacationListRecord;
}
