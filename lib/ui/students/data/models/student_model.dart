import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class StudentModel {
  final String userId;
  final String docId;
  final String groupId;
  final String name;
  final String surname;
  final List balls;
  GroupModel? group;

  StudentModel(
      {required this.balls,
      required this.docId,
      this.group,
      required this.groupId,
      required this.name,
      required this.surname,
      required this.userId});

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
        balls: json['balls'].map((e) => BallModel.fromJson(e)).toList(),
        docId: json["docId"],
        groupId: json["groupId"],
        name: json["name"],
        surname: json["surname"],
        userId: json["userId"]);
  }

  toJson() {
    return {
      "balls": [],
      "docId": docId,
      "groupId": groupId,
      "name": name,
      "surname": surname,
    };
  }
}
