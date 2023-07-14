import 'package:najottalim_adminstration/ui/students/data/models/student_model.dart';

class GroupModel {
  final String lessonTime;
  final String groupName;
  final String groupId;
  final String room;
  final List students;

  GroupModel(
      {required this.groupName,
      required this.lessonTime,
      required this.room,
      required this.groupId,
      required this.students});

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
        groupId: json["groupId"] ?? '',
        groupName: json["name"] ?? '',
        lessonTime: json["lessonTime"] ?? '',
        students: (json["students"] ?? [])
            .map((e) => StudentModel.fromJson(e))
            .toList(),
        room: json["room"] ?? '');
  }

  toJson() {
    return {
      "name": groupName,
      "lessonTime": lessonTime,
      "room": room,
      "groupId": groupId,
      "students": students
    };
  }
}
