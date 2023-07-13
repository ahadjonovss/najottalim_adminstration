part of 'add_student_bloc.dart';

@immutable
abstract class AddStudentEvent {}

class UpdateInfoEvent extends AddStudentEvent {
  String? name;
  String? surname;
  UpdateInfoEvent({this.surname, this.name});
}
