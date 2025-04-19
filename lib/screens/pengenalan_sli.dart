import 'package:arbmkg_sli/models/video_content.dart';
import 'package:arbmkg_sli/screens/page%20models/detail_base_page.dart';
import 'package:flutter/material.dart';

class PengenalanSliScreen extends DetailBasePage {
  static final videoContent = VideoContent(
    id: 'instrumen_ukur_cuaca',
    title: 'Instrumen Alat Ukur Cuaca',
    videoUrls: {
      'Indonesia':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      'Sunda':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
      'Jawa':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    },
  );
  PengenalanSliScreen({super.key})
      : super(
          title: 'Pengenalan Sekolah Lapang Iklim',
          thumbnailPath: 'assets/images/Thumbnail.png',
          buttonName: "Lihat Secara Virtual",
          showPlayButton: true,
          videoArguments: videoContent,
          description:
              "Sekolah Lapangan Iklim (SLI) adalah program pendidikan bagi petani dan komunitas lokal untuk memahami informasi cuaca dan iklim, serta penerapannya dalam pertanian. Program ini mengajarkan peserta cara membaca data iklim, seperti curah hujan, suhu, dan kelembaban, untuk mendukung praktik pertanian yang lebih adaptif. Melalui SLI, peserta memperoleh pengetahuan tentang prediksi cuaca dan teknik mitigasi risiko iklim, membantu mengurangi dampak negatif perubahan iklim terhadap hasil panen. Tujuan SLI adalah membangun ketahanan pangan melalui peningkatan pemahaman iklim di kalangan petani, mendorong mereka untuk membuat keputusan yang lebih tepat dan berkelanjutan dalam pengelolaan lahan dan tanaman.",
          customHeader: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 19),
              child: Text(
                "PENGENALAN SEKOLAH LAPANG IKLIM",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
}
