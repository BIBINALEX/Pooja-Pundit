import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pooja_pundit/l10n/generated/app_localizations.dart';
import '../gen/assets.gen.dart';

class TabBottomBar extends StatelessWidget {
  const TabBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final List<_BottomBarItem> items = [
      _BottomBarItem(
        icon: Assets.lib.assets.images.homeTab,
        label: l10n.tabHome,
      ),
      _BottomBarItem(
        icon: Assets.lib.assets.images.activityTab,
        label: l10n.tabActivity,
      ),
      _BottomBarItem(
        icon: Assets.lib.assets.images.profileTab,
        label: l10n.tabAccount,
      ),
    ];

    return SafeArea(
      top: false,
      bottom: Theme.of(context).platform == TargetPlatform.android,
      child: Container(
        height: 92.h,
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          border: Border(top: BorderSide(color: Color(0xFFE0E0E0), width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;

            return GestureDetector(
              onTap: () => onTap(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40.h,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? const Color(0xFFFF6D00)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: item.icon.svg(
                        height: 22.h,
                        width: 22.h,
                        color: currentIndex == index
                            ? Colors.white
                            : const Color(0xFF99A1AF),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 11.h,
                      fontWeight: currentIndex == index
                          ? FontWeight.w500
                          : FontWeight.w400,
                      color: currentIndex == index
                          ? const Color(0xFFFF6D00)
                          : const Color(0xFF99A1AF),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _BottomBarItem {
  const _BottomBarItem({required this.icon, required this.label});

  final SvgGenImage icon;
  final String label;
}
