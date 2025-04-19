import 'package:arbmkg_sli/models/video_content.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class VideoPlayerPage extends StatefulWidget {
  final VideoContent videoContent;
  const VideoPlayerPage({
    Key? key,
    required this.videoContent,
  }) : super(key: key);

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  String _currentLanguage = 'Indonesia';
  String? _errorMessage;
  bool _isLoading = false;
  bool _hasInternetConnection = true;

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _updateConnectionStatus(connectivityResult);

    // Listen to connectivity changes
    Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    setState(() {
      _hasInternetConnection = result != ConnectivityResult.none;

      if (!_hasInternetConnection) {
        _errorMessage =
            'Tidak ada koneksi internet. Mohon nyalakan data seluler atau WiFi.';
      } else {
        _errorMessage = null;
        // Jika koneksi kembali, coba muat ulang video
        if (_currentLanguage.isNotEmpty) {
          _initializeVideo(widget.videoContent.videoUrls[_currentLanguage]!);
        }
      }
    });
  }

  Future<void> _initializeVideo(String videoUrl) async {
    if (!mounted || !_hasInternetConnection) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Hentikan controller sebelumnya jika ada
      await _videoPlayerController?.dispose();
      _chewieController?.dispose();

      // Inisialisasi controller baru
      _videoPlayerController = VideoPlayerController.network(videoUrl);

      // Timeout setelah 10 detik jika video tidak terload
      await _videoPlayerController!.initialize().timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception(
              'Timeout: Video terlalu lama dimuat. Periksa koneksi internet Anda.');
        },
      );

      if (!_videoPlayerController!.value.isInitialized) {
        throw Exception('Video tidak dapat diinisialisasi');
      }

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        autoPlay: true,
        looping: false,
        aspectRatio: _videoPlayerController!.value.aspectRatio,
        placeholder: Container(color: Colors.grey),
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.signal_wifi_off, size: 50, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _initializeVideo(videoUrl),
                  child: const Text('Coba Lagi'),
                ),
              ],
            ),
          );
        },
      );
    } catch (e) {
      _errorMessage = 'Gagal memuat video: ${e.toString()}';
      debugPrint('Error loading video: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _changeLanguage(String language) {
    if (language != _currentLanguage && _hasInternetConnection) {
      setState(() {
        _currentLanguage = language;
      });
      _initializeVideo(widget.videoContent.videoUrls[language]!);
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.videoContent.title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _hasInternetConnection ? Icons.wifi : Icons.signal_wifi_off,
              color: _hasInternetConnection ? Colors.green : Colors.red,
            ),
            onPressed: () => _checkInternetConnection(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Dropdown untuk memilih bahasa (hanya aktif jika ada internet)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AbsorbPointer(
              absorbing: !_hasInternetConnection,
              child: Opacity(
                opacity: _hasInternetConnection ? 1.0 : 0.5,
                child: DropdownButton<String>(
                  value: _currentLanguage,
                  items: <String>['Indonesia', 'Sunda', 'Jawa']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      _changeLanguage(newValue);
                    }
                  },
                  hint: const Text('Pilih Bahasa'),
                ),
              ),
            ),
          ),

          // Tampilkan error jika ada
          if (_errorMessage != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 40,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _hasInternetConnection
                        ? () => _initializeVideo(
                            widget.videoContent.videoUrls[_currentLanguage]!)
                        : _checkInternetConnection,
                    child: Text(_hasInternetConnection
                        ? 'Coba Lagi'
                        : 'Periksa Koneksi'),
                  ),
                ],
              ),
            ),

          // Pemutar video atau loading indicator
          Expanded(
            child: Center(
              child: !_hasInternetConnection
                  ? _buildNoInternetWidget()
                  : _isLoading
                      ? _buildLoadingWidget()
                      : _chewieController != null &&
                              _chewieController!
                                  .videoPlayerController.value.isInitialized
                          ? Chewie(controller: _chewieController!)
                          : _buildInitialWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoInternetWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.signal_wifi_off, size: 80, color: Colors.red),
        const SizedBox(height: 16),
        const Text(
          'Tidak Ada Koneksi Internet',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Mohon nyalakan data seluler atau WiFi untuk memutar video',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _checkInternetConnection,
          child: const Text('Periksa Koneksi'),
        ),
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 16),
        Text('Memuat video...'),
      ],
    );
  }

  Widget _buildInitialWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.language, size: 50, color: Colors.blue),
        const SizedBox(height: 16),
        const Text(
          'Pilih bahasa untuk memutar video',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => _initializeVideo(
              widget.videoContent.videoUrls[_currentLanguage]!),
          child: const Text('Muat Ulang Video'),
        ),
      ],
    );
  }
}
