class Senjata {
  String nama;
  int kekuatan;

  // Constructor dengan parameter input nama dan kekuatan
  Senjata({required this.nama, required this.kekuatan});

  // Method getTambahKekuatanSerang
  int getTambahKekuatanSerang() {
    return kekuatan * 2;
  }

  // Method getNama
  String getNama() {
    return nama;
  }
}