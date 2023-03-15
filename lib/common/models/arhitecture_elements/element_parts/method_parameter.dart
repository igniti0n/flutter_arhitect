class Parameter {
  Parameter({
    required this.parameterName,
    required this.type,
  });

  String parameterName;
  String type;

  factory Parameter.fromMap(Map<String, dynamic> json) => Parameter(
        parameterName: json["parameterName"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "parameterName": parameterName,
        "type": type,
      };
}
