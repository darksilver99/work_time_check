import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:work_time_check/auth/firebase_auth/auth_util.dart';
import 'package:work_time_check/flutter_flow/flutter_flow_util.dart';

Future<Uint8List> compressFile(Uint8List list) async {
  var result = await FlutterImageCompress.compressWithList(list, quality: 70, minWidth: 500);
  return result;
}

String firebasePathPrefix() => 'users/$currentUserUid/uploads';

String? removeTrailingSlash(String? path) => path != null && path.endsWith('/') ? path.substring(0, path.length - 1) : path;

String getStoragePath(
  String? pathPrefix,
  String filePath,
  bool isVideo, [
  int? index,
]) {
  pathPrefix ??= firebasePathPrefix();
  pathPrefix = removeTrailingSlash(pathPrefix);
  final timestamp = DateTime.now().microsecondsSinceEpoch;
  final ext = isVideo ? 'mp4' : filePath.split('.').last;
  final indexStr = index != null ? '_$index' : '';
  return '$pathPrefix/$timestamp$indexStr.$ext';
}

List<String> getDateRange(DateTime startDate, DateTime endDate) {
  List<String> dateRange = [];
  DateTime currentDate = startDate;

  while (currentDate.isBefore(endDate) || currentDate.isAtSameMomentAs(endDate)) {
    dateRange.add(dateTimeFormat('dd/MM/yyyy', currentDate));
    currentDate = currentDate.add(Duration(days: 1));
  }

  return dateRange;
}

List<DateTime> getDateRange2(DateTime startDate, DateTime endDate) {
  List<DateTime> dateRange = [];
  DateTime currentDate = startDate;

  while (currentDate.isBefore(endDate) || currentDate.isAtSameMomentAs(endDate)) {
    dateRange.add(currentDate);
    currentDate = currentDate.add(Duration(days: 1));
  }

  return dateRange;
}

bool isWeekendOld(date) {
  //21/12/2023
  if (date == "ชื่อ-สกุล") {
    return false;
  }
  //print("date : $date");
  var tmpDate = date.toString().split("/");
  DateTime newDate = DateTime.parse("${tmpDate[2]}-${tmpDate[1]}-${tmpDate[0]}");
  return newDate.weekday == DateTime.saturday || newDate.weekday == DateTime.sunday;
}

bool isWeekend2(date) {
  //21/12/2023
  if (date == "ชื่อ-สกุล") {
    return false;
  }
  print("isWeekend2");
  print(date);
  DateTime? newDate = parseThaiDate(date);
  if (newDate == null) {
    return false;
  }
  return newDate.weekday == DateTime.saturday || newDate.weekday == DateTime.sunday;
}

DateTime? parseThaiDate(String dateStr) {
  final DateFormat formatter = DateFormat('d MMMM yyyy', 'th_TH');
  try {
    final yearBE = int.parse(dateStr.split(' ').last);
    final yearAD = yearBE - 543;
    final dateStrAD = dateStr.replaceFirst(yearBE.toString(), yearAD.toString());
    return formatter.parse(dateStrAD);
  } catch (e) {
    print('Error parsing date: $e');
    return null;
  }
}

bool isLate(rsCompany, DateTime startDate, DateTime? endDate) {
  var tmpStartDate = rsCompany.data()["start_date"].toString().split(":");
  var tmpEndDate = rsCompany.data()["end_date"].toString().split(":");
  var newCompanyStartDate = DateTime(startDate.year, startDate.month, startDate.day, int.parse(tmpStartDate[0]), int.parse(tmpStartDate[1]), 00, 000);
  var newCompanyEndDate = DateTime(startDate.year, startDate.month, startDate.day, int.parse(tmpEndDate[0]), int.parse(tmpEndDate[1]), 00, 000);

  bool isLate = startDate > newCompanyStartDate ? true : false;
  bool isBefore = false;

  if (endDate != null) {
    isBefore = endDate < newCompanyEndDate ? true : false;
  }

  if (!isLate && !isBefore) {
    return false; // ไม่สาย ออกหลัง
  } else if (!isLate && isBefore) {
    return true; // ไม่สาย ออกก่อน
  } else if (isLate && !isBefore) {
    return true; // สาย ออกหลัง
  } else if (isLate && isBefore) {
    return true; // สาย ออกก่อน
  } else {
    return false;
  }
}

List<Map<String, dynamic>> filterByDate(List<Map<String, dynamic>> snapshot, DateTime targetDate) {
  return snapshot.where((doc) {
    Timestamp timestamp = doc['date_in'];
    DateTime dateIn = timestamp.toDate();

    // Compare only the date parts
    return dateIn.year == targetDate.year && dateIn.month == targetDate.month && dateIn.day == targetDate.day;
  }).toList();
}

String _formatDate(DateTime date) {
  return "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
}

List<QueryDocumentSnapshot<Map<String, dynamic>>> filterSnapshotByDate(QuerySnapshot<Map<String, dynamic>> snapshot, DateTime targetDate) {
  // Format the target date to ignore time (only date part)
  String formattedTargetDate = _formatDate(targetDate);

  // Filter the documents based on the formatted date
  return snapshot.docs.where((doc) {
    Timestamp timestamp = doc.data()['date_in'];
    DateTime docDate = timestamp.toDate();

    // Format the document date to ignore time
    String formattedDocDate = _formatDate(docDate);

    // Compare the formatted date strings
    return formattedDocDate == formattedTargetDate;
  }).toList();
}

List<QueryDocumentSnapshot<Map<String, dynamic>>> filterSnapshotByMemberRef(List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshot, DocumentReference<Map<String, dynamic>> memberRef) {
  // Filter the documents based on the memberRef
  return snapshot.where((doc) {
    DocumentReference<Map<String, dynamic>> docMemberRef = doc.data()['member_ref'];

    // Compare the DocumentReference objects directly
    return docMemberRef == memberRef;
  }).toList();
}
