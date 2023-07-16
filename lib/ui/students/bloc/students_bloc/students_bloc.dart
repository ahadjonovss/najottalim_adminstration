import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

part 'students_event.dart';
part 'students_state.dart';

class StudentsBloc extends Bloc<StudentsEvent, StudentsState> {
  StudentsBloc() : super(StudentsState(students: [])) {
    on<GetAllUsersEvent>(getAllUsers);
  }

  getAllUsers(GetAllUsersEvent event, emit) async {
    emit(state.copyWith(status: ResponseStatus.inProgress));
    MyResponse myResponse = await getIt<StudentsRepository>().getAllUsers();
    if (myResponse.message.isNull) {
      emit(state.copyWith(
          status: ResponseStatus.inSuccess, students: myResponse.data));
    } else {
      print(myResponse.message);
      emit(state.copyWith(status: ResponseStatus.inFail));
    }
  }
}
