import 'package:arbmkg_sli/screens/page%20models/produk_iklim.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'app.dart';
import 'audio manager/audio_manager.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final audioManager = AudioManager();
  await audioManager.initialize();
  runApp(
    DevicePreview(
      enabled: false, // Set to false in production
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ImageZoomState()),
          ChangeNotifierProvider(create: (_) => audioManager),
        ],
        child: const MyApp(),
      ),
    ),
  );
}
