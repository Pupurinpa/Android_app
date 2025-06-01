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

  void showDetailDialog(Map item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Detail Mahasiswa"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nama: ${item['nama']}"),
              Text("Jurusan: ${item['jurusan']}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Tutup"),
            ),
          ],
        );
      },
    );
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
                  return Card(
                    color: Colors.lightBlue[50],
                    child: ListTile(
                      title: Text(
                        item['nama'],
                        style: TextStyle(color: Colors.blue[800]),
                      ),
                      subtitle: Text(
                        item['jurusan'],
                        style: TextStyle(color: Colors.blue[600]),
                      ),
                      onTap: () => showDetailDialog(item), // Tambahkan ini
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue[700]),
                            onPressed: () => isiFormUntukEdit(item),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.blue[900]),
                            onPressed: () => hapusData(item['id']),
                          ),
                        ],
                      ),
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
