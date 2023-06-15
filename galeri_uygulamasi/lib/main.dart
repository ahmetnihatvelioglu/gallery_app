import 'package:flutter/material.dart';

void main() {
  runApp(GaleriUygulamasi());
}

class GaleriUygulamasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Galeri Uygulaması'),
        ),
        body: GaleriWidget(),
      ),
    );
  }
}


class GaleriWidget extends StatelessWidget {
  final List<String> fotografListesi = [
    'https://picsum.photos/id/237/219/319',
    'https://picsum.photos/id/238/219/319',
    'https://picsum.photos/id/239/219/319',
    'https://picsum.photos/id/240/219/319',
    'https://picsum.photos/id/241/219/319',
    'https://picsum.photos/id/242/219/319',
    'https://picsum.photos/id/243/219/319',
    'https://picsum.photos/id/244/219/319',
    'https://picsum.photos/id/244/219/319',
    'https://picsum.photos/id/244/219/319',
    'https://picsum.photos/id/247/219/319',
    'https://picsum.photos/id/248/219/319',
    'https://picsum.photos/id/249/219/319',
    'https://picsum.photos/id/250/219/319',
    'https://picsum.photos/id/251/219/319',
    'https://picsum.photos/id/252/219/319',
    'https://picsum.photos/id/253/219/319',
    'https://picsum.photos/id/254/219/319',
    'https://picsum.photos/id/255/219/319',
    'https://picsum.photos/id/238/219/319',
  ];

@override
  Widget build(BuildContext context) {
    double en = MediaQuery.of(context).size.width + 20;
    double boy = MediaQuery.of(context).size.height + 20;
    double kutuEn = en / 5;
    double kutuBoy = (boy - 10) / 4; // Boyu 1 cm kısaltıyoruz

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // Sütun sayısı
        childAspectRatio: kutuEn / kutuBoy, // En ve boy oranı
      ),
      itemCount: fotografListesi.length,
      itemBuilder: (BuildContext context, int index) {
        String fotografUrl = fotografListesi[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BuyukFotoGoruntule(fotografUrl),
              ),
            );
          },
          child: Container(
            width: kutuEn,
            height: kutuBoy,
            child: Image.network(
              fotografUrl,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}


class BuyukFotoGoruntule extends StatelessWidget {
  final String fotografUrl;

  BuyukFotoGoruntule(this.fotografUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fotoğraf Büyütme'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: fotografUrl,
            child: Image.network(
              fotografUrl,
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width - 100,
            ),
          ),
        ),
      ),
    );
  }
}