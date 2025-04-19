import 'package:arbmkg_sli/models/iklim_args.dart';
import 'package:arbmkg_sli/models/web_url.dart';
import 'package:arbmkg_sli/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ClimateProductPage extends StatefulWidget {
  final IklimArgs iklimArgs;
  const ClimateProductPage({
    super.key,
    required this.iklimArgs,
  });

  @override
  State<ClimateProductPage> createState() => _ClimateProductPageState();
}

class _ClimateProductPageState extends State<ClimateProductPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pemahaman Produk Iklim BMKG',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.settingPage);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: screenHeight * 0.1, // Space for fixed button
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar dengan zoom
                Consumer<ImageZoomState>(
                  builder: (context, state, child) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageZoomPage(
                              headerText: widget.iklimArgs.headerText,
                              imageUrl: widget.iklimArgs.imageUrl,
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: CachedNetworkImage(
                                imageUrl: widget.iklimArgs.imageUrl,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: ElevatedButton(
                              onPressed: () {
                                state.toggleZoom();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ImageZoomPage(
                                      imageUrl: widget.iklimArgs.imageUrl,
                                      headerText: widget.iklimArgs.headerText,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                backgroundColor: const Color(0xFF0183FF),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.zoom_in,
                                      size: 16, color: Colors.white),
                                  SizedBox(width: 4),
                                  Text(
                                    'Perbesar',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),

                // Header
                Text(
                  widget.iklimArgs.headerText,
                  style: TextStyle(
                    fontSize: screenWidth < 400 ? 16 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Deskripsi
                Text(
                  widget.iklimArgs.descriptionText,
                  style: TextStyle(
                    fontSize: screenWidth < 400 ? 13 : 14,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: // Fixed bottom button
          Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.web,
                arguments: WebUrl(
                  widget.iklimArgs.webUrl,
                  'Pemahaman Produk Iklim BMKG',
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF003052),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.black, width: 1),
              ),
              minimumSize: Size(screenWidth * 0.9, 50),
            ),
            child: const Text(
              'Lihat Lebih Lengkap di Web',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageZoomState extends ChangeNotifier {
  bool _isZoomed = false;

  bool get isZoomed => _isZoomed;

  void toggleZoom() {
    _isZoomed = !_isZoomed;
    notifyListeners();
  }
}

// Full screen zoomable image page
class ImageZoomPage extends StatefulWidget {
  final String imageUrl;
  final String headerText;

  const ImageZoomPage({
    super.key,
    this.imageUrl =
        "https://cews.bmkg.go.id/robiganstatic/PRODUK_UPDATE/PCH_BLN/pch_bln_det_step1.png",
    this.headerText = "Prakiraan Curah Hujan",
  });

  @override
  State<ImageZoomPage> createState() => _ImageZoomPageState();
}

class _ImageZoomPageState extends State<ImageZoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.headerText,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: PhotoView(
        imageProvider: NetworkImage(
          widget.imageUrl,
        ),
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 3,
        initialScale: PhotoViewComputedScale.contained,
        loadingBuilder: (context, event) => Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
            ),
          ),
        ),
        errorBuilder: (context, error, stackTrace) => const Center(
          child: Icon(Icons.error, color: Colors.red),
        ),
      ),
    );
  }
}
