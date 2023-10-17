class YieldResult {
  final String msg;

  YieldResult({
    required this.msg,
  });

  factory YieldResult.fromJson(Map<String, dynamic> json) => YieldResult(
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
      };
}
