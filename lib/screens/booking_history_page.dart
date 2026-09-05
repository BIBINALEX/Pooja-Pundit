import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pooja_pundit/gen/assets.gen.dart';
import '../services/api/backend_models.dart';
import '../providers/booking_provider.dart';

class BookingHistoryPage extends ConsumerWidget {
  const BookingHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bookingProvider);

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      children: [
        const Gap(12),
        Text(
          'Past bookings',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
        ),
        const Gap(16),
        if (state.isLoadingPast && state.past.isEmpty)
          const Center(child: CircularProgressIndicator())
        else if (state.past.isEmpty)
          const Center(child: Text('No completed bookings yet.'))
        else
          ...state.past.map((request) => _BookingHistoryCard(request: request)),
        if (state.pastTotalPages > 1) ...[
          const Gap(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: state.pastPage > 1 && !state.isLoadingPast
                    ? () => ref
                          .read(bookingProvider.notifier)
                          .loadPastBookings(page: state.pastPage - 1)
                    : null,
                icon: const Icon(Icons.chevron_left),
                tooltip: 'Previous page',
              ),
              Text('${state.pastPage} / ${state.pastTotalPages}'),
              IconButton(
                onPressed:
                    state.pastPage < state.pastTotalPages &&
                        !state.isLoadingPast
                    ? () => ref
                          .read(bookingProvider.notifier)
                          .loadPastBookings(page: state.pastPage + 1)
                    : null,
                icon: const Icon(Icons.chevron_right),
                tooltip: 'Next page',
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class _BookingHistoryCard extends StatelessWidget {
  const _BookingHistoryCard({required this.request});

  final PoojaRequest request;

  @override
  Widget build(BuildContext context) {
    final status = request.status.toString().toUpperCase();
    final statusColor = _statusColor(status);
    final createdDate = _formatDate(request.createdAt);
    final completedDate = _formatDate(request.completedAt);

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFFF8F0), Colors.white],
        ),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFFFD6A8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(40),
            blurRadius: 13,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Assets.lib.assets.images.bookingIcon.image(
                  height: 64.h,
                  width: 64.h,
                ),
                Gap(12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request.service.isNotEmpty
                            ? request.service
                            : 'Puja Service',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1E2939),
                        ),
                      ),
                      Gap(4.h),
                      Text(
                        request.diety.isNotEmpty
                            ? request.diety
                            : 'Diety not specified',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: const Color(0xFF99A1AF),
                        ),
                      ),
                      Gap(8.h),
                      Wrap(
                        spacing: 6.w,
                        runSpacing: 6.h,
                        children: [
                          _Tag(label: _statusLabel(status), color: statusColor),
                          if (request.crowdPrayer)
                            const _Tag(
                              label: 'CROWD PRAYER',
                              color: Color(0xFFFF6B00),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(14.h),
            const Divider(height: 1, color: Color(0xFFFFD6A8)),
            Gap(12.h),
            _InfoRow(
              icon: Icons.person_outline,
              label: 'Booked for',
              value: request.fullname.isNotEmpty
                  ? request.fullname
                  : 'Name not provided',
            ),
            _InfoRow(
              icon: Icons.auto_awesome_outlined,
              label: 'Birth star',
              value: request.birthStar,
            ),
            _InfoRow(
              icon: Icons.cake_outlined,
              label: 'Date of birth',
              value: request.formattedDob,
            ),
            _InfoRow(
              icon: Icons.event_outlined,
              label: 'Booked on',
              value: createdDate,
            ),
            if (request.pandit != null)
              _InfoRow(
                icon: Icons.person_pin_outlined,
                label: 'Pandit',
                value: request.pandit?.name ?? '-',
              ),
            if (completedDate != '-')
              _InfoRow(
                icon: Icons.check_circle_outline,
                label: 'Completed',
                value: completedDate,
              ),
            if (request.notes.trim().isNotEmpty)
              _InfoRow(
                icon: Icons.notes_outlined,
                label: 'Notes',
                value: request.notes,
              ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String? value) {
    final date = value == null ? null : DateTime.tryParse(value);
    return date == null
        ? '-'
        : DateFormat('dd MMM yyyy, h:mm a').format(date.toLocal());
  }

  String _statusLabel(String status) {
    return status
        .replaceAll('_', ' ')
        .toLowerCase()
        .split(' ')
        .map(
          (word) => word.isEmpty
              ? word
              : '${word[0].toUpperCase()}${word.substring(1)}',
        )
        .join(' ');
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'COMPLETED':
        return Colors.green.shade700;
      case 'ACCEPTED':
        return Colors.blue.shade700;
      case 'REJECTED':
      case 'EXPIRED':
      case 'NO_PANDIT_AVAILABLE':
        return Colors.red.shade700;
      default:
        return Colors.orange.shade800;
    }
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 9.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16.r, color: const Color(0xFF99A1AF)),
          Gap(8.w),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 11.sp,
                  color: const Color(0xFF1E2939),
                ),
                children: [
                  TextSpan(
                    text: '$label  ',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(text: value),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
