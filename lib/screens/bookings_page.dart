import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../providers/booking_provider.dart';
import '../widgets/booking_card.dart';

class BookingsPage extends ConsumerStatefulWidget {
  const BookingsPage({super.key});

  @override
  ConsumerState<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends ConsumerState<BookingsPage> {
  bool _connected = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_connected) {
        ref.read(bookingProvider.notifier).connect();
        _connected = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bookingProvider);
    final controller = ref.read(bookingProvider.notifier);

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      children: [
        const Gap(12),
        Text(
          'Available booking opportunities',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
        ),
        const Gap(8),
        Text(
          state.connectionMessage,
          style: TextStyle(color: Colors.grey.shade700),
        ),
        const Gap(16),
        if (state.active != null)
          Container(
            padding: EdgeInsets.all(14.w),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current active booking',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(8),
                Text(
                  state.active!.fullname,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(state.active!.service),
                Text('Diety: ${state.active!.diety}'),
                const Gap(12),
                FilledButton.icon(
                  onPressed: controller.completeActiveBooking,
                  icon: const Icon(Icons.done_all),
                  label: const Text('Complete booking'),
                ),
              ],
            ),
          )
        else
          Container(
            padding: EdgeInsets.all(14.w),
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
            child: const Text(
              'You are free to accept the next available booking.',
            ),
          ),
        const Gap(16),
        if (state.available.isEmpty)
          const Center(child: Text('No bookings available right now.'))
        else
          ...state.available.map(
            (request) => BookingCard(
              request: request,
              isBusy: state.active != null,
              onAccept: () => controller.acceptRequest(request),
              onReject: () => controller.rejectRequest(request),
            ),
          ),
      ],
    );
  }
}
