import 'package:crud_api/viewmodel/siswa_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InsertPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  InsertPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SiswaViewmodel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Input Siswa')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: vm.namaController,
                decoration: const InputDecoration(labelText: 'Nama'),
                validator: (value) =>
                    value!.isEmpty ? 'nama tidak boleh kosong' : null,
              ),
              TextFormField(
                controller: vm.kelasController,
                decoration: const InputDecoration(labelText: 'Kelas'),
                validator: (value) =>
                    value!.isEmpty ? 'Kelas tidak boleh kosong' : null,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  child: const Text("Simpan"),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      bool success = await vm.insertSiswa();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(success
                              ? 'Data berhasil disimpan'
                              : "gagal menimpan data",
                        ),
                      ),
                      );
                      if (success) vm.clearForm();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
