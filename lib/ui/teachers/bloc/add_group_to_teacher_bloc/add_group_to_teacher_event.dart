part of 'add_group_to_teacher_bloc.dart';

@immutable
abstract class AddGroupToTeacherEvent {}

class SelectGroupEvent extends AddGroupToTeacherEvent {
  GroupModel group;
  SelectGroupEvent(this.group);
}

class AddGroupsToTheTeacherEvent extends AddGroupToTeacherEvent {
  String teacherId;
  List groups;

  AddGroupsToTheTeacherEvent(this.groups, this.teacherId);
}
