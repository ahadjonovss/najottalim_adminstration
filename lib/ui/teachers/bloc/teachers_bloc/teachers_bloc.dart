import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

part 'taechers_event.dart';
part 'teachers_state.dart';

class TeachersBloc extends Bloc<TeachersEvent, TeachersState> {
  TeachersBloc() : super(TeachersState(teachers: [], groups: [])) {
    on<GetAllTeachersEvent>(getAllTeachers);
    on<GetTeachersGroupsEvent>(getTeachersGroups);
  }

  getAllTeachers(GetAllTeachersEvent event, emit) async {
    emit(state.copyWith(status: ResponseStatus.inProgress));
    MyResponse myResponse = await getIt<TeachersRepository>().getAllTeachers();
    if (myResponse.message.isNull) {
      emit(state.copyWith(
          status: ResponseStatus.inSuccess, teachers: myResponse.data));
    } else {
      emit(state.copyWith(status: ResponseStatus.inFail));
    }
  }

  getTeachersGroups(GetTeachersGroupsEvent event, emit) async {
    emit(state.copyWith(groupsStatus: ResponseStatus.inProgress));
    MyResponse myResponse =
        await getIt<TeachersRepository>().getTeachersGroup(event.groupIds);
    if (myResponse.message.isNull) {
      emit(state.copyWith(
          groupsStatus: ResponseStatus.inSuccess, groups: myResponse.data));
    } else {
      emit(state.copyWith(groupsStatus: ResponseStatus.inFail));
    }
  }
}
