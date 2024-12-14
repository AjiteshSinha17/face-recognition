import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:attendance_app/services/api_services.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  RegisterScreen({super.key});

  void registerStudent(BuildContext context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      String response =
          await ApiService.registerStudent(_nameController.text, image.path);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Student')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Student Name'),
            ),
            ElevatedButton(
              onPressed: () => registerStudent(context),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
