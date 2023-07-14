import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class AddStudentToGroupPage extends StatelessWidget {
  GroupModel group;
  AddStudentToGroupPage({required this.group, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
        title: Text(group.groupName),
        centerTitle: false,
      ),
      body: BlocBuilder<StudentsBloc, StudentsState>(
        builder: (context, state) {
          if (state.status == ResponseStatus.inSuccess) {
            List<StudentModel> students = state.students;
            return ListView.builder(
                shrinkWrap: true,
                itemCount: students.length,
                itemBuilder: (context, index) =>
                    SelectableStudentItem(student: students[index]));
          }
          return Container();
        },
      ),
    );
  }
}
