part of 'add_group_bloc.dart';

@immutable
abstract class AddGroupEvent {}

class UpdateGroupInfoEvent extends AddGroupEvent {
  String? groupName;
  String? room;
  String? lessonTime;
  UpdateGroupInfoEvent({this.room, this.lessonTime, this.groupName});
}

class SaveGroupEvent extends AddGroupEvent {}
