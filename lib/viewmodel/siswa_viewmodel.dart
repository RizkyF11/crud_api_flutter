import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/siswa_Model.dart';

class SiswaViewmodel extends ChangeNotifier {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();

  Future<bool> insertSiswa() async {
    final siswa = SiswaModel(
      nama: namaController.text,
      kelas: kelasController.text,
    );

    final response = await http.post(
        Uri.parse('https://api.fajarms.fun/insert.php'),
        body: siswa.toJson());

    return response.statusCode == 200;
  }

  void clearForm() {
    namaController.clear();
    kelasController.clear();
    notifyListeners();
  }
}
