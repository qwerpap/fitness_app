import 'package:fitness_app/constants/app_strings.dart';
import 'package:fitness_app/constants/image_source.dart';
import 'package:fitness_app/core/navigation/constants/navigation_constants.dart';
import 'package:fitness_app/core/navigation/constants/navigation_sizes.dart'
    show NavigationSizes;
import 'package:fitness_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;
  const ScaffoldWithNavBar({
    super.key,
    required this.navigationShell,
    required this.children,
  });

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  void _onTap(BuildContext context, int index) {
    _pageController.animateToPage(
      index,
      duration: NavigationConstants.swipeAnimationDuration,
      curve: NavigationConstants.swipeAnimationCurve,
    );
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.navigationShell.currentIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: widget.children,
      ),
      bottomNavigationBar: SizedBox(
        height: NavigationSizes.navbarHeight,
        child: BottomNavigationBar(
          // selectedLabelStyle: AppTextStyles.navLabelActiveWhiteTheme,
          // unselectedLabelStyle: AppTextStyles.navLabelInactiveWhiteTheme,
          selectedItemColor: AppColors.navActiveColor,
          currentIndex: widget.navigationShell.currentIndex,
          onTap: (int index) => _onTap(context, index),
          items: [
            getBottomNavigationBarItem(
              AppColors.navActiveColor,
              AppColors.navInactiveColor,
              ImageSource.navHome,
              AppStrings.navHome,
            ),
            getBottomNavigationBarItem(
              AppColors.navActiveColor,
              AppColors.navInactiveColor,
              ImageSource.navHome,
              AppStrings.navHome,
            ),
            getBottomNavigationBarItem(
              AppColors.navActiveColor,
              AppColors.navInactiveColor,
              ImageSource.navHome,
              AppStrings.navHome,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem getBottomNavigationBarItem(
    Color activeColor,
    Color inactiveColor,
    String svgAssetName,
    String label,
  ) => BottomNavigationBarItem(
    icon: SvgPicture.asset(
      svgAssetName,
      height: NavigationSizes.iconHeight,
      colorFilter: ColorFilter.mode(inactiveColor, BlendMode.srcIn),
    ),
    activeIcon: SvgPicture.asset(
      svgAssetName,
      height: NavigationSizes.iconHeight,
      colorFilter: ColorFilter.mode(activeColor, BlendMode.srcIn),
    ),
    label: label,
  );
}
