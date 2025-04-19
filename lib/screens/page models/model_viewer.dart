import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class ModelViewerPage extends StatefulWidget {
  final String modelPath;
  final String modelName; // Opsional: nama model
  final List<String>? modelParts; // Opsional: sub bagian

  const ModelViewerPage({
    super.key,
    required this.modelName,
    required this.modelPath,
    this.modelParts,
  });

  @override
  State<ModelViewerPage> createState() => _ModelViewerPageState();
}

class _ModelViewerPageState extends State<ModelViewerPage> {
  late Flutter3DController controller;

  @override
  void initState() {
    super.initState();
    controller = Flutter3DController();

    controller.onModelLoaded.addListener(() {
      debugPrint('Loaded model: ${controller.onModelLoaded.value}');
    });
  }

  String? selectedPart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.modelName),
      ),
      body: Column(
        children: [
          Expanded(
            child: Flutter3DViewer(
              src: widget.modelPath,
              controller: controller,
              enableTouch: true,
              onLoad: (_) => controller.playAnimation(),
              onError: (err) => debugPrint('Error: $err'),
            ),
          ),
          if (widget.modelParts != null)
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.modelParts!.length + 1,
                itemBuilder: (ctx, i) {
                  final label = i == 0 ? 'All' : widget.modelParts![i - 1];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(label),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
