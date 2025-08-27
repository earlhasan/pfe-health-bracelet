import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _currentUserRole = '';
  String get currentUserRole => _currentUserRole;
  set currentUserRole(String value) {
    _currentUserRole = value;
  }

  String _selectedrole = '';
  String get selectedrole => _selectedrole;
  set selectedrole(String value) {
    _selectedrole = value;
  }

  bool _isEmailFormatValid = false;
  bool get isEmailFormatValid => _isEmailFormatValid;
  set isEmailFormatValid(bool value) {
    _isEmailFormatValid = value;
  }

  int _heartRateLowLimit = 50;
  int get heartRateLowLimit => _heartRateLowLimit;
  set heartRateLowLimit(int value) {
    _heartRateLowLimit = value;
  }

  int _heartRateHighLimit = 100;
  int get heartRateHighLimit => _heartRateHighLimit;
  set heartRateHighLimit(int value) {
    _heartRateHighLimit = value;
  }

  int _oxygenLimit = 90;
  int get oxygenLimit => _oxygenLimit;
  set oxygenLimit(int value) {
    _oxygenLimit = value;
  }

  double _temperatureLimit = 38.5;
  double get temperatureLimit => _temperatureLimit;
  set temperatureLimit(double value) {
    _temperatureLimit = value;
  }

  bool _hasShownHeartAlert = false;
  bool get hasShownHeartAlert => _hasShownHeartAlert;
  set hasShownHeartAlert(bool value) {
    _hasShownHeartAlert = value;
  }

  bool _hasShownTemperatureAlert = false;
  bool get hasShownTemperatureAlert => _hasShownTemperatureAlert;
  set hasShownTemperatureAlert(bool value) {
    _hasShownTemperatureAlert = value;
  }

  bool _hasShownOxygenAlert = false;
  bool get hasShownOxygenAlert => _hasShownOxygenAlert;
  set hasShownOxygenAlert(bool value) {
    _hasShownOxygenAlert = value;
  }
}
