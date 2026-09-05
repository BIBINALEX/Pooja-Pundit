import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pooja_pundit/services/api/backend_models.dart';
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
        final controller = ref.read(bookingProvider.notifier);
        controller.connect();
        controller.loadPastBookings();
        _connected = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bookingProvider);
    final controller = ref.read(bookingProvider.notifier);

    ref.listen<BookingState>(bookingProvider, (previous, next) {
      if (next.alertMessage != null &&
          next.alertMessage != previous?.alertMessage) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(next.alertMessage!)));
      }
    });

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
        _AnimatedBookingList(
          bookings: state.available,
          isBusy: state.isBusy,
          pendingBookingId: state.pendingBookingId,
          pendingAction: state.pendingAction,
          onAccept: controller.acceptRequest,
          onReject: controller.rejectRequest,
        ),
      ],
    );
  }
}

class _AnimatedBookingList extends StatefulWidget {
  const _AnimatedBookingList({
    required this.bookings,
    required this.isBusy,
    required this.pendingBookingId,
    required this.pendingAction,
    required this.onAccept,
    required this.onReject,
  });

  final List<PoojaRequest> bookings;
  final bool isBusy;
  final int? pendingBookingId;
  final BookingAction? pendingAction;
  final ValueChanged<PoojaRequest> onAccept;
  final ValueChanged<PoojaRequest> onReject;

  @override
  State<_AnimatedBookingList> createState() => _AnimatedBookingListState();
}

class _AnimatedBookingListState extends State<_AnimatedBookingList> {
  final _listKey = GlobalKey<AnimatedListState>();
  late final List<PoojaRequest> _bookings;

  @override
  void initState() {
    super.initState();
    _bookings = [...widget.bookings];
  }

  @override
  void didUpdateWidget(covariant _AnimatedBookingList oldWidget) {
    super.didUpdateWidget(oldWidget);
    final nextIds = widget.bookings.map((booking) => booking.id).toSet();
    for (var index = _bookings.length - 1; index >= 0; index--) {
      if (!nextIds.contains(_bookings[index].id)) {
        final removed = _bookings.removeAt(index);
        _listKey.currentState?.removeItem(
          index,
          (context, animation) => _buildItem(removed, animation),
          duration: const Duration(milliseconds: 250),
        );
      }
    }
    for (var index = 0; index < widget.bookings.length; index++) {
      final booking = widget.bookings[index];
      final currentIndex = _bookings.indexWhere(
        (item) => item.id == booking.id,
      );
      if (currentIndex == -1) {
        _bookings.insert(index, booking);
        _listKey.currentState?.insertItem(
          index,
          duration: const Duration(milliseconds: 250),
        );
      } else {
        _bookings[currentIndex] = booking;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedList(
          key: _listKey,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          initialItemCount: _bookings.length,
          itemBuilder: (context, index, animation) =>
              _buildItem(_bookings[index], animation),
        ),
        if (_bookings.isEmpty)
          const Center(child: Text('No bookings available right now.')),
      ],
    );
  }

  Widget _buildItem(PoojaRequest request, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: BookingCard(
          request: request,
          isBusy: widget.isBusy,
          isAcceptPending:
              widget.pendingBookingId == request.id &&
              widget.pendingAction == BookingAction.accepting,
          isRejectPending:
              widget.pendingBookingId == request.id &&
              widget.pendingAction == BookingAction.rejecting,
          onAccept: () => widget.onAccept(request),
          onReject: () => widget.onReject(request),
        ),
      ),
    );
  }
}
