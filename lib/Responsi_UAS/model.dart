class Lagu {
  final String kodeLagu;
  final String judulLagu;
  final String pencipta;
  final String penyanyi;
  final String jenis;
  final String gambar; // bisa berupa URL gambar

  Lagu({
    required this.kodeLagu,
    required this.judulLagu,
    required this.pencipta,
    required this.penyanyi,
    required this.jenis,
    required this.gambar,
  });

  factory Lagu.fromJson(Map<String, dynamic> json) {
    return Lagu(
      kodeLagu: json['kode_lagu'],
      judulLagu: json['judul_lagu'],
      pencipta: json['pencipta'],
      penyanyi: json['penyanyi'],
      jenis: json['jenis'],
      gambar: json['gambar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kode_lagu': kodeLagu,
      'judul_lagu': judulLagu,
      'pencipta': pencipta,
      'penyanyi': penyanyi,
      'jenis': jenis,
      'gambar': gambar,
    };
  }
}
