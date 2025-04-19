import 'package:arbmkg_sli/models/model_viewerArgs.dart';
import 'package:arbmkg_sli/models/video_content.dart';
import 'package:arbmkg_sli/models/web_url.dart';
import 'package:arbmkg_sli/screens/page%20models/base_page.dart';
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class MenuUtamaScreen extends BaseMenuScreen {
  static final videoContent = VideoContent(
    id: 'menu_utama',
    title: 'Menu Utama',
    videoUrls: {
      'Indonesia':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      'Sunda':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
      'Jawa':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    },
  );

  static final modelViewer = ModelViewerArgs(
    modelName: "2CylinderEngine",
    modelPath: 'assets/objects/2CylinderEngine.glb',
  );

  static final webargs =
      WebUrl('https://www.bmkg.go.id/', 'Local Wisdom Repository');

  MenuUtamaScreen({super.key})
      : super(
          title: 'Menu Utama',
          thumbnailPath: 'assets/images/Thumbnail.png',
          isCenter: false,
          isBuildTopIcons: true,
          showPlayButton: true,
          routeNameVideo: AppRoutes.videoPlayerPage,
          videoArguments: videoContent,
          modelArgs: modelViewer,
          webArgs: webargs,
          menuButtons: [
            MenuButtonConfig(
              imagePath: 'assets/buttons/Menu Utama/1 Pegenalan SLI.png',
              routeName: AppRoutes.pengenalanSli,
            ),
            MenuButtonConfig(
              imagePath:
                  'assets/buttons/Menu Utama/2 Instrumen Alat Ukur Cuaca.png',
              routeName: AppRoutes.instrumenAlatUkurCuaca,
            ),
            MenuButtonConfig(
              imagePath: 'assets/buttons/Menu Utama/3 Fisis.png',
              routeName: AppRoutes.fisisPage,
            ),
            MenuButtonConfig(
              imagePath: 'assets/buttons/Menu Utama/4 Iklim.png',
              routeName: AppRoutes.produkBMKG,
            ),
            MenuButtonConfig(
              imagePath:
                  'assets/buttons/Menu Utama/5 Local Wisdom Repository.png',
              routeName: AppRoutes.web,
            ),
          ],
          appBarTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        );
}
