import 'package:flutter/material.dart';
import '/backend/backend.dart';
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
      _currentCompany =
          prefs.getString('ff_currentCompany')?.ref ?? _currentCompany;
    });
    _safeInit(() {
      _appBuildVersion = prefs.getInt('ff_appBuildVersion') ?? _appBuildVersion;
    });
    _safeInit(() {
      _isTesting = prefs.getBool('ff_isTesting') ?? _isTesting;
    });
    _safeInit(() {
      _androidStoreLink =
          prefs.getString('ff_androidStoreLink') ?? _androidStoreLink;
    });
    _safeInit(() {
      _iosStoreLink = prefs.getString('ff_iosStoreLink') ?? _iosStoreLink;
    });
    _safeInit(() {
      _isEnableAd = prefs.getBool('ff_isEnableAd') ?? _isEnableAd;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;
  set currentLocation(LatLng? _value) {
    _currentLocation = _value;
  }

  DocumentReference? _currentCompany;
  DocumentReference? get currentCompany => _currentCompany;
  set currentCompany(DocumentReference? _value) {
    _currentCompany = _value;
    _value != null
        ? prefs.setString('ff_currentCompany', _value.path)
        : prefs.remove('ff_currentCompany');
  }

  String _appVersion = 'false';
  String get appVersion => _appVersion;
  set appVersion(String _value) {
    _appVersion = _value;
  }

  int _appBuildVersion = 0;
  int get appBuildVersion => _appBuildVersion;
  set appBuildVersion(int _value) {
    _appBuildVersion = _value;
    prefs.setInt('ff_appBuildVersion', _value);
  }

  bool _isTesting = false;
  bool get isTesting => _isTesting;
  set isTesting(bool _value) {
    _isTesting = _value;
    prefs.setBool('ff_isTesting', _value);
  }

  String _androidStoreLink = '';
  String get androidStoreLink => _androidStoreLink;
  set androidStoreLink(String _value) {
    _androidStoreLink = _value;
    prefs.setString('ff_androidStoreLink', _value);
  }

  String _iosStoreLink = '';
  String get iosStoreLink => _iosStoreLink;
  set iosStoreLink(String _value) {
    _iosStoreLink = _value;
    prefs.setString('ff_iosStoreLink', _value);
  }

  bool _isEnableAd = false;
  bool get isEnableAd => _isEnableAd;
  set isEnableAd(bool _value) {
    _isEnableAd = _value;
    prefs.setBool('ff_isEnableAd', _value);
  }

  bool _isAdmin = false;
  bool get isAdmin => _isAdmin;
  set isAdmin(bool _value) {
    _isAdmin = _value;
  }

  int _totalBadge = 0;
  int get totalBadge => _totalBadge;
  set totalBadge(int _value) {
    _totalBadge = _value;
  }

  bool _isHasUserJoin = false;
  bool get isHasUserJoin => _isHasUserJoin;
  set isHasUserJoin(bool _value) {
    _isHasUserJoin = _value;
  }

  int _storeBuildVersion = 0;
  int get storeBuildVersion => _storeBuildVersion;
  set storeBuildVersion(int _value) {
    _storeBuildVersion = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
