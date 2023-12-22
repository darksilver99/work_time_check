// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:excel/excel.dart';
import 'package:excel/excel.dart' as exBorder;
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:work_time_check/solo/solo_function.dart';

Future<String> exportExcel(
  DateTime? startDate,
  DateTime? endDate,
) async {
  // Add your function code here!
  bool isGranted = false;
  if (Platform.isAndroid) {
    final deviceInfo = DeviceInfoPlugin();
    final info = await deviceInfo.androidInfo;
    if (int.parse(info.version.release) >= 13) {
      isGranted = true;
    } else {
      var status = await Permission.storage.request();
      if (status.isGranted) {
        isGranted = true;
      }
    }
  } else {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      isGranted = true;
    }
  }

  if (!isGranted) {
    return '';
  }

  DateTime newEndDate =
      DateTime(endDate!.year, endDate!.month, endDate!.day, 23, 59, 59, 999);

  //getData
  var rs = await FirebaseFirestore.instance
      .collection('time_check_list')
      .where('company_ref', isEqualTo: FFAppState().currentCompany)
      .where('create_date', isGreaterThanOrEqualTo: startDate)
      .where('create_date', isLessThanOrEqualTo: newEndDate)
      .orderBy('create_date', descending: false)
      .get();

  var excel = Excel.createExcel();
  Sheet sheetObject = excel['Sheet1'];

  CellStyle cellStyle = CellStyle(
    backgroundColorHex: '#1AFF1A',
    horizontalAlign: HorizontalAlign.Center,
    bold: true,
    leftBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
    rightBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
    topBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
    bottomBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
  );

  // Add headers
  List<String> header = ["ชื่อ-สกุล"];

  List<String> dateRange = getDateRange(startDate!, newEndDate);
  if (dateRange.length > 60) {
    return 'youshallnotpass';
  }

  for (var i = 0; i < dateRange.length; i++) {
    header.add(dateRange[i]);
  }

  for (var i = 0; i < header.length; i++) {
    var cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0));
    cell.value = TextCellValue(header[i]);
    cell.cellStyle = cellStyle;
  }

  // Add body
  for (int i = 0; i < rs.size; i++) {
    var rsUser = await FirebaseFirestore.instance
        .doc(rs.docs[i].data()["create_by"].path)
        .get();

    for (int j = 0; j < header.length; j++) {
      var cell = sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i + 1));
      cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Center);
      cell.value = TextCellValue(rsUser.data()!["first_name"]);

      if (dateTimeFormat(
              'dd/MM/yyyy', rs.docs[i].data()["create_date"].toDate()) ==
          header[j]) {
        var cell = sheetObject
            .cell(CellIndex.indexByColumnRow(columnIndex: j, rowIndex: i + 1));
        var dateIn =
            dateTimeFormat('Hm', rs.docs[i].data()["create_date"].toDate());
        var dateOut = rs.docs[i].data().containsKey("update_date")
            ? dateTimeFormat('Hm', rs.docs[i].data()["update_date"].toDate())
            : "-";
        cell.value = TextCellValue("เข้างาน : $dateIn | ออกงาน : $dateOut");
      }

      //เสาทิตใส่สี
      if (isWeekend(header[j])) {
        var cell2 = sheetObject
            .cell(CellIndex.indexByColumnRow(columnIndex: j, rowIndex: i + 1));
        cell2.cellStyle = CellStyle(backgroundColorHex: "#ffdfdf");
      }
    }
  }

  // Auto-size columns
  for (int col = 0; col < 60; col++) {
    //sheetObject.setColumnWidth(col, 50);
    sheetObject.setColumnAutoFit(col);
  }

  Directory dir = await getApplicationDocumentsDirectory();
  //Directory dir = Directory('/storage/emulated/0/Download');
  List<int>? fileBytes = excel.save();
  var path = File('${dir.path}/test.xlsx')
    ..createSync(recursive: true)
    ..writeAsBytesSync(fileBytes!);

  print(path);

  return path.path;
}
