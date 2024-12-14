import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:attendance_app/services/api_services.dart';

class AttendanceScreen extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  AttendanceScreen({super.key});

  void markAttendance(BuildContext context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      String response = await ApiService.markAttendance(image.path);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mark Attendance')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => markAttendance(context),
          child: const Text('Mark Attendance'),
        ),
      ),
    );
  }
}
