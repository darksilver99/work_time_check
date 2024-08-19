// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomDataStruct extends FFFirebaseStruct {
  CustomDataStruct({
    DateTime? expireDate,
    String? subject,
    bool? isFirstTime,
    DocumentReference? customerRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _expireDate = expireDate,
        _subject = subject,
        _isFirstTime = isFirstTime,
        _customerRef = customerRef,
        super(firestoreUtilData);

  // "expire_date" field.
  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  set expireDate(DateTime? val) => _expireDate = val;

  bool hasExpireDate() => _expireDate != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;

  bool hasSubject() => _subject != null;

  // "is_first_time" field.
  bool? _isFirstTime;
  bool get isFirstTime => _isFirstTime ?? false;
  set isFirstTime(bool? val) => _isFirstTime = val;

  bool hasIsFirstTime() => _isFirstTime != null;

  // "customer_ref" field.
  DocumentReference? _customerRef;
  DocumentReference? get customerRef => _customerRef;
  set customerRef(DocumentReference? val) => _customerRef = val;

  bool hasCustomerRef() => _customerRef != null;

  static CustomDataStruct fromMap(Map<String, dynamic> data) =>
      CustomDataStruct(
        expireDate: data['expire_date'] as DateTime?,
        subject: data['subject'] as String?,
        isFirstTime: data['is_first_time'] as bool?,
        customerRef: data['customer_ref'] as DocumentReference?,
      );

  static CustomDataStruct? maybeFromMap(dynamic data) => data is Map
      ? CustomDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'expire_date': _expireDate,
        'subject': _subject,
        'is_first_time': _isFirstTime,
        'customer_ref': _customerRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'expire_date': serializeParam(
          _expireDate,
          ParamType.DateTime,
        ),
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
        'is_first_time': serializeParam(
          _isFirstTime,
          ParamType.bool,
        ),
        'customer_ref': serializeParam(
          _customerRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CustomDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      CustomDataStruct(
        expireDate: deserializeParam(
          data['expire_date'],
          ParamType.DateTime,
          false,
        ),
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        isFirstTime: deserializeParam(
          data['is_first_time'],
          ParamType.bool,
          false,
        ),
        customerRef: deserializeParam(
          data['customer_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['customer'],
        ),
      );

  @override
  String toString() => 'CustomDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustomDataStruct &&
        expireDate == other.expireDate &&
        subject == other.subject &&
        isFirstTime == other.isFirstTime &&
        customerRef == other.customerRef;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([expireDate, subject, isFirstTime, customerRef]);
}

CustomDataStruct createCustomDataStruct({
  DateTime? expireDate,
  String? subject,
  bool? isFirstTime,
  DocumentReference? customerRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CustomDataStruct(
      expireDate: expireDate,
      subject: subject,
      isFirstTime: isFirstTime,
      customerRef: customerRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CustomDataStruct? updateCustomDataStruct(
  CustomDataStruct? customData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    customData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCustomDataStructData(
  Map<String, dynamic> firestoreData,
  CustomDataStruct? customData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (customData == null) {
    return;
  }
  if (customData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && customData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final customDataData = getCustomDataFirestoreData(customData, forFieldValue);
  final nestedData = customDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = customData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCustomDataFirestoreData(
  CustomDataStruct? customData, [
  bool forFieldValue = false,
]) {
  if (customData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(customData.toMap());

  // Add any Firestore field values
  customData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCustomDataListFirestoreData(
  List<CustomDataStruct>? customDatas,
) =>
    customDatas?.map((e) => getCustomDataFirestoreData(e, true)).toList() ?? [];
