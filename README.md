# Flutter Portal News App

Aplikasi Flutter sederhana yang menampilkan portal berita dengan navigasi antar halaman seperti **Kategori**, **Beranda**, dan **Profil**. Aplikasi ini juga mendukung fitur **autentikasi pengguna (login dan register)** menggunakan `SharedPreferences`.

## 📱 Fitur Utama

- Navigasi bawah (Bottom Navigation Bar) menggunakan `CurvedNavigationBar`
- Tiga halaman utama:
  - 🏠 **Beranda** (Home)
  - 📂 **Kategori** (Kategori Berita)
  - 👤 **Profil** (Login/Register)
- Autentikasi pengguna (login, logout, register)
- Menyimpan data pengguna menggunakan `SharedPreferences`
- Tampilan dinamis pada halaman profil berdasarkan status login
- Notifikasi berhasil logout menggunakan `Fluttertoast`

## 🧱 Struktur Halaman

- `main.dart`: Halaman utama yang mengatur bottom navigation bar dan navigasi antar halaman.
- `home.dart`: Halaman beranda (konten berita dapat dikembangkan lebih lanjut).
- `kategori.dart`: Halaman kategori berita.
- `profil.dart`: Halaman profil yang menampilkan tombol login dan daftar jika belum login, atau nama pengguna dan tombol logout jika sudah login.
- `formlogin.dart` & `formregist.dart`: Formulir untuk login dan registrasi akun baru.

## 💾 Penyimpanan Data Login

Data `username` dan `token` disimpan menggunakan `SharedPreferences`. Saat pengguna logout, data akan dihapus agar tampilan kembali seperti awal.

## 🔧 Teknologi & Package yang Digunakan

- Flutter SDK
- `curved_navigation_bar`: Navigasi bawah
- `shared_preferences`: Penyimpanan data lokal
- `fluttertoast`: Notifikasi sederhana

## 🚀 Cara Menjalankan Proyek

1. Clone repositori ini:
   ```bash
   git clone https://github.com/username/nama-repo.git
   cd nama-repo
   
2. Install dependensi:
flutter pub get

3. Jalankan aplikasi:
flutter run
