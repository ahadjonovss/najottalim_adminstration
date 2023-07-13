import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

part 'add_student_event.dart';
part 'add_student_state.dart';

class AddStudentBloc extends Bloc<AddStudentEvent, AddStudentState> {
  AddStudentBloc() : super(AddStudentState()) {
    on<UpdateInfoEvent>(updateInfo);
  }

  updateInfo(UpdateInfoEvent event, emit) {
    emit(state.copyWith(
        surname: event.surname,
        name: event.name,
        email:
            "${(event.name ?? '').toLowerCase()}${(event.surname ?? '').toLowerCase()}${DateTime.now().second}@gmail.com"));
  }
}
