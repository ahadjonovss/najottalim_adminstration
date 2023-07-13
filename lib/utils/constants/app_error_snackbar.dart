import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class AppErrorSnackBar extends StatelessWidget {
  final String text;
  const AppErrorSnackBar({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppColors.cWhite,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1.r, color: AppColors.cFF3333)),
      width: width(context) * 0.95,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.error, color: Colors.red),
            Container(
              height: height(context) * 0.04,
              width: 1.w,
              color: AppColors.cD3D3D3,
            ),
            Text(
              text,
              maxLines: 5,
              style: AppTextStyles.labelMedium(context,
                  fontSize: 14.h, color: Colors.black),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
