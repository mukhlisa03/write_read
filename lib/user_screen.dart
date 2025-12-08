// import 'dart:io';
// import 'dart:convert';
// // import 'package:path_provider/path_provider.dart';

// class UserStorage {
//   // App ichidagi folder manzili
//   Future<String> get _localPath async {
//     final directory = await getApplicationDocumentsDirectory();
//     return directory.path;
//   }

//   // Fayl manzili
//   Future<File> get _localFile async {
//     final path = await _localPath;
//     return File('$path/user_info.json'); // Fayl nomi
//   }

//   // Fayldan ma'lumot o'qish
//   Future<Map<String, String>> readUser() async {
//     try {
//       final file = await _localFile;
//       if (await file.exists()) {
//         final contents = await file.readAsString();
//         final data = json.decode(contents);
//         return {
//           'name': data['name'] ?? '',
//           'surname': data['surname'] ?? '',
//         };
//       } else {
//         return {'name': '', 'surname': ''};
//       }
//     } catch (e) {
//       return {'name': '', 'surname': ''};
//     }
//   }

//   // Faylga ma'lumot yozish
//   Future<void> writeUser({required String name, required String surname}) async {
//     final file = await _localFile;
//     final data = json.encode({'name': name, 'surname': surname});
//     await file.writeAsString(data);
//   }
  
//   Future getApplicationDocumentsDirectory() async {}
// }
