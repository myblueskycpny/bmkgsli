import 'package:arbmkg_sli/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

abstract class DetailBasePage extends StatelessWidget {
  final String title;
  final Widget? customHeader;
  final String thumbnailPath;
  final bool showPlayButton;
  final String description;
  final String routeNameVideo;
  final String routeNameButton;
  final String buttonName;
  final Object videoArguments;

  const DetailBasePage({
    super.key,
    this.customHeader,
    required this.thumbnailPath,
    this.showPlayButton = false,
    required this.description,
    this.routeNameVideo = AppRoutes.videoPlayerPage,
    this.routeNameButton = AppRoutes.pengenalanSli,
    this.buttonName = "Lihat Video",
    this.videoArguments = const {},
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: _buildAppBarActions(context),
      ),
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom:
                  MediaQuery.of(context).size.height * 0.1, // Space for button
            ),
            child: Column(
              children: [
                _buildThumbnail(context),
                const SizedBox(height: 16),
                customHeader ?? _buildDefaultHeader(),
                const SizedBox(height: 16),
                _buildTextDescription(),
                SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.1), // Extra space
              ],
            ),
          ),

          // Fixed bottom button
        ],
      ),
      bottomNavigationBar: Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: _buildElevatedButton(context, buttonName, routeNameButton),
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
              );
            },
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

  Widget _buildTextDescription() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(19, 0, 19, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          description,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildElevatedButton(
    BuildContext context,
    String buttonName,
    String routeName,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
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
          if (routeName.isNotEmpty) {
            Navigator.pushNamed(context, routeName);
          }
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width, 50),
          backgroundColor: const Color(0xFF003052),
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.black, width: 1),
          ),
        ),
        child: Text(
          buttonName,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAppBarActions(BuildContext ctx) {
    return [
      IconButton(
        icon: const Icon(Icons.settings_outlined, color: Colors.black),
        onPressed: () {
          Navigator.pushNamed(ctx, AppRoutes.settingPage);
        },
      ),
    ];
  }
}
