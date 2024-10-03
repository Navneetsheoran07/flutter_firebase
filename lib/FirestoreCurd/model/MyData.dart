class MyData {
  String id;
  String name;
  int value;

  MyData({required this.id, required this.name, required this.value});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'value': value,
    };
  }

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
        id: json['id'] as String,
        name: json['name'] as String,
        value: json['value'] as int,);

}
}
