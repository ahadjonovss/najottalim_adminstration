import 'package:najottalim_adminstration/utils/tools/file_importer.dart';

class CustomShimmer extends StatelessWidget {
  Widget child;
  Color? color;
  CustomShimmer({this.color, required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: color ?? Colors.grey.shade300,
      highlightColor: Colors.white,
      child: child,
    );
  }
}

class TextShimmer extends StatelessWidget {
  double? height1;
  double? width1;
  double? borderRadius;
  TextShimmer({this.width1, this.borderRadius, this.height1, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Container(
        height: height1 ?? height(context) * 0.02,
        width: width1 ?? width(context) * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.h),
            color: AdaptiveTheme.of(context).theme.backgroundColor),
      ),
    );
  }
}
