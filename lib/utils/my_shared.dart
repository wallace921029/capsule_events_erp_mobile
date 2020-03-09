import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> getMyShared() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  return sp;
}
