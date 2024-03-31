import 'Jubah.dart';
import 'Senjata.dart';

class Jagoan {
  String nama;
  int kesehatanDasar;
  int kekuatanDasar;
  int derajat;
  int totalKerusakan;
  int kenaikanKesehatan;
  int kenaikanKekuatan;
  bool hidup;
  Jubah jubah;
  Senjata senjata;

  // Constructor dengan parameter input nama
  Jagoan({required this.nama})
      : kesehatanDasar = 100,
        kekuatanDasar = 100,
        derajat = 1,
        totalKerusakan = 0,
        kenaikanKekuatan = 10,
        kenaikanKesehatan = 10,
        hidup = true,
        jubah = Jubah(nama: '', kekuatan: 0, kesehatan: 0),
        senjata = Senjata(nama: '', kekuatan: 0);

  // Method setJubah
  void setJubah(Jubah newJubah) {
    jubah = newJubah;
  }

  // Method setSenjata
  void setSenjata(Senjata newSenjata) {
    senjata = newSenjata;
  }

  // Method getNama
  String getNama() {
    return nama;
  }

  // Method sehatMaksimal
  int sehatMaksimal() {
    return kesehatanDasar + jubah.getTambahKesehatan() +
        derajat * kenaikanKesehatan;
  }

  // Method getKekuatanSerangJagoan
  int getKekuatanSerangJagoan() {
    return kekuatanDasar + senjata.getTambahKekuatanSerang() +
        derajat * kenaikanKekuatan;
  }

  int getNilaiKesehatan() {
    return sehatMaksimal() - totalKerusakan;
  }

  void naikDerajat() {
    derajat++;
  }

  bool getStatus() {
    return hidup;
  }

  void menyerang(Jagoan lawan) {
    int kerusakan = getKekuatanSerangJagoan();

    print(
        '${nama} menyerang ${lawan.getNama()} dengan kekuatan $kerusakan');
    lawan.bertahan(kerusakan);
    this.naikDerajat();
  }

  void bertahan(int kerusakan) {
    int kekuatanBertahan = jubah.getNilaiKekuatan();
    int selisihKerusakan;

    print('${nama} memiliki kekuatan bertahan: $kekuatanBertahan');

    if (kerusakan > kekuatanBertahan) {
      selisihKerusakan = kerusakan - kekuatanBertahan;
    } else {
      selisihKerusakan = 0;
    }

    print('Kerusakan yang diperoleh $selisihKerusakan\n');

    totalKerusakan += selisihKerusakan;

    if (this.getNilaiKesehatan() <= 0) {
      hidup = false;
      totalKerusakan = this.sehatMaksimal();
    }

    this.info();
  }

  void info() {
    print('Jagoan\t\t\t\t: ${nama}');
    print('Derajat\t\t\t\t: ${derajat}');
    print('Kesehatan Dasar\t\t: ${kesehatanDasar}');
    print('Kekuatan Dasar\t\t: ${kekuatanDasar}');
    print(
        'Kesehatan\t\t\t: ${getNilaiKesehatan()} / ${sehatMaksimal()}');
    print('Kekuatan Maksimal\t: ${getKekuatanSerangJagoan()}');
  }

  void getNamaJubah() {
    print("Jubah\t\t\t: ${jubah.getNama()}");
  }

  void getNamaSenjata() {
    print("Senjata\t\t\t ${senjata.getNama()}");
  }
}
