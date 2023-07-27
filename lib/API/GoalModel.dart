class Goal {
  String name;
  List<Map<String, String>> reason;
  List<Map<String, String>> identityStatement;
  List<Map<String, String>> visualizingYourSelf;
  int userId;
  int? goalId;
  int goalCategoryId;

  Goal({
    required this.name,
    required this.reason,
    required this.identityStatement,
    required this.visualizingYourSelf,
    required this.userId,
    this.goalId,
    required this.goalCategoryId,
  });

  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(
      name: json['name'],
      reason: (json['reason'] as List)
          .map((item) => Map<String, String>.from(item))
          .toList(),
      identityStatement: (json['identityStatement'] as List)
          .map((item) => Map<String, String>.from(item))
          .toList(),
      visualizingYourSelf: (json['visualizingYourSelf'] as List)
          .map((item) => Map<String, String>.from(item))
          .toList(),
      userId: json['userId'],
      goalId: json['goalId'],
      goalCategoryId: json['goalCategoryId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {
      'name': name,
      'reason': reason,
      'identityStatement': identityStatement,
      'visualizingYourSelf': visualizingYourSelf,
      'userId': userId,
      'goalCategoryId': goalCategoryId,
    };

    if (goalId != null) {
      jsonData['goalId'] = goalId;
    }

    return jsonData;
  }
}
