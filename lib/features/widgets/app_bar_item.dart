import 'package:flutter/material.dart';

import '../../core/config/theme/app_colors.dart';

class AppBarIItem extends StatelessWidget {
  const AppBarIItem({super.key, this.onTap, this.child});

  final void Function()? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: AppColors.appBarItemBgColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      ),
    );
  }
}
