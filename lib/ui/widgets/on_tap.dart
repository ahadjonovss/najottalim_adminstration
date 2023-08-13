import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class OnTap extends StatelessWidget {
  Widget child;
  VoidCallback onTap;
  VoidCallback? onLongTap;

  OnTap({required this.child, required this.onTap, this.onLongTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(onLongTap: onLongTap, onTap: onTap, child: child);
  }
}
