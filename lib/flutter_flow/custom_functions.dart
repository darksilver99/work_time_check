import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? dateTh(DateTime? date) {
  if (date == null) {
    return null;
  }
  final DateFormat formatter = DateFormat('d MMMM yyyy', 'th_TH');
  final buddhistYear = date.year + 543;
  return formatter.format(date).replaceFirst('${date.year}', '$buddhistYear');
}

String? dateTimeTh(DateTime? date) {
  if (date == null) {
    return null;
  }

  final DateFormat formatter = DateFormat('d MMMM yyyy HH:mm:ss', 'th_TH');
  final buddhistYear = date.year + 543;
  return formatter.format(date).replaceFirst('${date.year}', '$buddhistYear');
}

DateTime getBeforeDay(
  int pastDay,
  DateTime date,
) {
  DateTime pastDate = date.subtract(Duration(days: pastDay));
  return pastDate;
}

DateTime getEndDayTime(DateTime currentDate) {
  DateTime endOfDay = DateTime(
      currentDate.year, currentDate.month, currentDate.day, 23, 59, 59);
  return endOfDay;
}

DateTime getNextDay(int nextDay) {
  DateTime currentDate = DateTime.now();
  DateTime futureDate = currentDate.add(Duration(days: nextDay));
  return futureDate;
}

DateTime getStartDayTime(DateTime currentDate) {
  DateTime startOfDay =
      DateTime(currentDate.year, currentDate.month, currentDate.day);
  return startOfDay;
}

DateTime getFirstDayOfMonth(DateTime date) {
  DateTime firstDayOfCurrentMonth = DateTime(date.year, date.month, 1);
  return firstDayOfCurrentMonth;
}

String getLocationURL(LatLng? location) {
  if (location == null) {
    return '';
  }
  return 'https://maps.google.com/?q=${location!.latitude},${location!.longitude}';
}

int millisecondsBetween(
  DateTime start,
  DateTime end,
) {
  Duration difference = end.difference(start);

  return difference.inMilliseconds;
}

String formatDuration(int milliseconds) {
  // Convert milliseconds to total seconds
  int totalSeconds = milliseconds ~/ 1000;

  // Calculate days, hours, minutes, and seconds
  int days = totalSeconds ~/ (24 * 3600);
  int hours = (totalSeconds % (24 * 3600)) ~/ 3600;
  int minutes = (totalSeconds % 3600) ~/ 60;
  int seconds = totalSeconds % 60;

  // Create the formatted string
  String formatted = '';

  if (days > 0) {
    formatted += '$days วัน ';
  }
  if (hours > 0) {
    formatted += '$hours ชม ';
  }
  if (minutes > 0) {
    formatted += '$minutes นาที ';
  }
  if (seconds > 0 || formatted.isEmpty) {
    // Always show seconds or show if everything else is 0
    formatted += '$seconds วินาที';
  }

  return formatted.trim();
}

List<String> getYearFromCurrent(int len) {
  List<String> yearList = [];
  int currentYear = DateTime.now().year + 543;
  for (var i = currentYear - len; i <= currentYear; i++) {
    yearList.add(i.toString());
  }
  return yearList;
}

DateTime getLastDayOfMonth(DateTime date) {
  DateTime firstDayOfNextMonth = DateTime(date.year, date.month + 1, 1);
  DateTime lastDayOfCurrentMonth =
      firstDayOfNextMonth.subtract(Duration(seconds: 1));
  return lastDayOfCurrentMonth;
}

DateTime getDateByMonthAndYear(
  String month,
  String year,
) {
  DateTime currentDate = DateTime.now();
  return DateTime((int.parse(year) - 543), int.parse(month), currentDate.day);
}

String? getTime(DateTime? date) {
  if (date == null) {
    return null;
  }
  final DateFormat formatter = DateFormat('HH:mm:ss');
  return formatter.format(date);
}

String dayTh(DateTime date) {
  final DateFormat dayFormatter = DateFormat('EEEE', 'th_TH'); // วันของสัปดาห์
  final DateFormat dayOfMonthFormatter = DateFormat('d'); // วันของเดือน
  final DateFormat monthYearFormatter =
      DateFormat('MMMM yyyy', 'th_TH'); // เดือนและปี

  // แปลงวันที่เป็นรูปแบบที่ต้องการ
  final String dayOfWeek =
      dayFormatter.format(date); // วันของสัปดาห์ (เช่น วันจันทร์)
  final String dayOfMonth =
      dayOfMonthFormatter.format(date); // วันของเดือน (เช่น 15)

  // สร้างสตริงที่รวมวันและวันที่
  return '$dayOfWeekที่ $dayOfMonth';
}

bool isWeekend(String dayString) {
  return dayString.contains("วันเสาร์") || dayString.contains("วันอาทิตย์");
}

String? fullThaiDate(DateTime? date) {
  if (date == null) {
    return null;
  }
  List<String> days = [
    'วันอาทิตย์',
    'วันจันทร์',
    'วันอังคาร',
    'วันพุธ',
    'วันพฤหัสบดี',
    'วันศุกร์',
    'วันเสาร์'
  ];
  List<String> months = [
    'มกราคม',
    'กุมภาพันธ์',
    'มีนาคม',
    'เมษายน',
    'พฤษภาคม',
    'มิถุนายน',
    'กรกฎาคม',
    'สิงหาคม',
    'กันยายน',
    'ตุลาคม',
    'พฤศจิกายน',
    'ธันวาคม'
  ];

  // แปลงปีให้เป็นพุทธศักราช
  int buddhistYear = date.year + 543;

  // แปลงเดือน
  String month = months[date.month - 1];

  // ประกอบเป็นวันที่ที่ต้องการ
  return '${days[date.weekday - 1]}ที่ ${date.day} $month $buddhistYear';
}

String getStatusText(
  int status,
  List<StatusDataStruct> statusList,
) {
  for (var dataStatus in statusList) {
    if (dataStatus.status == status) {
      return dataStatus.subject;
    }
  }
  return '-';
}
