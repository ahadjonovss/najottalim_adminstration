part of 'teachers_bloc.dart';

@immutable
abstract class TeachersEvent {}

class GetAllTeachersEvent extends TeachersEvent {}

class GetTeachersGroupsEvent extends TeachersEvent {
  List groupIds;
  GetTeachersGroupsEvent(this.groupIds);
}
