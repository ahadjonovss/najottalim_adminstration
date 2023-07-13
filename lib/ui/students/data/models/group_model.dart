class GroupModel {
  final String lessonTime;
  final String groupName;
  final String room;

  GroupModel(
      {required this.groupName, required this.lessonTime, required this.room});

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
        groupName: json["name"],
        lessonTime: json["lessonTime"],
        room: json["room"]);
  }
}
