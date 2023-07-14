import 'package:najottalim_adminstration/ui/students/data/models/group_model.dart';

class TeacherModel {
  final String name;
  final String surname;
  final List<GroupModel> groups;
  final String teacherId;
  final String userId;

  TeacherModel(
      {required this.surname,
      required this.userId,
      required this.name,
      required this.groups,
      required this.teacherId});

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
        surname: json["surname"],
        userId: json["userId"] ?? '',
        name: json["name"],
        groups: json["groups"].map((e) => GroupModel.fromJson(e)).toList(),
        teacherId: json["teacherId"] ?? '');
  }

  toJson() {
    return {
      "name": name,
      "userId": userId,
      "surname": surname,
      "groups": groups.map((e) => e.toJson()),
      "teacherId": teacherId
    };
  }
}
