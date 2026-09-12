import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pooja_pundit/l10n/generated/app_localizations.dart';
import 'package:pooja_pundit/services/api/backend_models.dart';
import 'package:pooja_pundit/services/localization/catalog_localizations.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    super.key,
    required this.request,
    required this.onAccept,
    required this.onReject,
    required this.isBusy,
    required this.isAcceptPending,
    required this.isRejectPending,
    this.isNew = false,
  });

  final PoojaRequest request;
  final VoidCallback onAccept;
  final VoidCallback onReject;
  final bool isBusy;
  final bool isAcceptPending;
  final bool isRejectPending;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21),
        border: Border.all(color: const Color(0xFFFFE5C4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(40),
            blurRadius: 13,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          request.fullname,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      if (isNew) ...[const _NewBookingBadge(), Gap(8.h)],
                    ],
                  ),
                ),
                Chip(
                  side: BorderSide(color: const Color(0xFFF0E0C0)),
                  label: Text(
                    localizedService(
                      request.service,
                      Localizations.localeOf(context),
                    ),
                  ),
                  backgroundColor: Colors.white,
                ),
              ],
            ),
            const Gap(8),
            _infoRow(l10n.dobShort, request.formattedDob),
            _infoRow(
              l10n.birthStarShort,
              localizedBirthStar(
                request.birthStar,
                Localizations.localeOf(context),
              ),
            ),
            _infoRow(
              l10n.dietyShort,
              localizedDiety(request.diety, Localizations.localeOf(context)),
            ),
            _infoRow(
              l10n.crowdPrayerLabel,
              request.crowdPrayer ? l10n.yes : l10n.no,
            ),
            const Gap(8),
            Text(
              request.notes,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 12.sp),
            ),
            const Gap(12),
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: isBusy ? null : onAccept,
                    icon: isAcceptPending
                        ? SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          )
                        : const Icon(Icons.check_circle_outline),
                    label: Text(
                      isAcceptPending
                          ? l10n.processing
                          : isBusy
                          ? l10n.finishCurrentTaskFirst
                          : l10n.acceptRequest,
                    ),
                  ),
                ),
                const Gap(8),
                IconButton(
                  onPressed: isBusy ? null : onReject,
                  tooltip: l10n.rejectRequestTooltip,
                  icon: isRejectPending
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.close),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w600)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

class _NewBookingBadge extends StatefulWidget {
  const _NewBookingBadge();

  @override
  State<_NewBookingBadge> createState() => _NewBookingBadgeState();
}

class _NewBookingBadgeState extends State<_NewBookingBadge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: 0.94,
        end: 1.06,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
        decoration: BoxDecoration(
          color: const Color(0xFFC42225),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Text(
          'NEW',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.sp,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.4,
          ),
        ),
      ),
    );
  }
}
