part of 'add_teacher_bloc.dart';

@immutable
abstract class AddTeacherEvent {}

class UpdateTeacherInfoEvent extends AddTeacherEvent {
  String? name;
  String? surname;
  UpdateTeacherInfoEvent({this.surname, this.name});
}

class SaveTeacherEvent extends AddTeacherEvent {}
