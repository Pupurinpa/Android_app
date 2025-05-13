import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost/mahasiswa'; // Ganti dengan IP server kamu

  static Future<List> getMahasiswa() async {
    final res = await http.get(Uri.parse('$baseUrl/get_mahasiswa.php'));
    return json.decode(res.body);
  }

  static Future<bool> addMahasiswa(String nama, String jurusan) async {
    final res = await http.post(
      Uri.parse('$baseUrl/add_mahasiswa.php'),
      body: {'nama': nama, 'jurusan': jurusan},
    );
    return json.decode(res.body)['success'];
  }

  static Future<bool> deleteMahasiswa(String id) async {
    final res = await http.post(
      Uri.parse('$baseUrl/delete_mahasiswa.php'),
      body: {'id': id},
    );
    return json.decode(res.body)['success'];
  }
  static Future<bool> updateMahasiswa(String id, String nama, String jurusan) async {
    final res = await http.post(
     Uri.parse('$baseUrl/update_mahasiswa.php'),
      body: {'id': id, 'nama': nama, 'jurusan': jurusan},
    );
  return json.decode(res.body)['success'];
  }

}
