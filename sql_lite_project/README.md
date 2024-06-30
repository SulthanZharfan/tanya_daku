# Aplikasi Manajemen Mahasiswa

Ini adalah aplikasi Flutter sederhana untuk mengelola data mahasiswa menggunakan SQLite sebagai database lokal. Aplikasi ini mencakup fitur untuk menambah mahasiswa baru, mengedit informasi mahasiswa, dan menghapus data mahasiswa. Aplikasi ini juga memiliki layar login untuk admin.

## Tampilan Aplikasi

### Halaman Login
<img src="https://raw.githubusercontent.com/adiwp/MobileProjects/main/sql_lite_project/documentation/ss_login.png" width="250px">

### Halaman Utama (Daftar Mahasiswa)
<img src="https://raw.githubusercontent.com/adiwp/MobileProjects/main/sql_lite_project/documentation/ss_home.png" width="250px">

### Halaman Tambah Mahasiswa
<img src="https://raw.githubusercontent.com/adiwp/MobileProjects/main/sql_lite_project/documentation/ss_tambah_mahasiswa.png" width="250px">

### Halaman Edit Mahasiswa
<img src="https://raw.githubusercontent.com/adiwp/MobileProjects/main/sql_lite_project/documentation/ss_edit_mahasiswa.png" width="250px">


## Fitur

- Login admin
- Tambah mahasiswa baru
- Edit informasi mahasiswa
- Hapus mahasiswa
- Daftar semua mahasiswa

## Paket yang Digunakan

- `flutter`: SDK Flutter untuk membangun aplikasi.
- `path`: Untuk memanipulasi path sistem file.
- `path_provider`: Untuk menemukan lokasi yang umum digunakan pada sistem file.
- `sqlite3`: Untuk menggunakan database SQLite langsung dari Dart.
- `sqlite3_flutter_libs`: Untuk menyediakan pustaka dinamis SQLite yang diperlukan oleh aplikasi pada berbagai platform.

## Memulai

### Prasyarat

- Flutter SDK: [Instal Flutter](https://flutter.dev/docs/get-started/install)
- Editor kode seperti Visual Studio Code atau Android Studio

### Instalasi

1. Clone repositori:

    ```bash
    git clone https://github.com/username/sql_lite_project.git
    cd sql_lite_project
    ```

2. Instal dependensi:

    ```bash
    flutter pub get
    ```

3. Jalankan aplikasi:

    ```bash
    flutter run
    ```

## Struktur Proyek

```plaintext
lib/
├── database_helper.dart
├── login_page.dart
├── main_page.dart
├── student_form_page.dart
├── main.dart
```

## Penjelasan File Utama

`main.dart`
Titik masuk aplikasi. File ini menginisialisasi database dan menjalankan widget MyApp.

`database_helper.dart`
Mengandung kelas DatabaseHelper yang mengelola database SQLite. Termasuk metode untuk menginisialisasi database, membuat tabel, dan melakukan operasi CRUD.

`login_page.dart`
Mendefinisikan widget LoginPage yang menyediakan fungsi login untuk admin. Kredensial default dikodekan untuk kesederhanaan.

`main_page.dart`
Mendefinisikan widget MainPage yang menampilkan daftar mahasiswa. Termasuk tombol untuk menambah mahasiswa baru, mengedit, dan menghapus mahasiswa yang sudah ada.

`student_form_page.dart`
Mendefinisikan widget StudentFormPage yang menyediakan formulir untuk menambah atau mengedit informasi mahasiswa.

## Penjelasan tentang Implementasi

### database_helper

- Konstruktor
  ```dart
   static final DatabaseHelper instance = DatabaseHelper._init();
   DatabaseHelper._init();
  ```
  DatabaseHelper menggunakan pola singleton untuk memastikan hanya ada satu instance dari database yang aktif. Ini dilakukan dengan mendefinisikan konstruktor privat (_init) dan satu instance statis (instance).
- Inisialisasi Database
  ```dart
   Future<Database> get database async {
      if (_database != null) return _database!;
      _database = await _initDB('students.db');
      return _database!;
   }
  ```
  Method get database mengembalikan instance database jika sudah ada, atau menginisialisasinya jika belum ada.
- Membuat Tabel
  ```dart
   Future<void> createTables(Database db) async {
    db.execute('''
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT,
        major TEXT NOT NULL,
        origin TEXT NOT NULL
      )
    ''');
   }
  ```
  Method createTables digunakan untuk membuat tabel students jika belum ada. Tabel ini memiliki kolom id, name, email, major, dan origin.
- Operasi CRUD
   - **Insert**
     ```dart
      Future<void> insertStudent(Map<String, dynamic> student) async {
       final db = await database;
       db.execute('''
       INSERT INTO students (name, email, major, origin) VALUES (?, ?, ?, ?)
       ''', [student['name'], student['email'], student['major'], student['origin']]);
      }
     ```
     Method insertStudent digunakan untuk menambahkan data mahasiswa baru ke dalam tabel students.
   - **Read**
     ```dart
      Future<List<Map<String, dynamic>>> getStudents() async {
       final db = await database;
       final result = db.select('SELECT * FROM students');
       return result.map((row) => {
         'id': row['id'],
         'name': row['name'],
         'email': row['email'],
         'major': row['major'],
         'origin': row['origin']
       }).toList();
      }
     ```
     Method getStudents digunakan untuk mengambil semua data mahasiswa dari tabel students.
   - **Update**
     ```dart
      Future<void> updateStudent(Map<String, dynamic> student) async {
       final db = await database;
       int id = int.parse(student['id']);
       db.execute('''
          UPDATE students SET name = ?, email = ?, major = ?, origin = ? WHERE id = ?
          ''', [student['name'], student['email'], student['major'], student['origin'], id]);
      }
     ```
     Method updateStudent digunakan untuk memperbarui data mahasiswa yang ada dalam tabel students.
   - **Delete**
     ```dart
      Future<void> deleteStudent(int id) async {
       final db = await database;
       db.execute('DELETE FROM students WHERE id = ?', [id]);
      }
     ```
     Method deleteStudent digunakan untuk menghapus data mahasiswa dari tabel students berdasarkan id.
