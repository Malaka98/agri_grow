class PredictResult {
  final String label;
  final String detectionResults;

  PredictResult({
    required this.label,
    required this.detectionResults,
  });

  factory PredictResult.fromJson(Map<String, dynamic> json) => PredictResult(
        label: json["label"],
        detectionResults: json["detection_results"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "detection_results": detectionResults,
      };
}
