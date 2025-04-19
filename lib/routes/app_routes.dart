// File: app_routes.dart
import 'package:arbmkg_sli/models/iklim_args.dart';
import 'package:arbmkg_sli/models/model_viewerArgs.dart';
import 'package:arbmkg_sli/models/web_url.dart';
import 'package:arbmkg_sli/screens/fisis_page.dart';
import 'package:arbmkg_sli/screens/page%20models/model_viewer.dart';
import 'package:arbmkg_sli/screens/page%20models/produk_iklim.dart';
import 'package:arbmkg_sli/screens/produk_bmkg.dart';
import 'package:arbmkg_sli/screens/page%20models/videoplayer_page.dart';
import 'package:flutter/material.dart';
import '../screens/pengenalan_sli.dart';
import '../screens/webview_page.dart';
import '../screens/settings_page.dart';
import '../screens/about_page.dart';
import '../screens/auc_page.dart';
import '../models/video_content.dart';

class AppRoutes {
  static const String pengenalanSli = '/pengenalan-sli';
  static const String produkBMKG = '/produk-bmkg';
  static const String localWisdom = '/local-wisdom';
  static const String web = '/webview-page';
  static const String fisisPage = '/fisis-page';
  static const String settingPage = '/setting-page';
  static const String aboutPage = '/about-page';
  static const String instrumenAlatUkurCuaca = '/auc-page';
  static const String produkIklim = '/produk-iklim';
  static const String videoPlayerPage = '/video-menu-utama';
  static const String modelViewer = '/model-viewer';

  static Map<String, WidgetBuilder> routes = {
    pengenalanSli: (context) => PengenalanSliScreen(),
    localWisdom: (context) => const WebviewPage(
          url: 'https://www.bmkg.go.id/',
          title: 'Local Wisdom Repository',
        ),
    settingPage: (context) => const SettingsPage(),
    aboutPage: (context) => const AboutPage(),
    fisisPage: (context) => FisisPage(),
    instrumenAlatUkurCuaca: (context) => AucPage(),
    produkBMKG: (context) => ProdukBmkg(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case videoPlayerPage:
        final VideoContent videoContent = settings.arguments as VideoContent;
        return MaterialPageRoute(
          builder: (context) => VideoPlayerPage(videoContent: videoContent),
        );
      case modelViewer:
        final args = settings.arguments as ModelViewerArgs;
        return MaterialPageRoute(
          builder: (context) => ModelViewerPage(
            modelName: args.modelName,
            modelPath: args.modelPath,
            modelParts: args.modelParts,
          ),
        );
      case web:
        final WebUrl args = settings.arguments as WebUrl;
        return MaterialPageRoute(
          builder: (context) => WebviewPage(
            url: args.url,
            title: args.title,
          ),
        );
      case produkIklim:
        final IklimArgs iklimArgs = settings.arguments as IklimArgs;
        return MaterialPageRoute(
          builder: (context) => ClimateProductPage(iklimArgs: iklimArgs),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
