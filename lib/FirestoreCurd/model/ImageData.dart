class ImageData {
  String id;
  String imageUrl;

  ImageData({required this.id, required this.imageUrl});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
    };
  }

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }
}
