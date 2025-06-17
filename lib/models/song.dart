class Song {
  String kodeLagu;
  String judulLagu;
  String pencipta;
  String penyanyi;
  String jenis;
  String gambar;

  Song({
    required this.kodeLagu,
    required this.judulLagu,
    required this.pencipta,
    required this.penyanyi,
    required this.jenis,
    required this.gambar,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      kodeLagu: json['Kode_lagu'] ?? '',
      judulLagu: json['Judul_lagu'] ?? '',
      pencipta: json['Pencipta'] ?? '',
      penyanyi: json['Penyanyi'] ?? '',
      jenis: json['Jenis'] ?? '',
      gambar: json['Gambar'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Kode_lagu': kodeLagu,
      'Judul_lagu': judulLagu,
      'Pencipta': pencipta,
      'Penyanyi': penyanyi,
      'Jenis': jenis,
      'Gambar': gambar,
    };
  }

  // Tambahkan method copyWith
  Song copyWith({
    String? kodeLagu,
    String? judulLagu,
    String? pencipta,
    String? penyanyi,
    String? jenis,
    String? gambar,
  }) {
    return Song(
      kodeLagu: kodeLagu ?? this.kodeLagu,
      judulLagu: judulLagu ?? this.judulLagu,
      pencipta: pencipta ?? this.pencipta,
      penyanyi: penyanyi ?? this.penyanyi,
      jenis: jenis ?? this.jenis,
      gambar: gambar ?? this.gambar,
    );
  }
}