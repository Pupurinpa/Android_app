import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '/services/api_service_uas.dart';
import 'model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Lagu>> _laguList;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _laguList = ApiService.getLagu();
  }

  void _refreshData() {
    setState(() {
      _laguList = ApiService.getLagu();
    });
  }

  Future<void> _pickImage(Function(String) onUploaded) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      String? imageUrl = await ApiService.uploadGambar(file);
      if (imageUrl != null) {
        onUploaded(imageUrl);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Upload gambar gagal')),
        );
      }
    }
  }

  void _showForm({Lagu? lagu}) {
    final kodeController = TextEditingController(text: lagu?.kodeLagu ?? '');
    final judulController = TextEditingController(text: lagu?.judulLagu ?? '');
    final penciptaController = TextEditingController(text: lagu?.pencipta ?? '');
    final penyanyiController = TextEditingController(text: lagu?.penyanyi ?? '');
    final jenisController = TextEditingController(text: lagu?.jenis ?? '');
    final gambarController = TextEditingController(text: lagu?.gambar ?? '');

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(lagu == null ? 'Tambah Lagu' : 'Edit Lagu'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: kodeController, decoration: const InputDecoration(labelText: 'Kode Lagu')),
              TextField(controller: judulController, decoration: const InputDecoration(labelText: 'Judul Lagu')),
              TextField(controller: penciptaController, decoration: const InputDecoration(labelText: 'Pencipta')),
              TextField(controller: penyanyiController, decoration: const InputDecoration(labelText: 'Penyanyi')),
              TextField(controller: jenisController, decoration: const InputDecoration(labelText: 'Jenis Lagu')),
              TextField(controller: gambarController, decoration: const InputDecoration(labelText: 'Link Gambar')),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _pickImage((url) {
                    gambarController.text = url;
                  });
                },
                child: const Text('Pilih & Upload Gambar dari Galeri'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Simpan'),
            onPressed: () async {
              final newLagu = Lagu(
                kodeLagu: kodeController.text,
                judulLagu: judulController.text,
                pencipta: penciptaController.text,
                penyanyi: penyanyiController.text,
                jenis: jenisController.text,
                gambar: gambarController.text,
              );
              bool result = lagu == null
                  ? await ApiService.addLagu(newLagu)
                  : await ApiService.updateLagu(newLagu);
              if (result) {
                Navigator.pop(context);
                _refreshData();
              }
            },
          ),
          TextButton(
            child: const Text('Batal'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  void _hapusLagu(String kodeLagu) async {
    bool result = await ApiService.deleteLagu(kodeLagu);
    if (result) _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Lagu')),
      body: FutureBuilder<List<Lagu>>(
        future: _laguList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data lagu'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) {
              final lagu = snapshot.data![index];
              return Card(
                child: ListTile(
                  leading: Image.network(
                    lagu.gambar,
                    width: 60,
                    errorBuilder: (_, __, ___) => const Icon(Icons.music_note),
                  ),
                  title: Text(lagu.judulLagu),
                  subtitle: Text('${lagu.penyanyi} • ${lagu.jenis}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _showForm(lagu: lagu),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _hapusLagu(lagu.kodeLagu),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(),
      ),
    );
  }
}
