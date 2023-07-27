import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oruphones/src/presentation/widgets/widgets.dart';
import 'package:oruphones/src/ui/ui.dart';

class OruAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OruAppBar({
    super.key,
    this.appBarHeight = kToolbarHeight * 2,
    this.iconColor = Colors.white,
    this.onSearchBarTap,
    this.shouldFocusSearchBar = false,
  });

  final double appBarHeight;
  final Color iconColor;
  final VoidCallback? onSearchBarTap;
  final bool shouldFocusSearchBar;

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
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
            Padding(
              padding: OruPadding.searchBarOuter,
              child: OruSearchBar(
                onTap: onSearchBarTap,
                shouldFocusSearch: shouldFocusSearchBar,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
