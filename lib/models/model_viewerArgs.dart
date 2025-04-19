class ModelViewerArgs {
  final String modelName;
  final String modelPath;
  final List<String>? modelParts;

  ModelViewerArgs({
    required this.modelName,
    required this.modelPath,
    this.modelParts,
  });
}
