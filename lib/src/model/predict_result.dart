class PredictResult {
  final String detectionResults;

  PredictResult({
    required this.detectionResults,
  });

  factory PredictResult.fromJson(Map<String, dynamic> json) => PredictResult(
        detectionResults: json["detection_results"],
      );

  Map<String, dynamic> toJson() => {
        "detection_results": detectionResults,
      };
}