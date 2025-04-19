import 'package:arbmkg_sli/routes/app_routes.dart';
import 'package:arbmkg_sli/widgets/menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class BaseMenuScreen extends StatelessWidget {
  final String title;
  final String thumbnailPath;
  final bool showPlayButton;
  final VoidCallback? onPlayButtonPressed; // Tambahan: Fungsi untuk tombol play
  final bool isBuildTopIcons;
  final bool showAppBarActions;
  final bool showThumbnail;
  final List<MenuButtonConfig> menuButtons;
  final Widget? customHeader;
  final TextStyle? appBarTextStyle; // Tambahan: Gaya teks untuk AppBar
  final List<Widget>? appBarActions; // Tambahan: Widget aksi untuk AppBar
  final bool isCenter;
  final String routeNameVideo; // Tambahan: Nama rute untuk navigasi
  final Object videoArguments; // Tambahan: Argumen untuk navigasi
  final Object modelArgs; // Tambahan: Argumen model untuk navigasi
  final Object webArgs; // Tambahan: Argumen untuk navigasi ke web

  const BaseMenuScreen({
    super.key,
    required this.title,
    this.thumbnailPath = 'assets/images/Thumbnail.png',
    this.showThumbnail = true,
    required this.menuButtons,
    this.showPlayButton = false,
    this.onPlayButtonPressed, // Tambahan
    this.isBuildTopIcons = true,
    this.isCenter = false,
    this.customHeader,
    this.appBarTextStyle, // Tambahan
    this.appBarActions, // Tambahan
    this.showAppBarActions = false,
    this.routeNameVideo =
        AppRoutes.pengenalanSli, // Tambahan: Nama rute default
    this.videoArguments = const {}, // Tambahan: Argumen default
    this.modelArgs = const [], // Tambahan: Argumen model default
    this.webArgs = const [], // Tambahan: Argumen web default
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isCenter
            ? Center(
                child: Text(
                  title,
                  style: appBarTextStyle ??
                      const TextStyle(), // Gunakan gaya teks jika disediakan
                ),
              )
            : Text(
                title,
                style: appBarTextStyle ??
                    const TextStyle(), // Gunakan gaya teks jika disediakan
              ), // Tambahkan widget aksi jika ada
        actions: showAppBarActions ? _buildAppBarActions(context) : [],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                if (showThumbnail) _buildThumbnail(context),
                const SizedBox(height: 16),
                customHeader ?? _buildDefaultHeader(),
                const SizedBox(height: 16),
                ..._buildMenuButtons(context),
              ],
            ),
          ),
          if (isBuildTopIcons) _buildTopIcons(context),
        ],
      ),
    );
  }

  Widget _buildThumbnail(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          thumbnailPath,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        if (showPlayButton)
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                routeNameVideo,
                arguments: videoArguments,
              ); // Navigasi ke rute video
            }, // Panggil fungsi jika disediakan
            icon: SvgPicture.asset("assets/icons/playButton.svg"),
          ),
      ],
    );
  }

  Widget _buildDefaultHeader() {
    return const Padding(
      padding: EdgeInsets.only(left: 19),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'MENU',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  List<Widget> _buildMenuButtons(BuildContext context) {
    return menuButtons
        .map((config) => MenuButton(
              imagePath: config.imagePath,
              onTap: () {
                if (config.routeName != null) {
                  Navigator.pushNamed(context, config.routeName!,
                      arguments: config.routeName == AppRoutes.modelViewer
                          ? modelArgs // Gunakan argumen model jika ada
                          : config.routeName == AppRoutes.web
                              ? webArgs
                              : config.routeName == AppRoutes.produkIklim
                                  ? config.arguments
                                  : null); // Navigasi ke rute yang ditentukan
                } else if (config.onTap != null) {
                  config.onTap!();
                }
              },
            ))
        .toList();
  }

  List<Widget> _buildAppBarActions(BuildContext ctx) {
    return appBarActions ??
        [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(ctx, AppRoutes.settingPage);
            },
          ),
        ];
  }

  Widget _buildTopIcons(BuildContext context) {
    return Positioned(
      top: 16,
      left: 16,
      right: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => print('Left icon pressed!'),
            icon: SvgPicture.asset("assets/icons/SmallLogo.svg"),
          ),
          IconButton(
            onPressed: () {
              print('Right icon pressed!');
              Navigator.pushNamed(context, AppRoutes.settingPage);
            },
            icon: SvgPicture.asset("assets/icons/Setting.svg"),
          ),
        ],
      ),
    );
  }
}

class MenuButtonConfig {
  final String imagePath;
  final String? routeName;
  final VoidCallback? onTap;
  final Object? arguments; // Tambahan: Argumen untuk navigasi

  MenuButtonConfig({
    required this.imagePath,
    this.routeName,
    this.onTap,
    this.arguments, // Tambahan: Argumen untuk navigasi
  });
}
