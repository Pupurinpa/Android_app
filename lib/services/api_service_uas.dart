import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '/Responsi_UAS/model.dart';

class ApiService {
  static const String baseUrl = "http://localhost/lagu";

  static Future<List<Lagu>> getLagu() async {
    final response = await http.get(Uri.parse("$baseUrl/get_lagu.php"));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Lagu.fromJson(e)).toList();
    } else {
      throw Exception("Gagal mengambil data lagu");
    }
  }

  static Future<bool> addLagu(Lagu lagu) async {
    final response = await http.post(
      Uri.parse("$baseUrl/add_lagu.php"),
      body: lagu.toJson(),
    );
    return json.decode(response.body)['status'] == 'success';
  }

  static Future<bool> updateLagu(Lagu lagu) async {
    final response = await http.post(
      Uri.parse("$baseUrl/update_lagu.php"),
      body: lagu.toJson(),
    );
    return json.decode(response.body)['status'] == 'success';
  }

  static Future<bool> deleteLagu(String kodeLagu) async {
    final response = await http.post(
      Uri.parse("$baseUrl/delete_lagu.php"),
      body: {'kode_lagu': kodeLagu},
    );
    return json.decode(response.body)['status'] == 'success';
  }

  static Future<String?> uploadGambar(File file) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$baseUrl/upload_gambar.php"),
    );
    request.files.add(await http.MultipartFile.fromPath('gambar', file.path));

    var response = await request.send();
    if (response.statusCode == 200) {
      final res = await http.Response.fromStream(response);
      final jsonRes = json.decode(res.body);
      if (jsonRes['status'] == 'success') {
        return jsonRes['url'];
      }
    }
    return null;
  }
}
