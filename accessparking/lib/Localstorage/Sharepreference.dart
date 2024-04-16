import 'package:shared_preferences/shared_preferences.dart';

class PrefernciaUsuario {
  static final PrefernciaUsuario _instancia = PrefernciaUsuario._internal();

  factory PrefernciaUsuario() {
    return _instancia;
  }

  PrefernciaUsuario._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get username {
    return _prefs.getString('username') ?? '';
  }

  set username(String value) {
    _prefs.setString('username', value);
  }

  //String get anoadm {return _prefs.getString('anoadm') ?? '';}

  //set anoadm(String value) {_prefs.setString('anoadm', value);}

  //String get mesadm {return _prefs.getString('mesadm') ?? '';}

  //set mesadm(String value) {_prefs.setString('mesadm', value);}

  //String get admmes {return _prefs.getString('admmes') ?? '';}

  //set admmes(String value) { _prefs.setString('admmes', value);}

  //bool get status {return _prefs.getBool('status') ?? false;}

  //set status(bool value) {_prefs.setBool('status', value);}
}
