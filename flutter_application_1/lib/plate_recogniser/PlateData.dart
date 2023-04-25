class PlateData {
  final String value;
  final double confidence;

  const PlateData({
    required this.value,
    required this.confidence,
  });

  factory PlateData.fromJson(Map<String, dynamic> json) {
    return PlateData(
      value: json['value'], 
      confidence: json['Confidence']
      );
  }
}