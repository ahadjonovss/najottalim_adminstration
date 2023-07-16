import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

part 'add_student_to_group_event.dart';
part 'add_student_to_group_state.dart';

class AddStudentToGroupBloc
    extends Bloc<AddStudentToGroupEvent, AddStudentToGroupState> {
  AddStudentToGroupBloc()
      : super(AddStudentToGroupState(selectedStudents: [])) {
    on<SelectStudentEvent>(selectStudent);
    on<AddStudentsToTheGroupEvent>(addStudentsToTheGroup);
  }

  selectStudent(SelectStudentEvent event, emit) {
    List<StudentModel> students = state.selectedStudents;
    if (students.contains(event.student)) {
      students.remove(event.student);
    } else {
      students.add(event.student);
    }
    emit(state.copyWith(selectedStudents: students));
  }

  addStudentsToTheGroup(AddStudentsToTheGroupEvent event, emit) async {
    emit(state.copyWith(status: ResponseStatus.inProgress));
    List students = [];
    students.addAll(event.students);
    students.addAll(state.selectedStudents.map((e) => e.docId));
    MyResponse myResponse = await getIt<GroupsRepository>()
        .addStudentsToTheGroup(event.groupId, students);
    if (myResponse.message.isNull) {
      emit(state.copyWith(status: ResponseStatus.inSuccess));
    } else {
      emit(state.copyWith(
          status: ResponseStatus.inFail, message: myResponse.message));
    }
  }
}
