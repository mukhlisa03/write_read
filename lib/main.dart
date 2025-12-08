import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OfflineStoragePage(),
  ));
}

class OfflineStoragePage extends StatefulWidget {
  const OfflineStoragePage({super.key});

  @override
  State<OfflineStoragePage> createState() => _OfflineStoragePageState();
}

class _OfflineStoragePageState extends State<OfflineStoragePage> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();

  late File file;

  @override
  void initState() {
    super.initState();
    _initFile(); // Faylni tayyorlash + read
  }

  // 📌 Device ichida fayl yaratish
  Future<void> _initFile() async {
    final dir = await getApplicationDocumentsDirectory();
    file = File("${dir.path}/user_data.json");

    if (await file.exists()) {
      final content = await file.readAsString();

      if (content.isNotEmpty) {
        final data = jsonDecode(content);
        nameController.text = data["name"] ?? "";
        surnameController.text = data["surname"] ?? "";

        print("READ → $data");
      }
    } else {
      print("Fayl topilmadi. Yangi fayl yaratiladi.");
    }
    setState(() {});
  }

  // 📌 WRITE – ma’lumotni faylga yozish
  Future<void> saveUser() async {
    final data = {
      "name": nameController.text.trim(),
      "surname": surnameController.text.trim(),
    };

    await file.writeAsString(jsonEncode(data)); // write

    print("SAVED → $data");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Saved successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Offline Storage (Write/Read)")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: surnameController,
              decoration: const InputDecoration(labelText: "Surname"),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: saveUser,
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
  
  Future getApplicationDocumentsDirectory() async {}
}
