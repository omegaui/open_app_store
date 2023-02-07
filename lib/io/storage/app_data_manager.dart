
import 'package:shared_preferences/shared_preferences.dart';

class AppDataManager{
  static late SharedPreferences prefs;

  static Future<void> initAppData() async {
    prefs = await SharedPreferences.getInstance();
  }
}


