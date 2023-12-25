import 'package:flutter/material.dart';
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
      _storeBuildVersion =
          prefs.getInt('ff_storeBuildVersion') ?? _storeBuildVersion;
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
  set currentLocation(LatLng? value) {
    _currentLocation = value;
  }

  DocumentReference? _currentCompany;
  DocumentReference? get currentCompany => _currentCompany;
  set currentCompany(DocumentReference? value) {
    _currentCompany = value;
    value != null
        ? prefs.setString('ff_currentCompany', value.path)
        : prefs.remove('ff_currentCompany');
  }

  String _appVersion = '';
  String get appVersion => _appVersion;
  set appVersion(String value) {
    _appVersion = value;
  }

  int _storeBuildVersion = 0;
  int get storeBuildVersion => _storeBuildVersion;
  set storeBuildVersion(int value) {
    _storeBuildVersion = value;
    prefs.setInt('ff_storeBuildVersion', value);
  }

  int _appBuildVersion = 0;
  int get appBuildVersion => _appBuildVersion;
  set appBuildVersion(int value) {
    _appBuildVersion = value;
    prefs.setInt('ff_appBuildVersion', value);
  }

  bool _isTesting = false;
  bool get isTesting => _isTesting;
  set isTesting(bool value) {
    _isTesting = value;
    prefs.setBool('ff_isTesting', value);
  }

  String _androidStoreLink = '';
  String get androidStoreLink => _androidStoreLink;
  set androidStoreLink(String value) {
    _androidStoreLink = value;
    prefs.setString('ff_androidStoreLink', value);
  }

  String _iosStoreLink = '';
  String get iosStoreLink => _iosStoreLink;
  set iosStoreLink(String value) {
    _iosStoreLink = value;
    prefs.setString('ff_iosStoreLink', value);
  }

  bool _isEnableAd = false;
  bool get isEnableAd => _isEnableAd;
  set isEnableAd(bool value) {
    _isEnableAd = value;
    prefs.setBool('ff_isEnableAd', value);
  }

  bool _isAdmin = false;
  bool get isAdmin => _isAdmin;
  set isAdmin(bool value) {
    _isAdmin = value;
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
