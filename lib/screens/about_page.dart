import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Tentang Aplikasi',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon:
                const Icon(Icons.settings_outlined, color: Colors.transparent),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TENTANG APLIKASI SLI',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Aplikasi Augmented Reality Sekolah Lapang Iklim (SLI) dari BMKG adalah layanan untuk membantu petani dan penyuluh pertanian agar memahami informasi iklim yang berguna untuk diterapkan dalam aktivitas pertanian. Mulai dari alat ukur cuaca hingga proses fisi atmosfer dapat Anda pelajari di sini. Selamat mencoba! ',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            const Divider(
              color: Colors.grey,
              height: 1,
              thickness: 0.7,
            ),
            const SizedBox(height: 16),
            const Text(
              "VERSI",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Versi 2.0.1",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
