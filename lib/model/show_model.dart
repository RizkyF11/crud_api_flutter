class ShowModel {
  String? id;
  String? nama;
  String? kelas;

  ShowModel({this.id, this.nama, this.kelas});

  ShowModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    kelas = json['kelas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['kelas'] = this.kelas;
    return data;
  }

  static List<ShowModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ShowModel.fromJson(json)).toList();
  }
}