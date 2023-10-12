class Practice {
  String name;
  bool routine;
  List<Map<String, dynamic>> days;

  Practice({
    required this.name,
    required this.routine,
    required this.days,
  });

  factory Practice.fromJson(Map<String, dynamic> json) {
    return Practice(
      name: json['name'],
      routine: json['routine'],
      days: (json['days'] as List)
          .map((item) => Map<String, dynamic>.from(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'routine': routine,
      'days': days,
    };
  }
}
