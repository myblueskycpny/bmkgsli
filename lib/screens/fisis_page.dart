import 'package:arbmkg_sli/models/video_content.dart';
import 'package:arbmkg_sli/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:arbmkg_sli/screens/page%20models/base_page.dart';

class FisisPage extends BaseMenuScreen {
  static final VideoContent videoContent = VideoContent(
    id: 'proses_fisis',
    title: 'Proess Fisis Atmosfer',
    videoUrls: {
      'Indonesia':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      'Sunda':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
      'Jawa':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    },
  );

  FisisPage({super.key})
      : super(
          title: 'Proses Fisis Atmosfer',
          isCenter: true,
          showPlayButton: true,
          showAppBarActions: true,
          isBuildTopIcons: false,
          thumbnailPath: 'assets/images/Thumbnail.png',
          routeNameVideo: AppRoutes.videoPlayerPage,
          videoArguments: videoContent,
          menuButtons: [
            MenuButtonConfig(
              imagePath: 'assets/buttons/Fisis/PM.png',
              routeName: "",
            ),
            MenuButtonConfig(
              imagePath: 'assets/buttons/Fisis/SU.png',
              routeName: "",
            ),
            MenuButtonConfig(
              imagePath: 'assets/buttons/Fisis/KU.png',
              routeName: "",
            ),
            MenuButtonConfig(
              imagePath: 'assets/buttons/Fisis/EP.png',
              routeName: "",
            ),
            MenuButtonConfig(
              imagePath: 'assets/buttons/Fisis/PCH.png',
              routeName: "",
            ),
          ],
          customHeader: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 19),
              child: Text(
                "PILIH PROSES",
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
