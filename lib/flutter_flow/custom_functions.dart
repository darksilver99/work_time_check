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
