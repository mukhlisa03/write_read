// import 'package:flutter/material.dart';
// import 'package:write_read/user_screen.dart';
// import 'storage.dart';

// class UserScreen extends StatefulWidget {
//   const UserScreen({super.key, required this.storage});

//   final UserStorage storage;

//   @override
//   State<UserScreen> createState() => _UserScreenState();
// }

// class _UserScreenState extends State<UserScreen> {
//   final _nameController = TextEditingController();
//   final _surnameController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     // App ochilganda fayldan o'qish
//     _loadUser();
//   }

//   void _loadUser() async {
//     final user = await widget.storage.readUser();
//     _nameController.text = user['name']!;
//     _surnameController.text = user['surname']!;
//     setState(() {}); // UI yangilash
//   }

//   Future<void> _saveUser() async {
//     final name = _nameController.text.trim();
//     final surname = _surnameController.text.trim();
//     await widget.storage.writeUser(name: name, surname: surname);

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('User info saved!')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('User Info Storage')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(labelText: 'Name'),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _surnameController,
//               decoration: const InputDecoration(labelText: 'Surname'),
//             ),
//             const SizedBox(height: 32),
//             ElevatedButton(
//               onPressed: _saveUser,
//               child: const Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
