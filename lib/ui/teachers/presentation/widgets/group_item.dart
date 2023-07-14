import '../../../../utils/tools/file_importer.dart';

class GroupItem extends StatelessWidget {
  GroupModel group;
  GroupItem({required this.group, super.key});

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: () {},
      child: SizedBox(
        width: width(context),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    backgroundColor: AdaptiveTheme.of(context).theme.hintColor,
                    radius: 22,
                    backgroundImage: const AssetImage(AppImages.Logo)),
                SizedBox(
                  width: width(context) * 0.78,
                  child: Text(
                    group.groupName,
                    style: AppTextStyles.labelLarge(context,
                        fontSize: 16.h, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
            SizedBox(height: 6.h),
            Divider(color: AdaptiveTheme.of(context).theme.focusColor),
          ],
        ),
      ),
    );
  }
}
