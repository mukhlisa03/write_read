import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String nameKey = "name";
  static const String surnameKey = "surname";

  // Read data
  static Future<Map<String, String>> readUser() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(nameKey) ?? "";
    final surname = prefs.getString(surnameKey) ?? "";
    return {"name": name, "surname": surname};
  }

  // Write data
  static Future<void> writeUser(String name, String surname) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(nameKey, name);
    await prefs.setString(surnameKey, surname);
    print("Saved → {name: $name, surname: $surname}");
  }
}
