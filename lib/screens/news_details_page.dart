import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

Future<Map<String, String>> fetchNewsDetails(String url) async {
  try {
    // Mengambil HTML dari URL
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final document = parse(response.body);

      // Mendapatkan meta tag untuk judul
      final metaTitle = document.getElementsByTagName('meta').firstWhere((meta) => meta.attributes['property'] == 'og:title');
      final title = metaTitle.attributes['content'] ?? 'Judul tidak ditemukan';

      // Mendapatkan meta tag untuk gambar
      final metaImage = document.getElementsByTagName('meta').firstWhere((meta) => meta.attributes['property'] == 'og:image');
      final imageUrl = metaImage.attributes['content'] ?? '';

      return {
        'title': title,
        'image': imageUrl,
      };
    } else {
      throw Exception('Gagal mengambil data. Status Code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Terjadi kesalahan: $e');
  }
}

class NewsDetailsPage extends StatefulWidget {
  const NewsDetailsPage({super.key});

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  String title = '';
  String imageUrl = '';
  bool isLoading = true;
  final String url = 'https://sport.detik.com/sepakbola/liga-indonesia/d-7670244/ada-4-pemain-jepang-di-piala-aff-2024';

  Future<void> _openInBrowser(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // Membuka di aplikasi eksternal seperti Chrome
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDetails();
  }

  void fetchDetails() async {
    try {
      final data = await fetchNewsDetails(url);
      setState(() {
        title = data['title'] ?? 'Tidak ada judul';
        imageUrl = data['image'] ?? '';
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Berita')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  if (imageUrl.isNotEmpty)
                    GestureDetector(
                        onTap: () {
                          _openInBrowser(url);
                        },
                        child: Image.network(imageUrl, height: 200, fit: BoxFit.cover)),
                  const SizedBox(height: 16),
                  Text(title, style: const TextStyle(fontSize: 24)),
                ],
              ),
            ),
    );
  }
}
