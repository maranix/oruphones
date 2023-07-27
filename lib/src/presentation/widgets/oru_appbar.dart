import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oruphones/src/presentation/widgets/widgets.dart';
import 'package:oruphones/src/ui/ui.dart';

class OruAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OruAppBar({
    super.key,
    this.appBarHeight = kToolbarHeight * 2,
    this.iconColor = Colors.white,
  });

  final double appBarHeight;
  final Color iconColor;

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                  ),
                  color: OruColors.appBarIcon,
                ),
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  colorFilter: const ColorFilter.mode(
                    OruColors.appBarIcon,
                    BlendMode.srcIn,
                  ),
                ),
                const Spacer(),
                const AppBarLocationButton(),
                const AppBarNotificationsButton(),
              ],
            ),
            const Padding(
              padding: OruPadding.searchBarOuter,
              child: OruSearchBar(),
            ),
          ],
        ),
      ),
    );
  }
}
