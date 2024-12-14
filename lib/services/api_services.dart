import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://c4ee-202-142-78-9.ngrok-free.app ';

  static Future<String> registerStudent(String name, String imagePath) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/register'));
    request.fields['name'] = name;
    request.files.add(await http.MultipartFile.fromPath('image', imagePath));
    var response = await request.send();

    return response.statusCode == 200
        ? "Student registered successfully"
        : "Failed to register";
  }

  static Future<String> markAttendance(String imagePath) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$baseUrl/mark_attendance'));
    request.files.add(await http.MultipartFile.fromPath('image', imagePath));
    var response = await request.send();

    return response.statusCode == 200
        ? "Attendance marked successfully"
        : "Failed to mark attendance";
  }
}
