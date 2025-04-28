class SiswaModel {
  String nama;
  String kelas;

  SiswaModel({required this.nama, required this.kelas});

  Map<String, String> toJson() {
    return {
      'nama': nama,
      'kelas': kelas,
    };
  }
}
