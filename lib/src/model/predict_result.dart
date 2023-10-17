class PredictResult {
  final String definitionResults;

  PredictResult({
    required this.definitionResults,
  });

  factory PredictResult.fromJson(Map<String, dynamic> json) => PredictResult(
        definitionResults: json["definition_results"],
      );

  Map<String, dynamic> toJson() => {
        "definition_results": definitionResults,
      };
}
