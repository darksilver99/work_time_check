import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'flutter_flow_util.dart';
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? getEmployeeStatus(int? status) {
  if (status == 0) {
    return "รออนุมัติ";
  } else if (status == 1) {
    return "อนุมัติแล้ว";
  } else {
    return "-";
  }
}

String? getTime(DateTime? dateTime) {
  var time = dateTime.toString().split(" ")[1].replaceAll(":00.000", "");
  return time;
}

DateTime? getNextDay(int? nextDay) {
  DateTime currentDate = DateTime.now();
  DateTime futureDate = currentDate.add(Duration(days: nextDay!));
  return futureDate;
}

String? getThaiDatetime(
  DateTime? dateTime,
  String? type,
) {
  var newDateTime = dateTimeFormat("d MMM y HH:mm", dateTime, locale: "TH_th");
  var tmpNewDate = newDateTime.split(" ");
  var newYear = int.parse(tmpNewDate[2]) + 543;
  if (type == "time") {
    return newDateTime =
        '${tmpNewDate[0]} ${tmpNewDate[1]} $newYear ${tmpNewDate[3]} น.';
  } else {
    return newDateTime = '${tmpNewDate[0]} ${tmpNewDate[1]} $newYear';
  }
}

String? getThaiDayName(DateTime? date) {
  int dayOfWeek = date!.weekday;
  List<String> dayName = [
    "อาทิตย์",
    "จันทร์",
    "อังคาร",
    "พุธ",
    "พฤหัสบดี",
    "ศุกร์",
    "เสาร์"
  ];
  return dayName[dayOfWeek];
}
