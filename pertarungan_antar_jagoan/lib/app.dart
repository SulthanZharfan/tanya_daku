import 'Jagoan.dart';
import 'Jubah.dart';
import 'Senjata.dart';

void main() {
  // Membuat objek jagoan, jubah, dan senjata
  Jagoan pitung = Jagoan(nama: 'Pitung');
  Jubah jubahSilatPutih = Jubah(nama: 'Jubah Silat Putih', kekuatan: 7, kesehatan: 50);
  Senjata golok = Senjata(nama: 'Golok', kekuatan: 20);

  // Mengatur jubah dan senjata untuk jagoan Pitung
  pitung.setJubah(jubahSilatPutih);
  pitung.setSenjata(golok);

  // Membuat objek jagoan, jubah, dan senjata
  Jagoan jakaSembung = Jagoan(nama: 'Jaka Sembung');
  Jubah jubahSilatHitam = Jubah(nama: 'Jubah Silat Hitam', kekuatan: 10, kesehatan: 50);
  Senjata toya = Senjata(nama: 'Toya', kekuatan: 25);

  // Mengatur jubah dan senjata untuk jagoan Jaka Sembung
  jakaSembung.setJubah(jubahSilatHitam);
  jakaSembung.setSenjata(toya);

  // Menampilkan informasi jagoan
  print('${pitung.getNama()} memiliki sehat maksimal: ${pitung.sehatMaksimal()}');
  print('${jakaSembung.getNama()} memiliki sehat maksimal: ${jakaSembung.sehatMaksimal()}');

  pitung.info();
  jakaSembung.info();

  jakaSembung.menyerang(pitung);
  jakaSembung.menyerang(pitung);
  jakaSembung.menyerang(pitung);
  jakaSembung.menyerang(pitung);

  pitung.menyerang(jakaSembung);
  pitung.menyerang(jakaSembung);
  pitung.menyerang(jakaSembung);
  pitung.menyerang(jakaSembung);

  print("${pitung.getNama()} : ${pitung.getNilaiKesehatan()}");
  print("${jakaSembung.getNama()} :  ${jakaSembung.getNilaiKesehatan()}");

  if (pitung.getStatus() && jakaSembung.getStatus() == false) {
    print("${pitung.getNama()} menang cuy!");
  } else if (pitung.getStatus() == false && jakaSembung.getStatus()) {
    print("${jakaSembung.getNama()} menang cuy!");
  } else {
    if (pitung.getNilaiKesehatan() > jakaSembung.getNilaiKesehatan()) {
      print("${pitung.getNama()}  menang cuy!");
    } else if (pitung.getNilaiKesehatan() < jakaSembung.getNilaiKesehatan()) {
      print("${jakaSembung.getNama()} menang cuy!");
    } else {
      print("Kedua jagoan seri, cuy!");
    }
  }

}
