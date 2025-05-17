import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistPage extends StatefulWidget {
  @override
  _RegistPageState createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController pass2Controller = TextEditingController();

  // Fungsi untuk menambahkan data pengguna
  Future<void> addDataUser() async {
    final username = userController.text.trim();
    final password = passController.text.trim();
    final confirmPassword = pass2Controller.text.trim();

    if (username.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        password == confirmPassword) {
      final url = Uri.parse('https://e-commerce-store.glitch.me/signup');

      try {
        final response = await http.post(
          url,
          body: {
            "username": username,
            "password": password,
          },
        );

        if (response.statusCode == 200) {
          _showToast("Registrasi berhasil.");
          Navigator.pop(context);
        } else {
          _showToast("Registrasi gagal. Coba lagi.");
        }
      } catch (e) {
        _showToast("Terjadi kesalahan. Pastikan Anda terhubung ke internet.");
      }
    } else {
      userController.clear();
      passController.clear();
      pass2Controller.clear();
      _showToast("Pastikan semua kolom terisi dengan benar.");
    }
  }

  void _showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 3)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Registrasi',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: userController,
                  decoration: InputDecoration(hintText: "Username"),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: passController,
                  decoration: InputDecoration(hintText: "Password"),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: pass2Controller,
                  decoration: InputDecoration(hintText: "Konfirmasi Password"),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Back',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                      ),
                      onPressed: addDataUser,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
