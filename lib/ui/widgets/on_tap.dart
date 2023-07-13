import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class OnTap extends StatelessWidget {
  Widget child;
  VoidCallback onTap;
  OnTap({required this.child, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(onTap: onTap, child: child);
  }
}
