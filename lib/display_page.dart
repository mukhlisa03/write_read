import 'package:flutter/material.dart';
import 'storage_service.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({super.key});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
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
      savedName = data["name"]!;
      savedSurname = data["surname"]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Display Saved Data")),
      body: Center(
        child: savedName.isEmpty && savedSurname.isEmpty
            ? const Text("No data saved yet")
            : Text(
                "$savedName $savedSurname",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
