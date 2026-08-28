import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../providers/booking_provider.dart';

class PastPage extends ConsumerWidget {
  const PastPage({super.key});

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
        if (state.past.isEmpty)
          const Center(child: Text('No completed bookings yet.'))
        else
          ...state.past.map(
            (request) => Container(
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
              child: ListTile(
                title: Text(request.fullname),
                subtitle: Text('${request.service} • ${request.diety}'),
                trailing: const Icon(Icons.check_circle, color: Colors.green),
              ),
            ),
          ),
      ],
    );
  }
}
