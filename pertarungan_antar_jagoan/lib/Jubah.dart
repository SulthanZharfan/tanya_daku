class Jubah {
  String nama;
  int kekuatan;
  int kesehatan;

  // Constructor dengan parameter input nama, kekuatan, dan kesehatan
  Jubah({required this.nama, required this.kekuatan, required this.kesehatan});

  // Method getTambahKesehatan
  int getTambahKesehatan() {
    return kesehatan * 10;
  }

  // Method getNilaiKekuatan
  int getNilaiKekuatan() {
    return kekuatan * 2;
  }

  String getNama() {
    return nama;
  }
}