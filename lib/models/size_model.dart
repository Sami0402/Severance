class SizeModel {
  final String size;
  final bool isSelected;
  final String id;

  SizeModel({
    required this.size,
    required this.isSelected,
    required this.id,
  });

  factory SizeModel.fromJson(Map<String, dynamic> json) {
    return SizeModel(
      size: json['size'],
      isSelected: json['isSelected'],
      id: json['_id'],
    );
  }
}
