import 'package:flutter/material.dart';
import 'detail.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

final String linkAPI =
    'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=09696db108e845418fa04b5aa2abc79b';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List> getData() async {
    final response = await http.get(Uri.parse(linkAPI));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  Widget containerBerita(
    String datetime,
    String title,
    String description,
    String image,
  ) {
    return MaterialButton(
      splashColor: Colors.white,
      highlightColor: Colors.white,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              judul: title,
              content: description,
              datetime: datetime,
              image: image,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue, width: 3),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Image.network(image, height: 100, fit: BoxFit.cover),
            ),
            SizedBox(width: 10),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text(
                      datetime,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(fontSize: 12),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Portal Berita')),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, i) {
              var article = snapshot.data![i];
              return containerBerita(
                article['publishedAt'] ?? '',
                article['title'] ?? 'No title',
                article['description'] ?? 'No description',
                article['urlToImage'] ??
                    'https://via.placeholder.com/150x100.png?text=No+Image',
              );
            },
          );
        },
      ),
    );
  }
}
