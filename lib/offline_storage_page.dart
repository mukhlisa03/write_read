import 'package:flutter/material.dart';
import 'storage_service.dart';
import 'display_page.dart';

class OfflineStoragePage extends StatefulWidget {
  const OfflineStoragePage({super.key});

  @override
  State<OfflineStoragePage> createState() => _OfflineStoragePageState();
}

class _OfflineStoragePageState extends State<OfflineStoragePage> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();

  String savedName = "";
  String savedSurname = "";

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final data = await StorageService.readUser();
    setState(() {
      nameController.text = data["name"]!;
      surnameController.text = data["surname"]!;
      savedName = data["name"]!;
      savedSurname = data["surname"]!;
    });
  }

  Future<void> _saveUser() async {
    final name = nameController.text.trim();
    final surname = surnameController.text.trim();

    await StorageService.writeUser(name, surname);

    setState(() {
      savedName = name;
      savedSurname = surname;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Saved successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Offline Storage")),
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
              onPressed: _saveUser,
              child: const Text("Save"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DisplayPage(),
                  ),
                );
              },
              child: const Text("Go to Display Page"),
            ),
            const SizedBox(height: 40),
            if (savedName.isNotEmpty || savedSurname.isNotEmpty)
              Text(
                "Saved: $savedName $savedSurname",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
