import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  int _currentIndex = 0; // Variabel untuk menyimpan indeks halaman saat ini
  final List<String> items = [
    'assets/images/hikaru-mizuno.jpeg', // Ganti dengan path gambar Anda
    'assets/images/hikaru-mizuno.jpeg', // Ganti dengan path gambar Anda
  ]; // Daftar gambar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel'),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              viewportFraction: 0.8,
              enlargeCenterPage: false,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: items.map((imageUrl) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12), // Terapkan border radius
                  child: Stack(
                    children: [
                      // Foto
                      Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity, // Buat selebar mungkin
                        height: double.infinity, // Buat setinggi mungkin
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          color: Colors.red.withOpacity(0.7),
                          // Latar belakang semi-transparan
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                          child: const Text(
                            'Judul Thumbnail',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          if (items.length > 1)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: items.asMap().entries.map((entry) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _currentIndex == entry.key ? 20.0 : 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: _currentIndex == entry.key ? Colors.red : Colors.grey,
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}
