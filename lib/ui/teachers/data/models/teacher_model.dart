class TeacherModel {
  final String name;
  final String surname;
  List groups;
  final List groupIds;
  final String teacherId;
  final String userId;

  TeacherModel(
      {required this.surname,
      required this.userId,
      required this.name,
      required this.groupIds,
      required this.groups,
      required this.teacherId});

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
        surname: json["surname"] ?? '',
        groupIds: json["groupIds"] ?? [],
        userId: json["userId"] ?? '',
        name: json["name"] ?? '',
        groups: [],
        teacherId: json["teacherId"] ?? '');
  }

  toJson() {
    return {
      "name": name,
      "userId": userId,
      "surname": surname,
      "groupIds": groupIds,
      "teacherId": teacherId
    };
  }
}
