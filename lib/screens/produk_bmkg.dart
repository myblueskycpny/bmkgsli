import 'package:arbmkg_sli/models/iklim_args.dart';
import 'package:arbmkg_sli/routes/app_routes.dart';
import 'package:arbmkg_sli/screens/page%20models/base_page.dart';
import 'package:flutter/material.dart';

class ProdukBmkg extends BaseMenuScreen {
  ProdukBmkg({super.key})
      : super(
          title: 'Pemahaman Produk Iklim BMKG',
          isCenter: true,
          showPlayButton: true,
          showAppBarActions: true,
          isBuildTopIcons: false,
          showThumbnail: false,
          menuButtons: [
            MenuButtonConfig(
              imagePath: 'assets/buttons/Iklim/PCH.png',
              routeName: AppRoutes.produkIklim,
              arguments: IklimArgs(
                imageUrl:
                    'https://cews.bmkg.go.id/robiganstatic/PRODUK_UPDATE/PCH_BLN/pch_bln_det_step1.png',
                headerText: "Prakiraan Curah Hujan",
                descriptionText:
                    "Prakiraan curah hujan memperkirakan jumlah dan distribusi hujan di suatu wilayah selama periode tertentu. Data ini penting untuk perencanaan dalam sektor pertanian, pengelolaan air, dan mitigasi risiko bencana. Prakiraan yang akurat memungkinkan penentuan waktu tanam, pengaturan irigasi, dan antisipasi dampak negatif seperti banjir atau kekeringan yang memengaruhi produksi dan kegiatan masyarakat.",
                webUrl: "https://iklim.bmkg.go.id/",
              ),
            ),
            MenuButtonConfig(
              imagePath: 'assets/buttons/Iklim/ACH.png',
              routeName: AppRoutes.produkIklim,
              arguments: IklimArgs(
                imageUrl:
                    'https://cews.bmkg.go.id/robiganstatic/PRODUK_UPDATE/ACH_BLN/ach_bln.png',
                headerText: "Analisis Curah Hujan",
                descriptionText:
                    "Analisis curah hujan melibatkan pengkajian data hujan untuk memahami pola, tren, dan variasi curah hujan di suatu daerah. Proses ini membantu dalam mengidentifikasi perubahan iklim dan anomali yang memengaruhi siklus hidrologi. Analisis digunakan dalam perencanaan pengelolaan air, mitigasi kekeringan, serta prediksi risiko banjir, yang penting bagi pertanian dan pengembangan wilayah.",
                webUrl: "https://iklim.bmkg.go.id/",
              ),
            ),
            MenuButtonConfig(
              imagePath: 'assets/buttons/Iklim/ENSO.png',
              routeName: AppRoutes.produkIklim,
              arguments: IklimArgs(
                imageUrl:
                    'https://cews.bmkg.go.id/operational-early-warning-pdi/0_Latest/Global_SSTA_latest.png',
                headerText: "ENSO",
                descriptionText:
                    "ENSO adalah fenomena iklim yang mencakup dua kondisi, El Niño dan La Niña, yang memengaruhi pola cuaca global. El Niño memanaskan perairan Pasifik, meningkatkan curah hujan di beberapa daerah dan menyebabkan kekeringan di tempat lain, sementara La Niña mendinginkan perairan, memicu pola cuaca sebaliknya. Dampaknya dirasakan pada pertanian, kelautan, dan cuaca ekstrem.",
                webUrl: "https://iklim.bmkg.go.id/",
              ),
            ),
            MenuButtonConfig(
              imagePath: 'assets/buttons/Iklim/SPI.png',
              routeName: AppRoutes.produkIklim,
              arguments: IklimArgs(
                imageUrl:
                    'https://cews.bmkg.go.id/robiganstatic/PRODUK_UPDATE/ANSPI/anspi1.png',
                headerText: "SPI",
                descriptionText:
                    "SPI adalah indeks yang digunakan untuk mengukur kondisi kekeringan atau kelebihan hujan di suatu area. Menggunakan data curah hujan historis, SPI menggambarkan anomali dalam curah hujan relatif terhadap rata-rata, memudahkan pemantauan kekeringan dan kelebihan air. Indeks ini membantu dalam pengelolaan sumber daya air dan mitigasi risiko kekeringan pada pertanian.",
                webUrl: "https://iklim.bmkg.go.id/",
              ),
            ),
            MenuButtonConfig(
              imagePath: 'assets/buttons/Iklim/ATI.png',
              routeName: AppRoutes.produkIklim,
              arguments: IklimArgs(
                imageUrl:
                    'https://cews.bmkg.go.id/tempatikl/reports/sourceATi/ATi_update.png',
                headerText: "ATI",
                descriptionText:
                    "ATI menunjukkan jumlah air yang tersedia di dalam tanah untuk tanaman, yang penting dalam mendukung pertumbuhan dan kesehatan tanaman. Data ATI mempermudah pengaturan kebutuhan air dalam pertanian, mengurangi risiko stres tanaman akibat kekurangan air, dan mendukung pengelolaan kondisi tanah agar tetap subur serta mampu menunjang produksi yang optimal.",
                webUrl: "https://iklim.bmkg.go.id/",
              ),
            ),
            MenuButtonConfig(
              imagePath: 'assets/buttons/Iklim/HTH.png',
              routeName: AppRoutes.produkIklim,
              arguments: IklimArgs(
                imageUrl: 'https://cews.bmkg.go.id/Peta/Hari_Tanpa_Hujan.png',
                headerText: "Hari Tanpa Hujan",
                descriptionText:
                    "Hari tanpa hujan adalah periode berkelanjutan tanpa curah hujan, yang menjadi indikator untuk memantau risiko kekeringan di suatu wilayah. Pemantauan ini membantu dalam memperkirakan dampak kekeringan, yang memengaruhi tanaman, sumber daya air, dan ekosistem. Penghitungan hari tanpa hujan mendukung pengelolaan air yang lebih efektif dan persiapan menghadapi kondisi kering.",
                webUrl: "https://iklim.bmkg.go.id/",
              ),
            ),
            MenuButtonConfig(
              imagePath: 'assets/buttons/Iklim/PMusim.png',
              routeName: AppRoutes.produkIklim,
              arguments: IklimArgs(
                imageUrl:
                    'https://cews.bmkg.go.id/tempatpdi/repoAR/awal-musim-update.png',
                headerText: "Prakiraan Musim",
                descriptionText:
                    "Prakiraan musim adalah proyeksi perubahan iklim selama satu musim, meliputi curah hujan, suhu, dan pola angin. Informasi ini mendukung perencanaan pada sektor pertanian, energi, dan lingkungan. Prakiraan yang tepat membantu mitigasi risiko bencana akibat cuaca ekstrem musiman, seperti kekeringan atau banjir, yang dapat memengaruhi produksi pangan serta kesejahteraan masyarakat.",
                webUrl: "https://iklim.bmkg.go.id/",
              ),
            ),
          ],
          customHeader: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 19),
              child: Text(
                "MENU",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          appBarTextStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        );
}
