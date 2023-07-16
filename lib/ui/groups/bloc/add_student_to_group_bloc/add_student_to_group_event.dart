part of 'add_student_to_group_bloc.dart';

@immutable
abstract class AddStudentToGroupEvent {}

class SelectStudentEvent extends AddStudentToGroupEvent {
  StudentModel student;
  SelectStudentEvent(this.student);
}

class AddStudentsToTheGroupEvent extends AddStudentToGroupEvent {
  String groupId;
  List students;

  AddStudentsToTheGroupEvent(this.students, this.groupId);
}
