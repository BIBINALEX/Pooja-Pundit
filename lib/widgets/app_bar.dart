import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pooja_pundit/gen/assets.gen.dart';
import 'package:pooja_pundit/l10n/generated/app_localizations.dart';
import 'package:pooja_pundit/services/socket_service.dart';
import '../providers/booking_provider.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(71.h);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bookingProvider);
    final controller = ref.read(bookingProvider.notifier);
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      shadowColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leadingWidth: 143.h,
      bottom: null,
      leading: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Assets.lib.assets.images.homeLogo.svg(
            height: 46.h,
            width: 143.h,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: ActionChip(
            side: BorderSide(color: const Color(0xFFF0E0C0)),
            label: Text(_statusLabel(context, state.status)),
            backgroundColor: state.status == PanditStatus.online
                ? Colors.green.shade50
                : state.status == PanditStatus.busy
                ? Colors.amber.shade50
                : Colors.orange.shade50,
            onPressed: controller.toggleConnection,
          ),
        ),
      ],
    );
  }

  String _statusLabel(BuildContext context, PanditStatus status) {
    final l10n = AppLocalizations.of(context);
    switch (status) {
      case PanditStatus.online:
        return l10n.statusOnline;
      case PanditStatus.busy:
        return l10n.statusBusy;
      case PanditStatus.offline:
        return l10n.statusOffline;
    }
  }
}
