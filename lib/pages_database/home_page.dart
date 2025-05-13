import 'package:flutter/material.dart';
import '../services/api_service.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List mahasiswa = [];

  final namaController = TextEditingController();
  final jurusanController = TextEditingController();

  bool isEdit = false;
  String selectedId = "";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final data = await ApiService.getMahasiswa();
    setState(() {
      mahasiswa = data;
    });
  }

  void tambahData() async {
    await ApiService.addMahasiswa(namaController.text, jurusanController.text);
    resetForm();
    fetchData();
  }

  void updateData() async {
    await ApiService.updateMahasiswa(selectedId, namaController.text, jurusanController.text);
    resetForm();
    fetchData();
  }

  void hapusData(String id) async {
    await ApiService.deleteMahasiswa(id);
    fetchData();
  }

  void isiFormUntukEdit(Map item) {
    setState(() {
      isEdit = true;
      selectedId = item['id'];
      namaController.text = item['nama'];
      jurusanController.text = item['jurusan'];
    });
  }

  void resetForm() {
    setState(() {
      isEdit = false;
      selectedId = "";
      namaController.clear();
      jurusanController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('A18.2024.00109 - M. Aji PBU')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            TextField(
              controller: jurusanController,
              decoration: InputDecoration(labelText: "Jurusan"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: isEdit ? updateData : tambahData,
                  child: Text(isEdit ? "Update" : "Tambah"),
                ),
                if (isEdit)
                  TextButton(
                    onPressed: resetForm,
                    child: Text("Batal"),
                  ),
              ],
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: mahasiswa.length,
                itemBuilder: (context, index) {
                  final item = mahasiswa[index];
                  return ListTile(
                    title: Text(item['nama']),
                    subtitle: Text(item['jurusan']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => isiFormUntukEdit(item),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => hapusData(item['id']),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
