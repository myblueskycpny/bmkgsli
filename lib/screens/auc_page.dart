import 'package:arbmkg_sli/routes/app_routes.dart';
import 'package:arbmkg_sli/screens/page%20models/base_page.dart';
import 'package:flutter/material.dart';
import 'package:arbmkg_sli/models/video_content.dart';

class AucPage extends BaseMenuScreen {
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
  AucPage({super.key})
      : super(
          title: 'Instrumen Alat Ukur Cuaca',
          isCenter: true,
          showPlayButton: true,
          showAppBarActions: true,
          isBuildTopIcons: false,
          thumbnailPath: 'assets/images/Thumbnail.png',
          routeNameVideo: AppRoutes.videoPlayerPage,
          videoArguments: videoContent,
          menuButtons: [
            MenuButtonConfig(
              imagePath: 'assets/buttons/Alat Ukur Cuaca/panci.png',
              routeName: AppRoutes.pengenalanSli,
            ),
            MenuButtonConfig(
              imagePath: 'assets/buttons/Alat Ukur Cuaca/penakarhujan.png',
              routeName: "",
            ),
            MenuButtonConfig(
              imagePath: 'assets/buttons/Alat Ukur Cuaca/campbellstokes.png',
              routeName: "",
            ),
            MenuButtonConfig(
              imagePath: 'assets/buttons/Alat Ukur Cuaca/stevenson.png',
              routeName: "",
            ),
          ],
          customHeader: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 19),
              child: Text(
                "PILIH INSTRUMEN",
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
