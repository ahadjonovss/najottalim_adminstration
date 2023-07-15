part of 'groups_bloc.dart';

@immutable
abstract class GroupsEvent {}

class GetAllGroupsEvent extends GroupsEvent {}

class GetGroupsStudentsEvent extends GroupsEvent {
  List studentIds;
  GetGroupsStudentsEvent(this.studentIds);
}
