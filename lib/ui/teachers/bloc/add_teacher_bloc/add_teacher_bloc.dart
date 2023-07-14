import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

part 'add_teacher_event.dart';
part 'add_teacher_state.dart';

class AddTeacherBloc extends Bloc<AddTeacherEvent, AddTeacherState> {
  AddTeacherBloc() : super(AddTeacherState()) {
    on<UpdateTeacherInfoEvent>(updateInfo);
    on<SaveTeacherEvent>(addTeacher);
  }

  updateInfo(UpdateTeacherInfoEvent event, emit) {
    emit(state.copyWith(
        surname: event.surname,
        name: event.name,
        email:
            "${(event.name ?? state.name).toLowerCase()}${(event.surname ?? state.surname).toLowerCase()}${DateTime.now().second}t@gmail.com"));
  }

  addTeacher(SaveTeacherEvent event, emit) async {
    emit(state.copyWith(status: ResponseStatus.inProgress));
    MyResponse myResponse = await getIt<TeachersRepository>().addTeacher(
        TeacherModel(
            surname: state.surname,
            userId: '',
            name: state.name,
            groups: [],
            teacherId: ''),
        state.email);

    if (myResponse.message.isNull) {
      emit(state.copyWith(status: ResponseStatus.inSuccess));
    } else {
      emit(state.copyWith(status: ResponseStatus.inFail));
    }
    emit(state.copyWith(status: ResponseStatus.pure));
  }
}
