import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _appBuildVersion = prefs.getInt('ff_appBuildVersion') ?? _appBuildVersion;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;
  set currentLocation(LatLng? value) {
    _currentLocation = value;
  }

  String _appVersion = 'false';
  String get appVersion => _appVersion;
  set appVersion(String value) {
    _appVersion = value;
  }

  int _appBuildVersion = 0;
  int get appBuildVersion => _appBuildVersion;
  set appBuildVersion(int value) {
    _appBuildVersion = value;
    prefs.setInt('ff_appBuildVersion', value);
  }

  ConfigDataStruct _configData = ConfigDataStruct();
  ConfigDataStruct get configData => _configData;
  set configData(ConfigDataStruct value) {
    _configData = value;
  }

  void updateConfigDataStruct(Function(ConfigDataStruct) updateFn) {
    updateFn(_configData);
  }

  CustomDataStruct _customerData = CustomDataStruct();
  CustomDataStruct get customerData => _customerData;
  set customerData(CustomDataStruct value) {
    _customerData = value;
  }

  void updateCustomerDataStruct(Function(CustomDataStruct) updateFn) {
    updateFn(_customerData);
  }

  List<MonthDataStruct> _monthList = [
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"1\",\"name\":\"มกราคม\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"2\",\"name\":\"กุมภาพันธ์\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"3\",\"name\":\"มีนาคม\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"4\",\"name\":\"เมษายน\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"5\",\"name\":\"พฤษภาคม\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"6\",\"name\":\"มิถุนายน\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"7\",\"name\":\"กรกฎาคม\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"8\",\"name\":\"สิงหาคม\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"9\",\"name\":\"กันยายน\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"10\",\"name\":\"ตุลาคม\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"11\",\"name\":\"พฤศจิกายน\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"12\",\"name\":\"ธันวาคม\"}'))
  ];
  List<MonthDataStruct> get monthList => _monthList;
  set monthList(List<MonthDataStruct> value) {
    _monthList = value;
  }

  void addToMonthList(MonthDataStruct value) {
    monthList.add(value);
  }

  void removeFromMonthList(MonthDataStruct value) {
    monthList.remove(value);
  }

  void removeAtIndexFromMonthList(int index) {
    monthList.removeAt(index);
  }

  void updateMonthListAtIndex(
    int index,
    MonthDataStruct Function(MonthDataStruct) updateFn,
  ) {
    monthList[index] = updateFn(_monthList[index]);
  }

  void insertAtIndexInMonthList(int index, MonthDataStruct value) {
    monthList.insert(index, value);
  }

  List<PermissionDataStruct> _permissionData = [
    PermissionDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"admin\",\"name\":\"เจ้าหน้าที่\"}')),
    PermissionDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"member\",\"name\":\"สมาชิกทั่วไป\"}'))
  ];
  List<PermissionDataStruct> get permissionData => _permissionData;
  set permissionData(List<PermissionDataStruct> value) {
    _permissionData = value;
  }

  void addToPermissionData(PermissionDataStruct value) {
    permissionData.add(value);
  }

  void removeFromPermissionData(PermissionDataStruct value) {
    permissionData.remove(value);
  }

  void removeAtIndexFromPermissionData(int index) {
    permissionData.removeAt(index);
  }

  void updatePermissionDataAtIndex(
    int index,
    PermissionDataStruct Function(PermissionDataStruct) updateFn,
  ) {
    permissionData[index] = updateFn(_permissionData[index]);
  }

  void insertAtIndexInPermissionData(int index, PermissionDataStruct value) {
    permissionData.insert(index, value);
  }

  MemberDataStruct _memberData = MemberDataStruct();
  MemberDataStruct get memberData => _memberData;
  set memberData(MemberDataStruct value) {
    _memberData = value;
  }

  void updateMemberDataStruct(Function(MemberDataStruct) updateFn) {
    updateFn(_memberData);
  }

  List<StatusDataStruct> _letterStatusList = [
    StatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"0\",\"subject\":\"รออนุมัติ\"}')),
    StatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"1\",\"subject\":\"อนุมัติ\"}')),
    StatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"2\",\"subject\":\"ไม่อนุมัติ\"}'))
  ];
  List<StatusDataStruct> get letterStatusList => _letterStatusList;
  set letterStatusList(List<StatusDataStruct> value) {
    _letterStatusList = value;
  }

  void addToLetterStatusList(StatusDataStruct value) {
    letterStatusList.add(value);
  }

  void removeFromLetterStatusList(StatusDataStruct value) {
    letterStatusList.remove(value);
  }

  void removeAtIndexFromLetterStatusList(int index) {
    letterStatusList.removeAt(index);
  }

  void updateLetterStatusListAtIndex(
    int index,
    StatusDataStruct Function(StatusDataStruct) updateFn,
  ) {
    letterStatusList[index] = updateFn(_letterStatusList[index]);
  }

  void insertAtIndexInLetterStatusList(int index, StatusDataStruct value) {
    letterStatusList.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
