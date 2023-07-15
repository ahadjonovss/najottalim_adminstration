import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

part 'add_student_event.dart';
part 'add_student_state.dart';

class AddStudentBloc extends Bloc<AddStudentEvent, AddStudentState> {
  AddStudentBloc() : super(AddStudentState()) {
    on<UpdateInfoEvent>(updateInfo);
    on<SaveStudentEvent>(addStudent);
  }

  updateInfo(UpdateInfoEvent event, emit) {
    emit(state.copyWith(
        surname: event.surname,
        name: event.name,
        email:
            "${(event.name ?? state.name).toLowerCase()}${(event.surname ?? state.surname).toLowerCase()}${DateTime.now().second}@gmail.com"));
  }

  addStudent(SaveStudentEvent event, emit) async {
    emit(state.copyWith(status: ResponseStatus.inProgress));
    MyResponse myResponse = await getIt<StudentsRepository>().addStudent(
        StudentModel(
            email: state.email,
            balls: [],
            docId: '',
            groupId: '',
            name: state.name,
            surname: state.surname,
            userId: ''),
        state.email);

    if (myResponse.message.isNull) {
      emit(state.copyWith(status: ResponseStatus.inSuccess));
    } else {
      emit(state.copyWith(status: ResponseStatus.inFail));
    }
    emit(state.copyWith(status: ResponseStatus.pure));
  }
}
