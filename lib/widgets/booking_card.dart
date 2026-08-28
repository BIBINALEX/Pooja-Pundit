import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/pooja_request.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    super.key,
    required this.request,
    required this.onAccept,
    required this.onReject,
    required this.isBusy,
  });

  final PoojaRequest request;
  final VoidCallback onAccept;
  final VoidCallback onReject;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
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
                Chip(
                  side: BorderSide(color: const Color(0xFFF0E0C0)),
                  label: Text(request.service),
                  backgroundColor: Colors.white,
                ),
              ],
            ),
            const Gap(8),
            _infoRow('DOB', request.formattedDob),
            _infoRow('Birth Star', request.birthStar),
            _infoRow('Diety', request.diety),
            _infoRow('Crowd Prayer', request.crowdPrayer ? 'Yes' : 'No'),
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
                    icon: isBusy
                        ? null
                        : const Icon(Icons.check_circle_outline),
                    label: Text(
                      isBusy ? 'Finish current task first' : 'Accept request',
                    ),
                  ),
                ),
                const Gap(8),
                IconButton(
                  onPressed: isBusy ? null : onReject,
                  tooltip: 'Reject request',
                  icon: const Icon(Icons.close),
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
