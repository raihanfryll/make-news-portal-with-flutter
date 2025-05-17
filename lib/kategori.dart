import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class KategoriPage extends StatefulWidget {
  @override
  _KategoriPageState createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast?.init(context); // Tambahkan inisialisasi dengan context
  }

  // Function to show the toast with category info
  Widget iconTag({required Icon icon, required String tag}) {
    return IconButton(
      icon: icon,
      onPressed: () {
        fToast?.showToast(
          toastDuration: Duration(milliseconds: 2000),
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.grey,
            ),
            child: Text('Anda memilih kategori $tag'),
          ),
        );
      },
    );
  }

  Widget kategoriSection(String title, List<Widget> iconRows) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue, width: 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Container(height: 1.5, color: Colors.grey),
          ...iconRows,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kategori Page')),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            kategoriSection("General", [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconTag(icon: Icon(Icons.attach_money), tag: 'General'),
                  iconTag(icon: Icon(Icons.card_travel), tag: 'General'),
                  iconTag(icon: Icon(Icons.local_hospital), tag: 'General'),
                ],
              ),
            ]),
            kategoriSection("Entertainment", [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconTag(icon: Icon(Icons.fastfood), tag: 'Entertainment'),
                  iconTag(icon: Icon(Icons.hotel), tag: 'Entertainment'),
                  iconTag(
                      icon: Icon(Icons.local_grocery_store),
                      tag: 'Entertainment'),
                  iconTag(icon: Icon(Icons.local_movies), tag: 'Entertainment'),
                ],
              ),
            ]),
            kategoriSection("Transportasi", [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconTag(icon: Icon(Icons.directions_bike), tag: 'Transportasi'),
                  iconTag(icon: Icon(Icons.motorcycle), tag: 'Transportasi'),
                  iconTag(icon: Icon(Icons.directions_car), tag: 'Transportasi'),
                  iconTag(icon: Icon(Icons.local_shipping), tag: 'Transportasi'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconTag(icon: Icon(Icons.directions_bus), tag: 'Transportasi'),
                  iconTag(icon: Icon(Icons.directions_boat), tag: 'Transportasi'),
                  iconTag(icon: Icon(Icons.train), tag: 'Transportasi'),
                  iconTag(
                      icon: Icon(Icons.airplanemode_active),
                      tag: 'Transportasi'),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
